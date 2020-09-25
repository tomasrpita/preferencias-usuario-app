import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {
  static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Center(
        child: Text('Ajustes Page'),
      ),
      drawer: MenuWidget(),
    );
  }
}
