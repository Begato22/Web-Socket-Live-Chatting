import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket/utils/localization.dart';
import 'package:web_socket/data/models/home_navigation.dart';
import 'package:web_socket/view/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text(Localization.homeScreen)),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
            itemCount: _cubit.navigationList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => _buildIconRow(_cubit.navigationList[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildIconRow(HomeNavigation item) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, item.route),
      leading: Icon(item.iconData),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          Text(item.description, style: const TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
