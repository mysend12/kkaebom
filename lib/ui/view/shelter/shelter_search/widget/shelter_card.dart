import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/ui/view/shelter/shelter_detail/shelter_detail.dart';

import '../../../../../domain/shelter/model/shelter.dart';

class ShelterCard extends StatelessWidget {
  ShelterCard({Key? key, required this.shelter}) : super(key: key);
  Shelter shelter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ShelterDetail.routeName,
          arguments: {
            'shelter': shelter,
          },
        );
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                width: .1, color: Theme.of(context).colorScheme.primary)),
        child: Row(
          children: [
            const SizedBox(width: 12),
            CachedNetworkImage(
              imageUrl: shelter.imageUrl,
              width: 76,
              height: 76,
              progressIndicatorBuilder: (_, url, download) {
                if (download.progress != null) {
                  final percent = download.progress! * 100;
                  return Text(
                    'progress: $percent%',
                    style: Theme.of(context).textTheme.labelSmall,
                  );
                }
                return Center(
                  child: Text(
                    'Loading...',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                );
              },
              imageBuilder: (_, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  shelter.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  '매일 오전, 오후, 낮, 새벽',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
