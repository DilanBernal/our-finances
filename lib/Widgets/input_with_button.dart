import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class InputWithButton extends StatefulWidget {
  final Function(Map<String, String>) onSend; // Ahora recibe un mapa de valores
  final List<String> fieldNames; // Nombres de los campos
  final List<TextInputType>? keyboardTypes; // Tipos de teclado opcionales
  final List<List<TextInputFormatter>>? inputFormatters; // Formateadores opcionales

  const InputWithButton({
    super.key,
    required this.onSend,
    required this.fieldNames,
    this.keyboardTypes,
    this.inputFormatters,
  });

  @override
  _InputWithButtonState createState() => _InputWithButtonState();
}

class _InputWithButtonState extends State<InputWithButton> {
  late List<TextEditingController> _controllers;
  late Map<String, String> _capturedValues;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.fieldNames.length,
          (index) => TextEditingController(),
    );
    _capturedValues = {for (var name in widget.fieldNames) name: ''};
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Generar un campo por cada nombre proporcionado
          ...List.generate(widget.fieldNames.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: CupertinoTextField(
                controller: _controllers[index],
                keyboardType: widget.keyboardTypes != null && widget.keyboardTypes!.length > index
                    ? widget.keyboardTypes![index]
                    : TextInputType.text,
                inputFormatters: widget.inputFormatters != null && widget.inputFormatters!.length > index
                    ? widget.inputFormatters![index]
                    : null,
                placeholder: 'Ingresa tu ${widget.fieldNames[index]}',
                padding: EdgeInsets.all(12),
                style: TextStyle(color: CupertinoColors.lightBackgroundGray),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemBlue),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }),

          SizedBox(height: 20),

          CupertinoButton(
            onPressed: () {
              // Capturar todos los valores
              final values = {
                for (int i = 0; i < widget.fieldNames.length; i++)
                  widget.fieldNames[i]: _controllers[i].text
              };

              setState(() {
                _capturedValues = values;
              });

              widget.onSend(values);
            },
            color: CupertinoColors.systemPink,
            child: Text('Capturar Valores',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),

          SizedBox(height: 20),

          // Mostrar todos los valores capturados
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _capturedValues.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '${entry.key}: ${entry.value}',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}