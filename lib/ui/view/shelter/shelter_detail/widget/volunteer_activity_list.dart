import 'package:flutter/material.dart';
import 'package:kkaebom/domain/shelter/model/shelter.dart';

import '../../../../../domain/volunteer_activity/model/volunteer_activity.dart';
import 'volunteer_activity_card.dart';

class VolunteerActivityList extends StatefulWidget {
  const VolunteerActivityList({Key? key, required this.shelter})
      : super(key: key);

  @override
  State<VolunteerActivityList> createState() => _VolunteerActivityListState();

  final Shelter shelter;
}

class _VolunteerActivityListState extends State<VolunteerActivityList> {
  final GlobalKey _key = GlobalKey();
  double _height = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_setHeight);
  }

  void _setHeight(_) {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    setState(() {
      _height = MediaQuery.of(context).size.height -
          renderBox.localToGlobal(Offset.zero).dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      height: _height,
      child: ListView.builder(
        itemBuilder: (context, index) => VolunteerActivityCard(
          volunteerActivity: VolunteerActivity(
              id: index,
              shelter_id: widget.shelter.id!,
              tag: '산책',
              title: '봉사 $index',
              content: '내용내용내용내용',
              estimatedTime: '약 4시간',
              startDate: DateTime.now(),
              regDate: DateTime.now()),
        ),
        itemCount: 10,
      ),
    );
  }
}
