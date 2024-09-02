import 'package:flutter/material.dart';

class SuccessModal extends StatefulWidget {
  final String title;
  final String content;
  final Function onPressedFunction;
  const SuccessModal(
      {super.key,
      required this.title,
      required this.content,
      required this.onPressedFunction});

  @override
  State<SuccessModal> createState() => _SuccessModalState();
}

class _SuccessModalState extends State<SuccessModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Complaint Submitted',
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
      content: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/success.png",
                scale: 2.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                widget.content,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              widget.onPressedFunction();
            },
            child: const Text('Close'))
      ],
    );
    ;
  }
}
