import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kkaebom/ui/shared/safe_widget.dart';
import 'package:kkaebom/ui/shared/widget/app_bar.dart';
import 'package:provider/provider.dart';

import '../shelter_view_model.dart';

class ShelterDetail extends StatefulWidget {
  ShelterDetail({Key? key}) : super(key: key);
  static String routeName = 'shelterDetail';

  @override
  State<ShelterDetail> createState() => _ShelterDetailState();
}

class _ShelterDetailState extends State<ShelterDetail> {
  bool isInitVariants = false;
  late ShelterViewModel shelterViewModel;
  late int id;
  late String title;
  late bool isAdmin;
  late String url;

  void initVariants(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    shelterViewModel = context.watch<ShelterViewModel>();
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
                title,
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
                      image: NetworkImage(url),
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 32,
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
                        '4월 8일',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '07:30',
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
                            '산책',
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
                          '예상 소요시간: 4시간',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '총원 10명 중 1명 참가',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text('id: $id, title: $title, isAdmin: $isAdmin'),
        ],
      ),
    );
  }
}
