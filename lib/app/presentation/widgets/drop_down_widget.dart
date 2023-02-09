import 'package:chatgpt_flutter/app/data/models/models_model.dart';
import 'package:chatgpt_flutter/app/presentation/widgets/text_widget.dart';
import 'package:chatgpt_flutter/core/provider/models_provider.dart';
import 'package:chatgpt_flutter/core/theme/app_colors.dart';
import 'package:chatgpt_flutter/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelsDrowDownWidget extends StatefulWidget {
  const ModelsDrowDownWidget({super.key});

  @override
  State<ModelsDrowDownWidget> createState() => _ModelsDrowDownWidgetState();
}

class _ModelsDrowDownWidgetState extends State<ModelsDrowDownWidget> {
  String? currentModel;
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    currentModel = modelsProvider.getCurrentModel;
    return FutureBuilder<List<ModelsModel>>(
        future: modelsProvider.getAllModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                  child: DropdownButton(
                    dropdownColor: AppColors.primaryColor,
                    iconEnabledColor: Colors.white,
                    items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem(
                        value: snapshot.data![index].id,
                        child: TextWidget(
                          label: snapshot.data![index].id,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    value: currentModel,
                    onChanged: (value) {
                      setState(() {
                        currentModel = value.toString().capitalizeFirst();
                      });
                      modelsProvider.setCurrentModel(
                        value.toString(),
                      );
                    },
                  ),
                );
        });
  }
}
