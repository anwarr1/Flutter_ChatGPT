import 'package:Flutter_GPT/consts/global_colors.dart';
import 'package:Flutter_GPT/model/Model.dart';
import 'package:Flutter_GPT/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class dropDownModal extends StatefulWidget {
  const dropDownModal({Key? key}) : super(key: key);

  @override
  State<dropDownModal> createState() => _dropDownModalState();
}

class _dropDownModalState extends State<dropDownModal> {
  String item = items[0].value!;
  @override
  Widget build(BuildContext context) {
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
            value: "${(snapshot.data as List<Model>)[0].id}",
            onChanged: (value) {
              setState(() {
                item = "${(snapshot.data as List<Model>)[0].id}";
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
