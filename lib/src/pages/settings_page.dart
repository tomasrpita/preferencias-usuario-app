import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shared/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textEditingController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    _colorSecundario = prefs.colorSecundario;
    _genero = prefs.genero;
    _textEditingController =
        new TextEditingController(text: prefs.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        title: Text('Ajustes'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            onChanged: (bool value) {
              _colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {});
            },
            title: Text('Color Secundario'),
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Femenino'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el teléfono'),
              onChanged: (value) {
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      ),
      drawer: MenuWidget(),
    );
  }

  void _setSelectedRadio(int value) {
    prefs.genero = value;

    _genero = value;
    setState(() {});
  }
}
