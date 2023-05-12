import 'package:flutter/material.dart';
import 'package:kkaebom/domain/volunteer_activity/model/volunteer_activity.dart';

import 'volunteer_activity_detail_card.dart';

class VolunteerActivityCard extends StatefulWidget {
  const VolunteerActivityCard({
    Key? key,
    required this.volunteerActivity,
  }) : super(key: key);
  final VolunteerActivity volunteerActivity;

  @override
  State<VolunteerActivityCard> createState() => _VolunteerActivityCardState();
}

class _VolunteerActivityCardState extends State<VolunteerActivityCard> {
  String addLeadingZero(int number) {
    return number < 10 ? '0$number' : number.toString();
  }

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        bottom: isSelected ? 0 : 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() => isSelected = !isSelected);
            },
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${widget.volunteerActivity.startDate.year}.${widget.volunteerActivity.startDate.month}.${widget.volunteerActivity.startDate.day}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '${addLeadingZero(widget.volunteerActivity.startDate.hour)}:${addLeadingZero(widget.volunteerActivity.startDate.minute)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                          child: Text(
                            widget.volunteerActivity.tag,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '예상 소요시간: ${widget.volunteerActivity.estimatedTime}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '총원 10명 중 ${widget.volunteerActivity.users.length}명 참가',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 24),
                        GestureDetector(
                          onTap: () {
                            print('신청');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '신청',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isSelected)
            VolunteerActivityDetailCard(
              volunteerActivity: widget.volunteerActivity,
            ),
        ],
      ),
    );
  }
}