import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   MyApp({super.key});

  
    List<PopularMovies> popularMovies=[
      PopularMovies(
          title: 'Filme 1',
      posterUrl: 'assets/img/tpiqEVTLRz2Mq7eLq5DT8jSrp71.jpg',
      voteAverage: 9,
      ),
      PopularMovies(
          title: 'Filme 1',
      posterUrl: 'assets/img/tpiqEVTLRz2Mq7eLq5DT8jSrp71.jpg',
      voteAverage: 9,
      ),
      PopularMovies(
          title: 'Filme 1',
      posterUrl: 'assets/img/tpiqEVTLRz2Mq7eLq5DT8jSrp71.jpg',
      voteAverage: 9,
      ),
      PopularMovies(
          title: 'Filme 1',
      posterUrl: 'assets/img/tpiqEVTLRz2Mq7eLq5DT8jSrp71.jpg',
      voteAverage: 9,
      ),
      PopularMovies(
          title: 'Filme 1',
      posterUrl: 'assets/img/tpiqEVTLRz2Mq7eLq5DT8jSrp71.jpg',
      voteAverage: 9,
      ),

    ];
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'My Section ListView',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
            textTheme: TextTheme(
      titleMedium: _getTextStyle(
        fontSize: 20,
        color: const Color(0xff272b30),
      ),
      titleSmall: _getTextStyle(
        fontSize: 18,
        color: const Color(0xff272b30),
      ),
      bodyLarge: _getTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xffef233c),
      ),
      bodyMedium: _getTextStyle(
        fontSize: 14,
        color: const Color(0xff272b30),
      ),
      bodySmall: _getTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color:const Color(0xffef233c),
      ),
    ),
      ),
      home:  Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(height: 60),                
            SectionHeader(
              title: 'Animes Favoritos',
              onSeeAllTap: () {
                // context.goNamed(AppRoutes.popularMoviesRoute);
              },
            ),
                  
              SectionListView(
              height: 240,
              itemCount: popularMovies.length,
              itemBuilder: (context, index) {
                return SectionListViewCard(media: popularMovies[index]);
              },
            ),
            ],
          )),
      ),
    );
  }
}

TextStyle _getTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

class PopularMovies{
  String? title;
  double voteAverage;
  String? posterUrl;

  PopularMovies(
    {
      this.title,
      required this.voteAverage,
      this.posterUrl
    }
  );
}

class SectionHeader extends StatelessWidget {
  final String title;
  final Function() onSeeAllTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.titleSmall,
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: Row(
              children: [
                Text(
                  'Ver Tudo',
                  style: textTheme.bodyLarge,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Color(0xffa9aaac)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SectionListView extends StatelessWidget {
  final int itemCount;
  final double height;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const SectionListView({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) =>
            const SizedBox(width: 10),
      ),
    );
  }
}

class SectionListViewCard extends StatelessWidget {
  final PopularMovies media;

  const SectionListViewCard({
    required this.media,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                imageUrl: media.posterUrl!,
                width: double.infinity,
                height: 175,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                media.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xffffbe21),
                    size: 18,
                  ),
                  Text(
                    '${media.voteAverage}/10',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ImageWithShimmer extends StatelessWidget {
  const ImageWithShimmer({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
        imageUrl, 
        height: height,
        width: width,
        fit: BoxFit.cover,
      );
 }
}




