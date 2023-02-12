import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PublisherWidget extends StatefulWidget {
  const PublisherWidget({super.key});

  @override
  State<PublisherWidget> createState() => _PublisherWidgetState();
}

class _PublisherWidgetState extends State<PublisherWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: double.maxFinite,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      ),
    );
  }
}
