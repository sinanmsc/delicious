// import 'dart:js';

import 'package:delicious/core/theme/theme_helper.dart';
import 'package:delicious/core/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditingPassword extends StatelessWidget {
  final TextEditingController? passwordcontroller;
  final TextEditingController? newcontroller;
  final TextEditingController? confirmcontroller;

  const EditingPassword(
      {super.key,
      this.passwordcontroller,
      this.confirmcontroller,
      this.newcontroller});

  static const routerPath = '/editingpassowrd_page';
  static const routerName = 'editingpassword_page';
  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;
    return AlertDialog(
      backgroundColor: colors.txtInverse,
      content: SizedBox(
        height: spaces.space_800 * 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              hintText: 'Old password',
              controller: passwordcontroller,
            ),
            CustomTextField(
              hintText: 'New password',
              controller: newcontroller,
            ),
            CustomTextField(
              hintText: ' Confirm password',
              controller: confirmcontroller,
            ),
          ],
        ),
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
