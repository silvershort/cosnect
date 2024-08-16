import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/model/form/template_model.dart';
import 'package:cosnect/src/model/form/template_type.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';

const List<TemplateModel> memoTemplates = [
  TemplateModel(
    title: '기본 템플릿',
    type: TemplateType.basic,
  ),
  TemplateModel(
    title: '캐릭터 템플릿',
    type: TemplateType.character,
  ),
];

Future<T?> showMemoTemplateDialog<T extends TemplateModel>(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.localization.template_select_msg,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        memoTemplates[index].title,
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        context.maybePop(memoTemplates[index]);
                      },
                    );
                  },
                  itemCount: memoTemplates.length,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
