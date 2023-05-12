import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/model/user.dart';

part 'volunteer_activity.freezed.dart';
part 'volunteer_activity.g.dart';

@freezed
class VolunteerActivity with _$VolunteerActivity{
  factory VolunteerActivity({
    int? id,
    required int shelter_id,
    required String tag,
    required String title,
    required String content,
    required String estimatedTime,
    required DateTime startDate,
    required DateTime regDate,
    @Default([]) List<String> images,
    @Default([]) List<User> users,
  }) = _VolunteerActivity;

  factory VolunteerActivity.fromJson(Map<String, dynamic> json) => _$VolunteerActivityFromJson(json);
}