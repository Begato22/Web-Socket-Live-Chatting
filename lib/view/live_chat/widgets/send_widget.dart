import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/view/live_chat/chat_cubit.dart';
import 'package:web_socket/view/live_chat/chat_states.dart';

class SendWidget extends StatefulWidget {
  const SendWidget({super.key});

  @override
  State<SendWidget> createState() => _SendWidgetState();
}

class _SendWidgetState extends State<SendWidget> {
  late final ChatCubit _cubit;
  late ColorScheme _colorScheme;
  @override
  void initState() {
    _cubit = context.read<ChatCubit>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _colorScheme = Theme.of(context).colorScheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatStates>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: _cubit.inputController.text.isEmpty ? Colors.grey.shade300 : _colorScheme.primary),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _cubit.inputController,
                  onChanged: (value) => _cubit.refreshScreen(),
                  decoration: const InputDecoration(
                    hintText: 'Text Message ...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(width: 100),
              IconButton(
                onPressed: _cubit.inputController.text.isEmpty ? null : () => _cubit.sendMessage(),
                icon: Icon(Icons.send, color: _cubit.inputController.text.isEmpty ? Colors.grey : Colors.deepPurple),
              )
            ],
          ),
        );
      },
    );
  }
}
