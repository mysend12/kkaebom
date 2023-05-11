import 'package:flutter/material.dart';
import 'package:kkaebom/domain/volunteer_activity/model/volunteer_activity.dart';

class VolunteerActivityCard extends StatelessWidget {
  const VolunteerActivityCard({
    Key? key,
    required this.volunteerActivity,
  }) : super(key: key);
  final VolunteerActivity volunteerActivity;

  String addLeadingZero(int number) {
    return number < 10 ? '0$number' : number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
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
                  '${volunteerActivity.startDate.year}.${volunteerActivity.startDate.month}.${volunteerActivity.startDate.day}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '${addLeadingZero(volunteerActivity.startDate.hour)}:${addLeadingZero(volunteerActivity.startDate.minute)}',
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
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    child: Text(
                      volunteerActivity.tag,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '예상 소요시간: ${volunteerActivity.estimatedTime}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '총원 10명 중 ${volunteerActivity.users.length}명 참가',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
