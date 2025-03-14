import 'package:calendar_scheduler/database/drift.dart';

class ScheduleWithCategory {
  final CategoryTableData category;
  final ScheduleTableData schedule;

  ScheduleWithCategory({required this.category, required this.schedule});
}
