import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wootcot_simplified/ui/screens/ai_training_plan_viewer.screen.dart';
import 'package:wootcot_simplified/core/screen_controllers/ai_trainer.notifier.dart';

class EnterTrainingPlan extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final inputController = TextEditingController();

  EnterTrainingPlan({super.key});

  void _submit(BuildContext context, AiTrainerNotifier stateNotifier) {
    if (!formKey.currentState!.validate()) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AiTrainingPlanViewer()),
    );
    stateNotifier.generate(inputController.text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    final stateNotifier = ref.read(aiTrainerNotifierProvider.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _submit(context, stateNotifier),
        child: Icon(Icons.send, color: theme.primaryColor),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.sports_gymnastics,
                      size: 64,
                      color: theme.primaryColor,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "What shall we train on today?",
                      textAlign: TextAlign.center,
                      style: tt.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            autofocus: true,
                            onFieldSubmitted: (_) {
                              _submit(context, stateNotifier);
                            },
                            controller: inputController,
                            validator: stateNotifier.validateInput,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'abs workout, full body, etc.',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
