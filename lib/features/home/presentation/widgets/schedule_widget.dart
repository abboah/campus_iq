import 'package:flutter/material.dart';
import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'home_utils.dart';
import 'notification_item_widget.dart';

class TableEventsExample extends StatefulWidget {
  final Color color;
  final VoidCallback onPressed;
  final VoidCallback profileNav;

  const TableEventsExample({
    super.key,
    required this.color,
    required this.onPressed,
    required this.profileNav,
  });
  @override
  TableEventsExampleState createState() =>
      TableEventsExampleState(onPressed: onPressed, profileNav: profileNav);
}

class TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  final Color? color;
  final VoidCallback onPressed;
  final VoidCallback profileNav;

  TableEventsExampleState(
      {this.color, required this.onPressed, required this.profileNav});

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  String getAcademicYear(DateTime date) {
    int year = date.year;
    int academicStartYear;
    int academicEndYear;

    if (date.month >= 1 && date.month <= 8) {
      academicStartYear = year - 1;
      academicEndYear = year;
    } else {
      academicStartYear = year;
      academicEndYear = year + 1;
    }

    return "$academicStartYear/$academicEndYear";
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String dayName = DateFormat('EEEE').format(_focusedDay);
    final String academicYear = getAcademicYear(_focusedDay);
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Column(
          children: [
            Text(
              academicYear,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text(
              'ACADEMIC YEAR',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
            ),
          ],
        ),
        backgroundColor: ExtraColors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: profileNav,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/Profile image.png'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dayName,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
                selectedDecoration: BoxDecoration(
                    color: ExtraColors.buttonOutline, shape: BoxShape.circle),
                todayDecoration: BoxDecoration(
                    shape: BoxShape.circle, color: ExtraColors.grey)),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
            ),
            onPressed: onPressed,
            child: Text(
              'See More',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                if (value.isEmpty) {
                  return const Center(
                    child: Text("No events for this day"),
                  );
                }

                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final event = value[index];
                    return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: NotificationItem(
                          event: event,
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
