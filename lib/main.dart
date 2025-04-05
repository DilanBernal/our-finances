import 'package:flutter/material.dart';
import 'package:our_finances/Screens/home_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body:SafeArea(
          child: Column(
            children: [
              HomeScreen()
            ],
          )
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Encabezado del menú
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menú Principal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              // Opciones del menú
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                onTap: () {
                  // Cerrar el menú lateral
                  Navigator.pop(context);
                  // Navegar a la pantalla de inicio
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configuración'),
                onTap: () {
                  // Cerrar el menú lateral
                  Navigator.pop(context);
                  // Navegar a la pantalla de configuración
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Ayuda'),
                onTap: () {
                  // Cerrar el menú lateral
                  Navigator.pop(context);
                  // Navegar a la pantalla de ayuda
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
