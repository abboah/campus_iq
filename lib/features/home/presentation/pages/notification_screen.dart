import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:campus_iq/core/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notification';

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    // Sample events for demonstration
    final List<Event> events = [
      Event(
          title: "New Class Added",
          description: "Your schedule has been updated."),
      Event(
          title: "Exam Reminder",
          description: "Don't forget your math exam tomorrow!"),
      Event(
          title: "New Class Added",
          description: "Your schedule has been updated."),
      Event(
          title: "Exam Reminder",
          description: "Don't forget your math exam tomorrow!"),
      Event(
          title: "New Class Added",
          description: "Your schedule has been updated."),
      Event(
          title: "Exam Reminder",
          description: "Don't forget your math exam tomorrow!"),
      Event(
          title: "New Class Added",
          description: "Your schedule has been updated."),
      Event(
          title: "Exam Reminder",
          description: "Don't forget your math exam tomorrow!"),
    ];

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
            child: events.isEmpty
                ? const Center(
                    child: Text("No notifications available"),
                  )
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return Container(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          leading: Icon(
                            Icons.notifications,
                            color: ExtraColors.buttonOutline,
                          ),
                          title: Text(
                            event.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          subtitle: Text(
                            event.description,
                            style: const TextStyle(fontSize: 14.0),
                          ),
                          onTap: () {
                            // Implement logic when notification is tapped
                            print('${event.title} - ${event.description}');
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String title;
  final String description;

  Event({required this.title, required this.description});

  @override
  String toString() => title; // For debugging
}
