import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_password.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/validator_form_field.dart';

import '../controllers/documentation_controller.dart';

class DocumentationView extends GetView<DocumentationController> {
  const DocumentationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentation'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ExpansionTile(
            leading: const Icon(Icons.text_format),
            title: const Text("Text Style"),
            dense: true,
            childrenPadding: const EdgeInsets.all(8),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...controller.textStyles.map(
                    (e) => Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Text(
                        e.entries.first.key,
                        textAlign: TextAlign.start,
                        style: e.entries.first.value,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          ExpansionTile(
            childrenPadding: const EdgeInsets.all(8),
            title: const Text("Text Input"),
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
                    ),
                    XInput(
                      label: "Email",
                      validator: (val) {
                        return ValidatorFormField.validate(
                          value: val!,
                          validator: 'required|email',
                        );
                      },
                      prefixIcon: const Icon(Icons.email),
                      onChanged: (val) {},
                      hasCounter: true,
                      maxLength: 50,
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
          )
        ],
      ),
    );
  }
}
