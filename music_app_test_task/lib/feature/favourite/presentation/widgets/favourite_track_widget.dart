import 'package:flutter/material.dart';
import 'package:music_app_test_task/utils/ext.dart';

import '../../data/models/favourite_track_model.dart';

class FavouriteTrackWidget extends StatefulWidget {
  const FavouriteTrackWidget({
    super.key,
    this.index = 0,
    required this.track,
    required this.onPress,
  });

  final int? index;
  final FavouriteTrackModel track;
  final void Function() onPress;

  @override
  State<FavouriteTrackWidget> createState() => _FavouriteTrackWidgetState();
}

class _FavouriteTrackWidgetState extends State<FavouriteTrackWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: const Center(
          child: Text('Delete'),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          widget.onPress();
          setState(() {});
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(123, 158, 158, 158),
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                '${widget.track.artistName?.toInitialsRepresentation}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.track.title}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '${widget.track.artistName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Text(
              '${widget.track.duration?.toMinutesRepresentation}',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
