import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/failure.dart';

class FailureDialog extends StatelessWidget {
  final Failure failure;

  const FailureDialog({
    super.key,
    required this.failure,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(failure.name),
      content: failure.description != null ? Text(failure.description!) : null,
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text("OK"),
        )
      ],
    );
  }
}
