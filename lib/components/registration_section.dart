import 'package:flutter/material.dart';

class RegistrationSection extends StatelessWidget {
  final Widget child;
  final String title;

  const RegistrationSection({required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        SizedBox(height: 10),
        child,
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }
}
