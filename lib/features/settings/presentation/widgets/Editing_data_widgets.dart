import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditingWidget extends StatelessWidget {
  final TextEditingController controller;
  const EditingWidget({super.key, required this.controller});
  static const routerPath = '/editing_page';
  static const routerName = 'editing_page';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: CustomTextField(
        hintText: 'Change Name',
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(' Press ok to confirm '),
        )
      ],
    );
  }
}
