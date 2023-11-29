import 'package:flutter/material.dart';
import 'package:movie_flix/constants/constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

//Shows a skeleton until data is fetched
class MovieSkeleton extends StatelessWidget {
  const MovieSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyData = Constants.dummyData;

    return Skeletonizer(
      child: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Constants.placeholderImg,
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummyData[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          dummyData[index].overview,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
