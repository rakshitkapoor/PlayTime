# Multiplayer Socket-Based Tic Tac Toe Game

Welcome to the multiplayer socket-based tic-tac-toe game. This project is a real-time multiplayer game built using Flutter, Socket.IO, Node.js, Express, and MongoDB. Players can connect and compete in a game of tic-tac-toe.

## Table of Contents
- [Project Description](#project-description)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Screenshots](#screenshots)
- [Additional Resources](#additional-resources)

## Project Description
This project is a multiplayer tic-tac-toe game that uses socket-based communication to allow real-time gameplay between multiple players. The game is built with the following technologies:
- **Flutter**: Used for the frontend development.
- **Socket.IO**: Utilized for real-time communication.
- **Node.js and Express**: Used for the backend server.
- **MongoDB**: Utilized for storing game data and user information.

The game is deployed and accessible at: [PlayTime](https://play-time2.vercel.app/#/main-menu)

## Features
- Real-time multiplayer gameplay.
- Responsive design for different devices.
- Easy to set up and use.
- Cross-platform support.

## Installation
To set up the project locally, follow these steps:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/rakshitkapoor/PlayTime.git
    cd PlayTime
    ```

2. **Install dependencies**:
    For the server:
    ```sh
    cd server
    npm install
    ```

    For the Flutter app:
    ```sh
    cd flutter_app
    flutter pub get
    ```

3. **Run the server**:
    ```sh
    cd server
    node app.js
    ```

4. **Run the Flutter app**:
    Ensure you have Flutter installed, then:
    ```sh
    cd flutter_app
    flutter run
    ```

## Usage
1. Start the server as described in the installation steps.
2. Run the Flutter app on your desired platform (iOS, Android, web).
3. Connect with another player and start playing!

## Contributing
We welcome contributions to this project. To contribute, please follow these steps:
1. **Fork the repository**.
2. **Create a new branch**:
    ```sh
    git checkout -b feature-name
    ```
3. **Make your changes**.
4. **Commit your changes**:
    ```sh
    git commit -m "Add feature"
    ```
5. **Push to the branch**:
    ```sh
    git push origin feature-name
    ```
6. **Create a pull request**.

For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Screenshots
![image](https://github.com/user-attachments/assets/10427e1c-defa-4050-b9f5-32dbd4ea1991)

![image](https://github.com/user-attachments/assets/f1188ee4-337b-4586-817c-07e8ba7aea57)
![image](https://github.com/user-attachments/assets/157baa7a-2b57-44a1-9d0b-7e7d8c4d32f8)


## Additional Resources
For more information on setting up and using Flutter, please refer to the following resources:
- [Flutter Documentation](https://docs.flutter.dev/)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
