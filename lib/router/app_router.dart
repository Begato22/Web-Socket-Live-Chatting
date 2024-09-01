import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/view/home/home_cubit.dart';
import 'package:web_socket/view/home/view/home_screen.dart';
import 'package:web_socket/view/live_chat/chat_cubit.dart';
import 'package:web_socket/view/live_chat/chat_screen.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String chat = '/chat';

  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic>? appRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.home),
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
      case Routes.chat:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.chat),
          builder: (context) => BlocProvider(
            create: (context) => ChatCubit(),
            child: const ChatScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
