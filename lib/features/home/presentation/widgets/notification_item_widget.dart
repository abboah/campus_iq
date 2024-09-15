import 'package:flutter/material.dart';

import '../../../../core/themes/extra_colors.dart';
import 'home_utils.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        leading: Icon(
          Icons.notifications,
          color: ExtraColors.buttonOutline,
        ),
        title: Text(
          widget.event.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        subtitle: Text(
          widget.event.description,
          style: const TextStyle(fontSize: 14.0),
        ),
        onTap: () {
          // Implement logic when notification is tapped
          print('${widget.event.title} - ${widget.event.description}');
        },
      ),
    );
  }
}
