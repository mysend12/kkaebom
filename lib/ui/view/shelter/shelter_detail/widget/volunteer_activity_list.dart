import 'dart:math';

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
  List<String> _images = [
    "https://blog.kakaocdn.net/dn/tEMUl/btrDc6957nj/NwJoDw0EOapJNDSNRNZK8K/img.jpg",
    "https://img.freepik.com/free-photo/adorable-kitty-looking-like-it-want-to-hunt_23-2149167099.jpg?w=2000",
    "https://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg",
    "https://image.dongascience.com/Photo/2016/09/14750507361195.jpg",
    "https://blog.kakaocdn.net/dn/d8uTod/btqJ4HaMMf6/DSVHYb5hP5Bs7bJkQZJplk/img.jpg",
    "https://blog.kakaocdn.net/dn/tEMUl/btrDc6957nj/NwJoDw0EOapJNDSNRNZK8K/img.jpg",
    "https://img.freepik.com/free-photo/adorable-kitty-looking-like-it-want-to-hunt_23-2149167099.jpg?w=2000",
    "https://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg",
    "https://image.dongascience.com/Photo/2016/09/14750507361195.jpg",
    "https://blog.kakaocdn.net/dn/d8uTod/btqJ4HaMMf6/DSVHYb5hP5Bs7bJkQZJplk/img.jpg",
    "https://blog.kakaocdn.net/dn/tEMUl/btrDc6957nj/NwJoDw0EOapJNDSNRNZK8K/img.jpg",
    "https://img.freepik.com/free-photo/adorable-kitty-looking-like-it-want-to-hunt_23-2149167099.jpg?w=2000",
    "https://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg",
    "https://image.dongascience.com/Photo/2016/09/14750507361195.jpg",
    "https://blog.kakaocdn.net/dn/d8uTod/btqJ4HaMMf6/DSVHYb5hP5Bs7bJkQZJplk/img.jpg",
    "https://blog.kakaocdn.net/dn/tEMUl/btrDc6957nj/NwJoDw0EOapJNDSNRNZK8K/img.jpg",
    "https://img.freepik.com/free-photo/adorable-kitty-looking-like-it-want-to-hunt_23-2149167099.jpg?w=2000",
    "https://www.chemicalnews.co.kr/news/photo/202106/3636_10174_4958.jpg",
    "https://image.dongascience.com/Photo/2016/09/14750507361195.jpg",
    "https://blog.kakaocdn.net/dn/d8uTod/btqJ4HaMMf6/DSVHYb5hP5Bs7bJkQZJplk/img.jpg",
  ];

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
              content: '내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용',
              images: _images.sublist(
                0,
                Random().nextInt(_images.length - 2) + 1,
              ),
              estimatedTime: '약 4시간',
              startDate: DateTime.now(),
              regDate: DateTime.now()),
        ),
        itemCount: 10,
      ),
    );
  }
}
