import 'package:flutter/material.dart';

class TrExtensionServiceScreen extends StatefulWidget {
  const TrExtensionServiceScreen({super.key});

  @override
  State<TrExtensionServiceScreen> createState() =>
      _TrExtensionServiceScreenState();
}

class _TrExtensionServiceScreenState extends State<TrExtensionServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text('Tr Extension Service'),
      ),
    );
  }
}
