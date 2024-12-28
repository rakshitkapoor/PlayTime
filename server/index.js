const express = require('express');
const http = require('http');
const app=express();
const mongoose=require('mongoose');
const { Socket } = require('socket.io');
const port = process.env.PORT || 3000;

var server=http.createServer(app);

const Room = require('./models/room'); 
const roomModel = require('./models/room');
const { REPL_MODE_SLOPPY } = require('repl');

var io =require('socket.io')(server);

// middleware
// client -> middleware -> server
app.use(express.json());

// test12345

const DB= "mongodb+srv://rakshitkapoor1305:test12345@cluster0.vokx1.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

io.on('connection',(socket)=>{
    console.log("connected");

    socket.on('createRoom', async ({nickname})=>{
        console.log(nickname);
        // create a room
        try{
            let room= new Room();
            let player={
                socketID: socket.id,
                nickname: nickname,
                playerType: 'X',
            };
            room.players.push(player);
            room.turn=player;
            room = await room.save(); // save to mongoDB
    
            const roomID=room._id.toString(); // unique id of the room
    
            socket.join(roomID);
            // tell the client that the room is created
            // io -> send data to everyone
            // socket -> send data to only one client

            io.to(roomID).emit("createRoomSuccess",room);
        } catch(err){
            console.log(err);
        }
        
    })


    socket.on('joinRoom', async ({nickname,roomID})=>{
        try{
            if(!roomID.match(/^[0-9a-fA-F]{24}$/)){
                socket.emit("joinRoomError","Invalid Room ID");
                return;
            }
            let room = await Room.findById(roomID);
            if(room.isJoin){
                let player={
                    nickname: nickname,
                    socketID: socket.id,
                    playerType: 'O',
                }
                socket.join(roomID);
                room.players.push(player);
                room.isJoin=false;
                room = await room.save();

                io.to(roomID).emit("joinRoomSuccess",room);
                io.to(roomID).emit("updatePlayers",room.players);
                io.to(roomID).emit("updateRoom",room);
            }else{
                socket.emit("joinRoomError","Room is full");
                return;
            }
        } catch(err){
            console.log(err);
        }
    });

    socket.on("tap", async ({ index, roomId }) => {
    try {
      let room = await Room.findById(roomId);

      let choice = room.turn.playerType; // x or o
      if (room.turnIndex == 0) {
        room.turn = room.players[1];
        room.turnIndex = 1;
      } else {
        room.turn = room.players[0];
        room.turnIndex = 0;
      }
      room = await room.save();
      io.to(roomId).emit("tapped", {
        index,
        choice,
        room,
      });
    } catch (e) {
      console.log(e);
    }
  });

  socket.on("winner", async ({ winnerSocketId, roomId }) => {
    try {
      if(socket.id!=winnerSocketId){return ;}
      let room = await Room.findById(roomId);
      let player = room.players.find(
        (playerr) => playerr.socketID == winnerSocketId
      );
      player.points += 1;
      room = await room.save();

      if (player.points >= room.maxRounds) {
        io.to(roomId).emit("endGame", player);
      } else {
        io.to(roomId).emit("pointIncrease", player);
      }
    } catch (e) {
      console.log(e);
    }
  });
});

mongoose.connect(DB).then(()=>{
    console.log("connection successful");
}).catch((err)=>{
    console.log(err);
})

server.listen(port, '0.0.0.0',()=>{
    console.log(`Server is running on port ${port}`);
})



