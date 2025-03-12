import 'package:flutter/material.dart';

class CustomerRequestWeekDaySelectionProvider extends ChangeNotifier {
  final Map<String, TimeRange> _selectedDays;

  // Constructor with optional default days
  CustomerRequestWeekDaySelectionProvider({List<String>? defaultDays})
      : _selectedDays = {
    for (var day in defaultDays ?? [])
      day: TimeRange(
        startTime: TimeOfDay(hour: 9, minute: 0), // Default start time
        endTime: TimeOfDay(hour: 17, minute: 0), // Default end time
      ),
  };

  List<String> get selectedDays => _selectedDays.keys.toList();

  bool isSelected(String day) => _selectedDays.containsKey(day);

  TimeRange getTimeRange(String day) => _selectedDays[day]!;

  void toggleSelection(String day) {
    if (isSelected(day)) {
      _selectedDays.remove(day);
    } else {
      _selectedDays[day] = TimeRange(
        startTime: TimeOfDay.now(),
        endTime: TimeOfDay.now(),
      );
    }
    notifyListeners();
  }

  void setStartTime(String day, TimeOfDay time) {
    _selectedDays[day]?.startTime = time;
    notifyListeners();
  }

  void setEndTime(String day, TimeOfDay time) {
    _selectedDays[day]?.endTime = time;
    notifyListeners();
  }
}

class TimeRange {
  TimeOfDay startTime;
  TimeOfDay endTime;

  TimeRange({
    required this.startTime,
    required this.endTime,
  });
}
