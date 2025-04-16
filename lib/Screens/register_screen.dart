import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:our_finances/Dao/sqlite/user_dao_sqlite.dart';
import 'package:our_finances/Models/user.dart';
import 'package:our_finances/Widgets/input_with_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepo = context.read<UserDaoSqlite>();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Registro",
          style: TextStyle(
              color: Color.fromRGBO(182, 182, 255, 1.0),
              decoration: TextDecoration.none),
        ),
        InputWithButton(
          onSend: (values) => {_createUser(values, userRepo)},
          fieldNames: ["nombre", "dinero"],
          keyboardTypes: [TextInputType.text, TextInputType.number],
          buttonName: "Registrar tu usuario",
          inputFormatters: [
            [],
            [FilteringTextInputFormatter.digitsOnly]
          ],
        )
      ]
    );
  }

  Future<void> _createUser(
      Map<String, String> values, UserDaoSqlite userRepo) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final name = values['nombre']!;
      final balance = double.tryParse(values['dinero']!) ?? 0.0;

      if (name.trim() != '') {
        final user = User(id: 0, name: name, balance: balance, inCloud: false);
        int idGenerated = await userRepo.insertUser(user);
        await prefs.setInt('userId', idGenerated);
        await prefs.setBool('isFirstLaunch', false);
      }
      await userRepo.getAllUsers();
    } catch (e) {
      print(e);
    }
  }
}
