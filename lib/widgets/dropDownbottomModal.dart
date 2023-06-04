import 'package:Flutter_GPT/consts/global_colors.dart';
import 'package:Flutter_GPT/model/Model.dart';
import 'package:Flutter_GPT/providers/modelsProvider.dart';
import 'package:Flutter_GPT/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropDownModal extends ConsumerStatefulWidget {
  const DropDownModal({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _DropDownModalState();
  }
}

class _DropDownModalState extends ConsumerState<DropDownModal> {
  @override
  Widget build(BuildContext context) {
    var item = ref.watch(currentModele.notifier);

    return FutureBuilder(
      future: ApiService.getModels(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DropdownButton(
            dropdownColor: gptColor,
            items: (snapshot.data as List<Model>)
                .map((model) => DropdownMenuItem(
                    value: model.id,
                    child: Text(
                      "${model.id}",
                      style: const TextStyle(color: Colors.white),
                    )))
                .toList(),
            value: item.currentModel,
            onChanged: (value) {
              // item = value.toString();
              setState(() {
              item.setCurrentModel(value.toString());
              });
            },
          );
        }
        return const SizedBox.shrink();
      },
    );

    // DropdownButton<String>(
    //   items: items,
    //   value: item,
    //   onChanged: (value) {
    //     setState(() {
    //       item = value!;
    //     });
    //   },
    // );
  }
}
