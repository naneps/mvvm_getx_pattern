import 'package:image_picker/image_picker.dart';

class PromptData {
  List<XFile> images;
  String textInput;
  List<String>? additionalTextInputs;

  PromptData({
    required this.images,
    required this.textInput,
    this.additionalTextInputs,
  });

  PromptData copyWith({
    List<XFile>? images,
    String? textInput,
    List<String>? additionalTextInputs,
  }) {
    return PromptData(
      images: images ?? this.images,
      textInput: textInput ?? this.textInput,
      additionalTextInputs: additionalTextInputs ?? this.additionalTextInputs,
    );
  }
}
