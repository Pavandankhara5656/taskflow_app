import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskService service;

  TaskViewModel({required this.service});

  List<Task> _tasks = [];
  String _filter = 'All';

  List<Task> get tasks {
    switch (_filter) {
      case 'Completed':
        return _tasks.where((t) => t.isCompleted).toList();
      case 'Pending':
        return _tasks.where((t) => !t.isCompleted).toList();
      default:
        return _tasks;
    }
  }

  Future<void> loadTasks() async {
    _tasks = await service.getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await service.addTask(task);
    await loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await service.updateTask(task);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await service.deleteTask(id);
    await loadTasks();
  }

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }

  void sortTasksByDueDate() {
    _tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
    notifyListeners();
  }
}