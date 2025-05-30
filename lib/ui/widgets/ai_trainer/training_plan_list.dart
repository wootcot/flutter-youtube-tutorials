import 'package:flutter/material.dart';

import 'package:wootcot_simplified/core/models/training_plan.model.dart';

class TrainingPlanList extends StatelessWidget {
  final TrainingPlan? trainingPlan;
  final Function(PlanItem) onSelect;

  const TrainingPlanList({
    super.key,
    required this.onSelect,
    required this.trainingPlan,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = PageController(viewportFraction: 0.85);

    final t = trainingPlan;
    final tt = theme.textTheme;

    if (t == null) {
      return Center(
        child: Text(
          "Click to create today's training plan.",
          style: tt.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        ListTile(
          leading: Icon(Icons.fitness_center),
          title: Text(
            "${t.title} (${t.plan.length} exercises)",
            style: tt.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Created on ${t.date.year}-${t.date.month.toString().padLeft(2, '0')}-${t.date.day.toString().padLeft(2, '0')}",
            style: tt.bodyMedium,
          ),
        ),
        Expanded(
          flex: 3,
          child: PageView.builder(
            controller: controller,
            itemCount: t.plan.length,
            itemBuilder: (context, index) {
              final plan = t.plan[index];
              return GestureDetector(
                onTap: () => onSelect(plan),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.primaryColor.withAlpha(100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${index + 1}.", style: tt.displaySmall),
                      Text(
                        plan.exercise,
                        style: tt.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text("${plan.sets}", style: tt.displaySmall),
                              const SizedBox(width: 5),
                              Text("SETS", style: tt.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: 10),
                          if (plan.reps.isNotEmpty) ...[
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  plan.reps.join(" | "),
                                  style: tt.titleMedium,
                                ),
                                const SizedBox(width: 5),
                                Text("REPS", style: tt.bodyMedium),
                              ],
                            ),
                          ],
                          if (plan.weight.isNotEmpty) ...[
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  plan.weight.join(" | "),
                                  style: tt.titleMedium,
                                ),
                                const SizedBox(width: 5),
                                Text("WEIGHTS (kg)", style: tt.bodyMedium),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        TextButton(
          onPressed: () {
            controller.nextPage(
              curve: Curves.linear,
              duration: const Duration(milliseconds: 300),
            );
          },
          child: Chip(
            label: Text(
              "Next",
              style: tt.titleLarge?.copyWith(
                letterSpacing: 4,
                color: theme.primaryColor,
              ),
            ),
            deleteIcon: Icon(Icons.next_plan),
          ),
        ),

        const Spacer(),
      ],
    );
  }
}
