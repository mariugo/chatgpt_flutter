import 'package:chatgpt_flutter/app/presentation/widgets/drop_down_widget.dart';
import 'package:chatgpt_flutter/app/presentation/widgets/text_widget.dart';
import 'package:chatgpt_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ModalSheet {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: "Chosen Model:",
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ModelsDrowDownWidget(),
                ),
              ],
            ),
          );
        });
  }
}
