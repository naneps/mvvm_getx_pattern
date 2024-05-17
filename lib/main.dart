import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvvm_getx_pattern/app/services/google_generative_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class TypewriterMarkdown extends StatefulWidget {
  final String text;
  const TypewriterMarkdown(this.text, {super.key});

  @override
  _TypewriterMarkdownState createState() => _TypewriterMarkdownState();
}

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _MainAppState extends State<MainApp> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  final TextEditingController _promptController = TextEditingController();
  final GoogleGenerativeService _googleService =
      Get.put(GoogleGenerativeService());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AI Prompt Generator')),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _googleService.isLoading.value
                    ? const TypingIndicator()
                    : Expanded(
                        child: SingleChildScrollView(
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              padding: const EdgeInsets.all(8.0),
                              child: TypewriterMarkdown(
                                  _googleService.output.value)),
                        ),
                      ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _promptController,
                        decoration: InputDecoration(
                          labelText: 'Enter your prompt',
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.attach_file),
                            onPressed: () async {
                              final pickedFile = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  _image = File(pickedFile.path);
                                });
                                _googleService.image = _image!;
                              }
                            },
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              _googleService.setPrompt(_promptController.text);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    _image != null
                        ? Image.file(
                            _image!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Get.put(GoogleGenerativeService());
  }
}

class _TypewriterMarkdownState extends State<TypewriterMarkdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _charCount;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _charCount,
      builder: (context, child) {
        String text = widget.text.substring(0, _charCount.value);
        return MarkdownBody(
          data: text,
          inlineSyntaxes: const [],
          styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
        );
      },
    );
  }

  @override
  void didUpdateWidget(covariant TypewriterMarkdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _controller.dispose();
      _controller = AnimationController(
        duration: Duration(milliseconds: widget.text.length * 50),
        vsync: this,
      );
      _charCount =
          StepTween(begin: 0, end: widget.text.length).animate(_controller);
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.text.length * 15),
      vsync: this,
    );
    _charCount =
        StepTween(begin: 0, end: widget.text.length).animate(_controller);
    _controller.forward();
  }
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _dotsAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotsAnimation,
      builder: (context, child) {
        String dots = '.' * (_dotsAnimation.value + 1);
        return Text('AI is typing$dots');
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
    _dotsAnimation = StepTween(begin: 0, end: 3).animate(_controller);
  }
}
