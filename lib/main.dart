import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/task_view_model.dart';
import 'screens/task_list_screen.dart';
import 'services/task_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskViewModel>(
      create: (_) => TaskViewModel(service: TaskService())..loadTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        home: const TaskListScreen(),
      ),
    );
  }
}