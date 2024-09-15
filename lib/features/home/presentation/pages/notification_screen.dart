import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:campus_iq/core/widgets/bottom_navbar.dart';
import 'package:campus_iq/features/home/presentation/widgets/home_utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/notification_item_widget.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = '/notification';

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      // endDrawer: Drawer(
      //     width: MediaQuery.of(context).size.width / 1.5,
      //     child: const MainDrawer()),
      bottomNavigationBar: const BottomNavBarFb2(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Notification"),
        centerTitle: true,
        elevation: 0,
        actions: [
          // IconButton(
          //   padding: const EdgeInsets.only(right: 20.0),
          //   hoverColor: ExtraColors.transparent,
          //   highlightColor: ExtraColors.transparent,
          //   onPressed: () {
          //     scaffoldKey.currentState!.openEndDrawer();
          //   },
          //   icon: Icon(IconlyLight.category,
          //       color: isLightTheme ? ExtraColors.black : ExtraColors.white),
          // ),
        ],
      ),
      // key: scaffoldKey,
      body: Column(
        children: [
          const SizedBox(height: 8.0),
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
                      return NotificationItem(event: event);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
