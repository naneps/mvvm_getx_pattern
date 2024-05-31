import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Secure Input Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SecureInput(
          label: 'Password',
          onChanged: (value) {
            print('Password: $value');
          },
        ),
      ),
    ),
  ));
}

class SecureInput extends StatefulWidget {
  final String? label;
  final String? initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const SecureInput({
    super.key,
    this.label = 'Password',
    this.initialValue,
    this.onChanged,
    this.validator,
  });

  @override
  State<SecureInput> createState() => _SecureInputState();
}

class _SecureInputState extends State<SecureInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: 'Enter your ${widget.label?.toLowerCase()}',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggleObscureText,
        ),
      ),
    );
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
