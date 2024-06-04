import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/lang_switcher.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_button.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_icon_button.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_date.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_media/enums.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_media/input_media.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_phone.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_secure.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/validator_form_field.dart';

import '../controllers/documentation_controller.dart';

class DocumentationView extends GetView<DocumentationController> {
  const DocumentationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentation'.tr),
        centerTitle: true,
        elevation: 0,
        actions: const [LangSwitcher()],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ExpansionTile(
            leading: const Icon(Icons.text_format),
            title: Text("Text Style".tr),
            dense: true,
            childrenPadding: const EdgeInsets.all(8),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...controller.textStyles.map((e) {
                    final index = controller.textStyles.indexOf(e);
                    return Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(e.entries.first.key,
                          textAlign:
                              index.isEven ? TextAlign.start : TextAlign.end,
                          style: e.entries.first.value),
                    );
                  }),
                ],
              )
            ],
          ),
          ExpansionTile(
            childrenPadding: const EdgeInsets.all(8),
            title: Text("Input Text".tr),
            dense: true,
            leading: const Icon(Icons.text_fields),
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    XInput(
                      label: "Full Name",
                      onChanged: (val) {},
                      prefixIcon: const Icon(FontAwesomeIcons.addressCard),
                      validator: (val) {
                        return ValidatorFormField.validate(
                          value: val!,
                          validator: 'required',
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    XInput(
                      label: "Email",
                      validator: (val) {
                        return ValidatorFormField.validate(
                          value: val!,
                          validator: 'required|email',
                        );
                      },
                      prefixIcon: const Icon(FontAwesomeIcons.envelope),
                      onChanged: (val) {},
                      hasCounter: true,
                      maxLength: 50,
                    ),
                    const InputPhone(),
                    const SizedBox(height: 8),
                    const InputDate(
                      label: "Date",
                      initialValue: "2021-09-01",
                      dateFormatType: DateFormatType.MMMdyyyy,
                    ),
                    const SizedBox(height: 8),
                    const InputDate(
                      label: "Date of Birth",
                      datePickerType: DatePickerType.range,
                      dateFormatType: DateFormatType.EdMMMyyyy,
                    ),
                    const SizedBox(height: 8),
                    SecureInput(
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 8),
                    SecureInput(
                      initialValue: "123456",
                      label: "New Password",
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.money),
            title: const Text("Input Currency"),
            childrenPadding: const EdgeInsets.all(8),
            dense: true,
            children: [
              ...CurrencyType.values.map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.name, style: Get.textTheme.labelMedium),
                    ),
                    InputCurrency(
                      currencyType: e,
                      label: e.shortName(),
                      formatNumberWhenChanged: false,
                      initialValue: "100000",
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text("Input Media"),
            leading: Icon(FontAwesomeIcons.images),
            dense: true,
            childrenPadding: EdgeInsets.all(8),
            children: [
              InputMedia(source: SourceMedia.gallery),
              SizedBox(height: 10),
              InputMedia(
                source: SourceMedia.gallery,
                type: TypeInputMedia.multiple,
              ),
              SizedBox(height: 10),
              InputMedia(
                source: SourceMedia.gallery,
                typeMedia: TypeMedia.media,
                type: TypeInputMedia.multiple,
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Buttons'),
            leading: const Icon(Icons.rectangle_outlined),
            childrenPadding: const EdgeInsets.all(8),
            dense: true,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      XButton(
                        child: const Row(
                          children: [
                            Icon(Icons.add),
                            Text('Custom Child Button'),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 5),
                      XButton(
                        text: 'Text Button',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                  XButton.outline(
                    text: 'Outlined Button',
                    onPressed: () {},
                    foregroundColor: Colors.red,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      XIconButton.outline(
                        icon: Icons.remove,
                        onPressed: () {},
                        borderColor: Colors.red,
                        size: 30,
                        iconSize: 20,
                      ),
                      const SizedBox(width: 5),
                      XIconButton.filled(
                        icon: Icons.add,
                        onPressed: () {},
                        backgroundColor: Colors.green,
                        size: 30,
                        iconSize: 20,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
