import 'package:flutter/material.dart';
import 'package:isit_app/app/app.dart';
import 'package:isit_app/common/controller/customer_request_days_time.dart';
import 'package:isit_app/common/controller/week_days_time_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeekDaySelectionProvider()),
        ChangeNotifierProvider(create: (_) => CustomerRequestWeekDaySelectionProvider()),
      ],
      //create: (_) => WeekDaySelectionProvider(),
      child: MyApp(),
    ),
  );
}
