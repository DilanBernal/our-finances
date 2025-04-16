import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class InputWithButton extends StatefulWidget {
  final Function(Map<String, String>) onSend;
  final List<String> fieldNames;
  final List<TextInputType>? keyboardTypes;
  final List<List<TextInputFormatter>>? inputFormatters;
  final String buttonName;

  const InputWithButton({
    super.key,
    required this.onSend,
    required this.fieldNames,
    required this.buttonName,
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
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
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
          CupertinoButton(
            onPressed: () {
              final values = {
                for (int i = 0; i < widget.fieldNames.length; i++)
                  widget.fieldNames[i]: _controllers[i].text
              };
              setState(() {
                _capturedValues = values;
              });
              widget.onSend(_capturedValues);
            },
            color: CupertinoColors.systemPink,
            child: Text(widget.buttonName,
              style: TextStyle(color: CupertinoColors.white),
            ),
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