import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/component/custom_text_filed.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/const/color.dart';
import 'package:calendar_scheduler/database/drift.dart';
import 'package:calendar_scheduler/model/schedule_with_category.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../model/schedule.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  // Map<DateTime, List<ScheduleTable>> schedules = {
  //   DateTime.utc(2025, 3, 8): [
  //     ScheduleTable(
  //       id: 1,
  //       startTime: 11,
  //       endTime: 12,
  //       content: '플러터 공부하기',
  //       date: DateTime(2025, 3, 8).toUtc(),
  //       color: categoryColors[0],
  //       createdAt: DateTime.now().toUtc(),
  //     ),
  //     ScheduleTable(
  //       id: 2,
  //       startTime: 14,
  //       endTime: 16,
  //       content: 'NextJS 공부하기',
  //       date: DateTime(2025, 3, 8).toUtc(),
  //       color: categoryColors[3],
  //       createdAt: DateTime.now().toUtc(),
  //     ),
  //   ],
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet<ScheduleTable>(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(selectedDay: selectedDay);
            },
          );

          // setState(() {
          //   schedules = {
          //     ...schedules,
          //     schedule.date: [
          //       if (schedules.containsKey(schedule.date))
          //         ...schedules[schedule.date]!,
          //       schedule
          //     ]
          //   };
          // });
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2025, 3, 10),
              onDaySelected: onDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            StreamBuilder(
              stream: GetIt.I<AppDatabase>().streamSchedules(selectedDay),
              builder: (context, snapshot) {
                return TodayBanner(
                    selectedDay: selectedDay, taskCount: !snapshot.hasData ? 0 : snapshot.data!.length,
                );
              }
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                ),
                child: StreamBuilder<List<ScheduleWithCategory>>(
                  stream: GetIt.I<AppDatabase>().streamSchedules(selectedDay),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }

                    if (snapshot.data == null) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final schedules = snapshot.data!;

                    return ListView.separated(
                      itemCount: schedules.length,
                      itemBuilder: (BuildContext context, int index) {
                        // final selectedSchedules = schedules[selectedDay]!;
                        // final scheduleModel = selectedSchedules[index];

                        final scheduleWithCategory = schedules[index];
                        final schedule = scheduleWithCategory.schedule;
                        final category = scheduleWithCategory.category;

                        return Dismissible(
                          key: ObjectKey(schedule.id),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (DismissDirection direction) async {
                            await GetIt.I<AppDatabase>().removeSchedule(
                              schedule.id,
                            );

                            return true;
                          },
                          child: GestureDetector(
                            onTap: () async {
                              await showModalBottomSheet<ScheduleTable>(
                                context: context,
                                builder: (_) {
                                  return ScheduleBottomSheet(
                                    selectedDay: selectedDay,
                                    id: schedule.id,
                                  );
                                },
                              );
                            },
                            child: ScheduleCard(
                              startTime: schedule.startTime,
                              endTime: schedule.endTime,
                              content: schedule.content,
                              color: Color(
                                int.parse('FF${category.color}', radix: 16),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 8.0);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime date) {
    return date.isAtSameMomentAs(selectedDay);
  }
}
