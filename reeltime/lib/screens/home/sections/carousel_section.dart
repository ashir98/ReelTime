import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reeltime/common/colors.dart';
import 'package:reeltime/common/utils.dart';
import 'package:reeltime/models/upcoming_movie_model.dart';
import 'package:reeltime/screens/home/sections/upcoming_movie_section.dart';
import 'package:reeltime/widgets/carousel_shimmer.dart';

class CarouselSection extends StatelessWidget {
  const CarouselSection({super.key, required this.future});

  final Future<MovieModel> future;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
        future: future, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CarouselShimmer();
          } else if(!snapshot.hasData) {
            return CarouselShimmer();
          }
          else{
            var data = snapshot.data!.results;
            return SizedBox(
              height: 180.h,
              child: Swiper(
                autoplay: true,
                
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: AppColors.primaryColor,
                      size: 3,
                      activeSize: 6
                    ),
                  ),
                
                viewportFraction: 1,
                curve: Curves.easeInOut,
                itemCount: 5,
                itemBuilder: (context, index) {
                  
                  return Card(
                    margin: EdgeInsets.all(5),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("$imgUrl${data[index].backdropPath}"),
                          fit: BoxFit.fill,
                        ),
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0),
                            ]
                          )
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                data[index].title, style: 
                                TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/imdb.png', width: 25,),
                                  5.horizontalSpace,
                                  Text(data[index].voteAverage.toStringAsFixed(1), style: TextStyle(color: Colors.white),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  );
                },
              
              ),
            );
          }
        },
      ),
    );
  }
}