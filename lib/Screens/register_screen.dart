import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:our_finances/Dao/sqlite/user_dao_sqlite.dart';
import 'package:our_finances/Models/user.dart';
import 'package:our_finances/Widgets/input_with_button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepo = context.read<UserDaoSqlite>();
    return InputWithButton(
      onSend: (values) => {_createUser(values, userRepo)},
      fieldNames: ["nombre", "dinero"],
      keyboardTypes: [TextInputType.text, TextInputType.number],
      inputFormatters: [
        [],
        [FilteringTextInputFormatter.digitsOnly]
      ],
    );
  }

  Future<void> _createUser(
      Map<String, String> values, UserDaoSqlite userRepo) async {
    try {
      final name = values['nombre']!;
      final balance = double.tryParse(values['dinero']!) ?? 0.0;

      if (name != null && name.trim() != '') {
        final user = User(id: 0, name: name, balance: balance);
        await userRepo.insertUser(user);
      }
      await userRepo.getAllUsers();
    } catch (e) {
      print(e);
    }
  }
}
