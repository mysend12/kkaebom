import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatefulWidget {
  ImageDetail({Key? key}) : super(key: key);
  static String routeName = 'imageDetail';

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  int? id;
  late final List<String> images;
  late int index;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (id == null) {
      final Map<String, dynamic> args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      id = args['id'];
      images = args['images'];
      index = args['index'];
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          print(
            'id: $id, link: ${images[index]}',
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .7,
              child: CarouselSlider(
                carouselController: _carouselController,
                items: images.map((e) {
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: 100,
                        minHeight: 100,
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: MediaQuery.of(context).size.height * .7,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          e,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  initialPage: index,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  aspectRatio: 1 / 2,
                  onPageChanged: (idx, reason) {
                    if (reason == CarouselPageChangedReason.manual) {
                      setState(() => index = idx);
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              height: 44,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, idx) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => index = idx);
                          _carouselController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: idx == index
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.background,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              images[idx],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
