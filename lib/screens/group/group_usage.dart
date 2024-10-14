import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:poc_flutter_intro/screens/group/group_usage_controller.dart';
import 'package:poc_flutter_intro/models/intro_model.dart';
import 'package:poc_flutter_intro/utils/input.dart';

class GroupUsage extends StatefulWidget {
  const GroupUsage({
    super.key,
  });

  @override
  State<GroupUsage> createState() => _GroupUsageState();
}

class _GroupUsageState extends State<GroupUsage> {
  bool rendered = false;
  Intro? intro;
  final groupUsageController = GroupUsageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    intro ??= Intro.of(context);
  }

  @override
  void initState() {
    super.initState();

    groupUsageController.globalKeys.value = List.generate(
      2,
      (_) => GlobalKey<FormFieldState<dynamic>>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Group Usage'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Input(
              key: groupUsageController.globalKeys.value[0],
              hint: 'Field 01',
              typeInput: TextInputType.emailAddress,
              introController: IntroModel(
                intro: intro!,
                group: 'default',
                introBuilder: [
                  const Text(
                    'Esse primeiro campo serve para você preencher com qualquer texto que ache necessário. 🥰',
                    style: TextStyle(height: 1.6),
                  )
                ],
                order: 1,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }

                return null;
              },
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Input(
              key: groupUsageController.globalKeys.value[1],
              hint: 'Field 02',
              typeInput: TextInputType.emailAddress,
              introController: IntroModel(
                intro: intro!,
                group: 'default',
                introBuilder: [
                  const Text(
                    'Esse segundo campo serve para você preencher com qualquer texto que ache necessário. 🥰',
                    style: TextStyle(height: 1.6),
                  )
                ],
                order: 2,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }

                return null;
              },
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Intro.of(context).start(
                  group: 'default',
                  reset: true,
                );
              },
              child: IntroStepBuilder(
                group: 'default',
                order: 3,
                overlayBuilder: (params) {
                  return Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Column(
                          children: [
                            Text(
                                'Esse terceiro campo serve para você clicar e testar a introdução em grupo. 🥰'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: Row(
                            children: [
                              IntroButton(
                                text: 'Ok',
                                onPressed: params.onFinish,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                builder: (context, key) => Text(
                  'Click me',
                  key: key,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
