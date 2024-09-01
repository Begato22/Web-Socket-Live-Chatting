import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/utils/localization.dart';
import 'package:web_socket/view/live_chat/chat_cubit.dart';
import 'package:web_socket/view/live_chat/chat_states.dart';
import 'package:web_socket/view/live_chat/widgets/chat_list_widget.dart';
import 'package:web_socket/view/live_chat/widgets/send_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text(Localization.chatScreen)),
          body: const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ChatListWidget(),
                  SendWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
