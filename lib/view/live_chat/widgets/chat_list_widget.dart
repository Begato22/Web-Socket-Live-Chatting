import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/utils/images.dart';
import 'package:web_socket/view/live_chat/chat_cubit.dart';
import 'package:web_socket/view/live_chat/chat_states.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({super.key});

  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  late final ChatCubit _cubit;
  @override
  void initState() {
    _cubit = context.read<ChatCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatStates>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _cubit.messageList.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(color: Colors.deepPurple.shade100, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const CircleAvatar(radius: 15, backgroundImage: AssetImage(AppImages.avatar)),
                  const SizedBox(width: 10),
                  Text(_cubit.messageList[index]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
