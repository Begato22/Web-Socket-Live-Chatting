import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/view/live_chat/chat_states.dart';
import 'package:web_socket_channel/io.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState()) {
    init();
  }

  static ChatCubit get(context) => BlocProvider.of(context);

  late IOWebSocketChannel channel;
  late TextEditingController inputController;
  List<String> messageList = [];

  void init() {
    inputController = TextEditingController();
    channel = IOWebSocketChannel.connect(Uri.parse('wss://echo.websocket.org'));
    channel.stream.listen((data) {
      messageList.add(data);
      refreshScreen();
    });
  }

  void dispose() {
    channel.sink.close();
  }

  void sendMessage() {
    if (inputController.text.isNotEmpty) {
      channel.sink.add(inputController.text);
      inputController.clear();
    }
  }

  void refreshScreen() {
    emit(ChatUpdatedState());
  }
}
