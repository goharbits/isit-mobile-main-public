import 'package:flutter/material.dart';

class WeekDaySelectionProvider extends ChangeNotifier {
  final Map<String, TimeRange> _selectedDays = {};
  bool _isSameForAllDays = false;

  bool get isSameForAllDays => _isSameForAllDays;

  void setSameForAllDays(bool value) {
    _isSameForAllDays = value;

    // If same for all days, sync all selected days' time ranges
    if (_isSameForAllDays && _selectedDays.isNotEmpty) {
      final firstDay = _selectedDays.keys.first;
      final commonStartTime = _selectedDays[firstDay]?.startTime ?? TimeOfDay.now();
      final commonEndTime = _selectedDays[firstDay]?.endTime ?? TimeOfDay.now();

      _selectedDays.forEach((key, value) {
        value.startTime = commonStartTime;
        value.endTime = commonEndTime;
      });
    }
    notifyListeners();
  }

  List<String> get selectedDays => _selectedDays.keys.toList();

  bool isSelected(String day) => _selectedDays.containsKey(day);

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

  TimeRange getTimeRange(String day) => _selectedDays[day]!;

  void setStartTime(String day, TimeOfDay time) {
    if (_isSameForAllDays) {
      // Update start time for all selected days
      _selectedDays.forEach((key, value) {
        value.startTime = time;
      });
    } else {
      _selectedDays[day]?.startTime = time;
    }
    notifyListeners();
  }

  void setEndTime(String day, TimeOfDay time) {
    if (_isSameForAllDays) {
      // Update end time for all selected days
      _selectedDays.forEach((key, value) {
        value.endTime = time;
      });
    } else {
      _selectedDays[day]?.endTime = time;
    }
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