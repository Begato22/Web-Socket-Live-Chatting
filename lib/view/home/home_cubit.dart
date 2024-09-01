import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/data/models/home_navigation.dart';
import 'package:web_socket/utils/localization.dart';
import 'package:web_socket/router/app_router.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState()) {
    init();
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  List<HomeNavigation> navigationList = [];

  void init() {
    _prepareNavigationList();
  }

  void _prepareNavigationList() {
    navigationList.add(HomeNavigation(route: Routes.chat, iconData: Icons.live_tv, title: Localization.webSocket, description: Localization.webSocketDescription));
    navigationList.add(HomeNavigation(route: Routes.home, iconData: Icons.home, title: Localization.otherScreen, description: Localization.homeDescription));
  }

  void refreshScreen() {
    emit(HomeUpdatedState());
  }
}
