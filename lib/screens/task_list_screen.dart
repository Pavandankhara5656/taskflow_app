import 'package:flutter/material.dart';
import 'filtered_sorted_task_list.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const FilteredSortedTaskList());
  }
}
