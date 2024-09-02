import 'package:flutter/material.dart';

class LoadingModal extends StatefulWidget {
  const LoadingModal({super.key});

  @override
  State<LoadingModal> createState() => _LoadingModalState();
}

class _LoadingModalState extends State<LoadingModal> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Submitting Request'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Please wait for a moment'),
          Spacer(flex: 1),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
