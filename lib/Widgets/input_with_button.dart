import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class InputWithButton extends StatefulWidget {
  final Function() onSend;
  const InputWithButton({super.key, required this.onSend});
  @override
  _InputWithButtonState createState() => _InputWithButtonState();
}

class _InputWithButtonState extends State<InputWithButton> {
  final TextEditingController _textController = TextEditingController();

  String _capturedText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Campo de texto (Cupertino)
          CupertinoTextField(
            controller: _textController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            placeholder: 'Ingresa un texto',
            padding: EdgeInsets.all(12),
            style: TextStyle(
              color: CupertinoColors.lightBackgroundGray
            ),
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.systemBlue),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 20), // Espacio entre el TextField y el botón

          // Botón para capturar el texto (Cupertino)
          CupertinoButton(
            onPressed: () {
              widget.onSend();
              setState(() {
                _capturedText = _textController.text;
              });
            },
            color: CupertinoColors.opaqueSeparator,
            child: Text('Capturar Texto', style: TextStyle(color: CupertinoColors.darkBackgroundGray),
            ),
          ),
          SizedBox(height: 20), // Espacio entre el botón y el texto capturado

          // Mostrar el texto capturado
          Text(
            'Texto capturado: $_capturedText',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}