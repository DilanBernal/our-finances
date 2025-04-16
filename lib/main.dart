import 'package:flutter/material.dart';
import 'package:our_finances/Dao/sqlite/db_helper_sqlite.dart';
import 'package:our_finances/Dao/sqlite/user_dao_sqlite.dart';
import 'package:our_finances/Screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'Widgets/list_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sqliteHelper = DbSqlite.instance;
  await sqliteHelper.database;


  runApp(
    MultiProvider(
      providers: [
        Provider<DbSqlite>(create: (_) => sqliteHelper),
        Provider<UserDaoSqlite>(
            create: (ctx) => UserDaoSqlite(dbHelper: ctx.read<DbSqlite>())
        )
      ],
      child:MainApp(),
    )
  );
}


class MainApp extends StatelessWidget {
  MainApp({super.key});
  final ThemeData blackDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Color.fromRGBO(20, 0, 20, 0.85),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.white,
      onPrimary: Colors.black,
      surface: Color.fromRGBO(82, 0, 138, 1.0),
      onSurface: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: blackDarkTheme,
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
          child: ListMenu(),
        ),
      ),
    );
  }
}
