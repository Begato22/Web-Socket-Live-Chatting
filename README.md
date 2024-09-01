# Flutter WebSocket Simulation

## Overview

This Flutter application simulates a WebSocket server using the WebSocket Echo Test server provided by [WebSocket.org](https://www.websocket.org/). The application demonstrates how to establish a WebSocket connection, send messages to the server, and receive echoed responses. This is useful for testing WebSocket communication and understanding real-time data exchange.

## Key Features

- **WebSocket Connection**: Establishes a connection with the WebSocket Echo Test server.
- **Send and Receive Messages**: Allows users to send messages to the server and displays the server's echoed responses.
- **User Interface**: Simple and interactive UI for sending messages and viewing received data.

## How It Works

1. **Setup and Connection**:
   - The app connects to the WebSocket Echo Test server at `wss://echo.websocket.org` using the `web_socket_channel` package.
   
2. **Sending Messages**:
   - Users can input text in a field and send it to the WebSocket server.
   - The message is sent to the server using WebSocket’s `send` method.

3. **Receiving Responses**:
   - The server echoes back the sent message.
   - The application listens for incoming messages and updates the UI with the server’s response.


## Usage

1. **Run the App**: Start the Flutter app on your device or emulator.
2. **Interact with UI**: Enter a message and press "Send".
3. **View Responses**: Observe the echoed message displayed on the screen.

## Dependencies

- `web_socket_channel`: Provides WebSocket support for Flutter.

## Project Structure

- `lib/`: Contains the main application logic.
- `assets/`: Includes any images or assets used by the app.
- `pubspec.yaml`: Manages dependencies and assets.

## Conclusion

This Flutter app demonstrates basic WebSocket functionality and can serve as a foundation for more advanced WebSocket-based applications. For further development, consider adding features like message history, connection status indicators, or error handling.


