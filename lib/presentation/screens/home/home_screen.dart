import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widget/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: ScaffoldKey,
      appBar: AppBar(title: const Text('Flutter + Materrial 3')),
      body: const _HomeView(),
      drawer: SideMenu(ScaffoldKey: ScaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final Colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: Colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        /*Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const ButtonsScreen()),
        );*/
        //Navigator.pushNamed(context, menuItem.link);
        context.push(menuItem.link);
      },
    );
  }
}
