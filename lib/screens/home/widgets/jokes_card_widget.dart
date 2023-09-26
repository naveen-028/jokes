import 'package:flutter/material.dart';

class JokeCardWidget extends StatefulWidget {
  final String? message;

  const JokeCardWidget({super.key, this.message});

  @override
  State<JokeCardWidget> createState() => _JokeCardWidgetState();
}

class _JokeCardWidgetState extends State<JokeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4, // Controls the shadow depth
        margin: const EdgeInsets.all(16), // Adjust the margin as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Adjust the border radius
          side: const BorderSide(
            color: Colors.blue, // Border color
            width: 2.0, // Border width
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16), // Padding within the Card
          child: Text(
            widget.message ?? "",
            style: const TextStyle(
              fontSize: 24, // Adjust the text size as needed
              fontWeight: FontWeight.bold, // Text style
              color: Colors.blue, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
