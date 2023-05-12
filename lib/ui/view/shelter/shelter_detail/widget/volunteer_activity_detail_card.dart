import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../domain/volunteer_activity/model/volunteer_activity.dart';

class VolunteerActivityDetailCard extends StatelessWidget {
  const VolunteerActivityDetailCard({
    Key? key,
    required this.volunteerActivity,
  }) : super(key: key);

  final VolunteerActivity volunteerActivity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Container(
          constraints: const BoxConstraints(
            minHeight: 0,
            maxHeight: 100,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return Image.network(volunteerActivity.images[index]);
            },
            itemCount: volunteerActivity.images.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            volunteerActivity.content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
