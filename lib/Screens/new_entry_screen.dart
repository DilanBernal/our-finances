import 'package:flutter/cupertino.dart';
import 'package:our_finances/Widgets/input_with_button.dart';

class NewEntryScreen extends StatelessWidget {
  const NewEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InputWithButton(onSend: (values) {_createEntry(values);}, fieldNames: ["Noooo", "La politsia"], buttonName: "Agregar gasto",);
  }

  Future<void> _createEntry(Map<String, String> values) async {

  }
}