import 'package:flutter/material.dart';
import 'package:kkaebom/domain/shelter/model/shelter.dart';
import 'package:kkaebom/domain/user/model/user.dart';
import 'package:kkaebom/ui/shared/safe_widget.dart';
import 'package:kkaebom/ui/shared/widget/app_bar.dart';
import 'package:kkaebom/ui/view/shelter/shelter_detail/widget/volunteer_activity_list.dart';
import 'package:provider/provider.dart';

import '../../../shared/shared_view_model.dart';
import '../shelter_view_model.dart';

class ShelterDetail extends StatefulWidget {
  ShelterDetail({Key? key}) : super(key: key);
  static String routeName = 'shelterDetail';

  @override
  State<ShelterDetail> createState() => _ShelterDetailState();
}

class _ShelterDetailState extends State<ShelterDetail> {
  bool isInitVariants = false;
  late Shelter _shelter;
  late User? _user;

  bool isAdmin = false;
  late SharedViewModel sharedViewModel;
  late ShelterViewModel shelterViewModel;

  void initVariants(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    shelterViewModel = context.watch<ShelterViewModel>();
    sharedViewModel = context.watch<SharedViewModel>();

    isInitVariants = true;
    _user = User(
      id: 1,
      name: 'user',
    );
    _shelter = args['shelter'];
    isAdmin = _user?.id! != _shelter.adminId ? true : false;
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
          if (isAdmin)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('관리하기!!');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  child: Text(
                    '관리하기',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('2023년 5월');
                  },
                  child: Row(
                    children: [
                      Text(
                        '2023년 5월',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _shelter.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Container(
                constraints: BoxConstraints(
                  minWidth: 10,
                  minHeight: 10,
                  maxWidth: MediaQuery.of(context).size.width * .2,
                  maxHeight: MediaQuery.of(context).size.height * .07,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(_shelter.imageUrl),
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          ),
          const SizedBox(height: 16),
          VolunteerActivityList(shelter: _shelter),
        ],
      ),
    );
  }
}
