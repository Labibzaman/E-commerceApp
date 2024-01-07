import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import '../widgets/home/circle_Icon_Button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          CircleIconButton(
            onTap: () {},
            iconData: Icons.person,
          ),
          const SizedBox(
            width: 8,
          ),
          CircleIconButton(
            onTap: () {},
            iconData: Icons.call,
          ),
          const SizedBox(
            width: 8,
          ),
          CircleIconButton(
            onTap: () {},
            iconData: Icons.notifications_active,
          ),
        ],
        title: Hero(
          tag: 'appLogo',
          child: Image.asset(AssetsPath.navLogo),
        ),
      ),
    );
  }
}
