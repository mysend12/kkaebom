import 'package:flutter/material.dart';
import 'package:kkaebom/ui/shared/safe_widget.dart';
import 'package:kkaebom/ui/shared/widget/app_bar.dart';

class ShelterDetail extends StatefulWidget {
  ShelterDetail({Key? key}) : super(key: key);
  static String routeName = 'shelterDetail';

  @override
  State<ShelterDetail> createState() => _ShelterDetailState();
}

class _ShelterDetailState extends State<ShelterDetail> {
  bool isInitVariants = false;
  late int id;
  late String title;
  late bool isAdmin;
  late String url;

  void initVariants(context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    isInitVariants = true;
    id = args['id'];
    title = args['title'];
    isAdmin = args['isAdmin'];
    url = args['url'];
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitVariants) initVariants(context);

    return KkaebomSafeWidget(
      appBar: KkaebomAppBar(
        title: '보호소 상세',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Text('id: $id, title: $title, isAdmin: $isAdmin'),
          Image.network(url),
        ],
      ),
    );
  }
}
