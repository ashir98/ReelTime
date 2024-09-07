import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:reeltime/common/colors.dart';
import 'package:reeltime/common/utils.dart';
import 'package:reeltime/screens/home/sections/upcoming_movie_section.dart';
import 'package:reeltime/screens/movie_detail/sections/about_section.dart';
import 'package:reeltime/screens/movie_detail/sections/cast_section.dart';
import 'package:reeltime/screens/movie_detail/sections/info_section.dart';
import 'package:reeltime/screens/movie_detail/sections/trailer_section.dart';
import 'package:reeltime/services/api_services.dart';
import 'package:reeltime/widgets/shimmer/para_shimmer.dart';
import 'package:reeltime/widgets/text/heading.dart';
import 'package:reeltime/widgets/text/sub_heading.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../models/result_model.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key, required this.movieData, this.tagSuffix});
  Result movieData;
  String? tagSuffix;

  ApiService apiService = ApiService();
  @override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(clipBehavior: Clip.none, children: [
                SizedBox(
                  height: 170.h,

                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                    FadeInImage.memoryNetwork(
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(Icons.error_outline),
                        );
                      },
                      placeholder: kTransparentImage, // Local placeholder image
                      image: "$imgUrl${movieData.backdropPath}",
                      fit: BoxFit.fill,
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.2),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
                Positioned(
                top: 110.h,
                left: 25,
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [


                    
                    Hero(
                        transitionOnUserGestures: false, // Disable reverse animation

                      
                      
                          tag: "${movieData.id}-$tagSuffix",
                          child: Container(
                            height: 140.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "$imgUrl${movieData.posterPath}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        15.horizontalSpace,
                        SizedBox(
                          width: size.width*0.6,
                          
                     
                          child: 
                        MovieInfoSection(apiService: apiService, movieData: movieData),
                        ),
                  ],
                )
              ),



              
                





                    
              ]),







          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text("Overview", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          //       SizedBox(height: 10),
          //       Text(
          //         "A listless Wade Wilson...",
          //         style: TextStyle(fontSize: 16),
          //       ),
          //       SizedBox(height: 20),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Column(
          //             children: [
          //               Text("Budget", style: TextStyle(color: Colors.grey)),
          //               Text("\$200M"),
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Text("Revenue", style: TextStyle(color: Colors.grey)),
          //               Text("\$1.3B"),
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Text("Release Date", style: TextStyle(color: Colors.grey)),
          //               Text("24-07-2024"),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text("Cast", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          //       SizedBox(height: 10),
          //       Container(
          //         height: 120,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: 5,
          //           itemBuilder: (context, index) {
          //             return Padding(
          //               padding: const EdgeInsets.only(right: 10),
          //               child: Column(
          //                 children: [
          //                   // CircleAvatar(
          //                   //   radius: 30,
          //                   //   backgroundImage: NetworkImage(castList[index]['image']),
          //                   // ),
          //                   SizedBox(height: 5),
          //                   Text("gsdgs"),
          //                   Text("gdgd", style: TextStyle(color: Colors.grey)),
          //                 ],
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),


          
              // INFO SECTION
            
      
              100.verticalSpace,
      
              
              FutureBuilder(
                future: apiService.getMovieDetail(movieData.id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return ShimmerParagraph();
                  } else {
                    var data = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(10).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // TRAILER PLAY BUTTON
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TrailerSection(movieId: movieData.id),)),
                            child: Container(
                              height: 40.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Iconsax.play_bold,color: Colors.white,),
                                  HeadingText("Play Trailer")
                                ],
                              ),
                            ),
                          ),

                          15.verticalSpace,

                          // -- OVERVIEW SECTION
                          HeadingText("Overview"),
                          SubHeadingText(data!.overview, fontSize: 13,),
                          10.verticalSpace,


                          


                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadingText("Original Language"),
                                    SubHeadingText(formatLanguages(data.originalLanguage,) ),
                                    10.verticalSpace,
                                    HeadingText("Budget "),
                                    SubHeadingText(formatCurrencyAmount(data.budget)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadingText("Release Date"),
                                    SubHeadingText( DateFormat('dd-MM-yyyy').format(data.releaseDate),  ),
                                    10.verticalSpace,
                                    HeadingText("Revenue"),
                                    SubHeadingText(formatCurrencyAmount(data.revenue)),

                                  ],
                                ),
                              )
                            ],
                          )



    
                         
                        ],
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CastSection(movieId: movieData.id),
                    
                    
                    
                    25.verticalSpace,
                    
                    
                    HeadingText("Similar Movies", fontSize: 16,),
                    
                    MovieSection(future: apiService.getSimilarMovies(movieData.id)),
                  ],
                ),
              ),
      
              
      
              // 
        ],
      ),
    ),
  );
}


  // @override
  // Widget build(BuildContext context) {

  //   return Theme(
  //     data: Theme.of(context).copyWith(
  //       dividerColor: AppColors.primaryColor,
  //     ),
  //     child: Scaffold(
  //       appBar: AppBar(
  //         leading: IconButton(
  //           icon: Icon(Icons.arrow_back_ios_rounded), // Your custom icon
  //           onPressed: () {
  //             Navigator.of(context).pop(); // Handle back button action
  //           },
  //         ),
  //         backgroundColor: Colors.transparent,
          
  //       ),
  //       extendBodyBehindAppBar: true,
        
  //       body: SingleChildScrollView(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Stack(clipBehavior: Clip.none, children: [
  //               SizedBox(
  //                 height: 170.h,

  //                 child: Stack(
  //                   fit: StackFit.expand,
  //                   children: [
  //                   FadeInImage.memoryNetwork(
  //                     imageErrorBuilder: (context, error, stackTrace) {
  //                       return Center(
  //                         child: Icon(Icons.error_outline),
  //                       );
  //                     },
  //                     placeholder: kTransparentImage, // Local placeholder image
  //                     image: "$imgUrl${movieData.backdropPath}",
  //                     fit: BoxFit.fill,
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.zero,
  //                     margin: EdgeInsets.all(0),
  //                     decoration: BoxDecoration(
  //                       gradient: LinearGradient(
  //                         begin: Alignment.bottomCenter,
  //                         end: Alignment.center,
  //                         colors: [
  //                           Colors.black,
  //                           Colors.black.withOpacity(0.9),
  //                           Colors.black.withOpacity(0.5),
  //                           Colors.black.withOpacity(0.2),
  //                         ],
  //                       ),
  //                     ),
  //                   )
  //                 ]),
  //               ),
  //               Positioned(
  //                   top: 120,
  //                   left: 30,
  //                   child: Hero(
  //                     tag: "${movieData.id}-$tagSuffix",
  //                     child: Container(
  //                       height: 140.h,
  //                       width: 100.w,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10),
  //                         shape: BoxShape.rectangle,
  //                         image: DecorationImage(
  //                           image: NetworkImage(
  //                               "$imgUrl${movieData.posterPath}"),
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                     ),
  //                   ))
  //             ]),
      
              
      
  //             // INFO SECTION
  //             MovieInfoSection(apiService: apiService, movieData: movieData),
      
  //             15.verticalSpace,
      
              
  //             FutureBuilder(
  //               future: apiService.getMovieDetail(movieData.id),
  //               builder: (context, snapshot) {
  //                 if (!snapshot.hasData) {
  //                   return ShimmerParagraph();
  //                 } else {
  //                   var data = snapshot.data;
  //                   return Padding(
  //                     padding: const EdgeInsets.all(10).r,
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [

  //                         // TRAILER PLAY BUTTON
  //                         GestureDetector(
  //                           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TrailerSection(movieId: movieData.id),)),
  //                           child: Container(
  //                             height: 40.h,
  //                             width: double.infinity,
  //                             decoration: BoxDecoration(
  //                               color: AppColors.primaryColor,
  //                               borderRadius: BorderRadius.circular(50)
  //                             ),
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               children: [
  //                                 const Icon(Iconsax.play_bold,color: Colors.white,),
  //                                 HeadingText("Play Trailer")
  //                               ],
  //                             ),
  //                           ),
  //                         ),

  //                         15.verticalSpace,

  //                         // -- OVERVIEW SECTION
  //                         HeadingText("Overview"),
  //                         SubHeadingText(data!.overview, fontSize: 13,),
  //                         10.verticalSpace,


                          


  //                         Row(
  //                           children: [
  //                             Expanded(
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   HeadingText("Original Language"),
  //                                   SubHeadingText(formatLanguages(data.originalLanguage,) ),
  //                                   10.verticalSpace,
  //                                   HeadingText("Budget "),
  //                                   SubHeadingText(formatCurrencyAmount(data.budget)),
  //                                 ],
  //                               ),
  //                             ),
  //                             Expanded(
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   HeadingText("Release Date"),
  //                                   SubHeadingText( DateFormat('dd-MM-yyyy').format(data.releaseDate),  ),
  //                                   10.verticalSpace,
  //                                   HeadingText("Revenue"),
  //                                   SubHeadingText(formatCurrencyAmount(data.revenue)),

  //                                 ],
  //                               ),
  //                             )
  //                           ],
  //                         )



    
                         
  //                       ],
  //                     ),
  //                   );
  //                 }
  //               },
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 10),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   CastSection(movieId: movieData.id),
                    
                    
                    
  //                   25.verticalSpace,
                    
                    
  //                   HeadingText("Similar Movies", fontSize: 16,),
                    
  //                   MovieSection(future: apiService.getSimilarMovies(movieData.id)),
  //                 ],
  //               ),
  //             ),
      
              
      
  //             // MovieSection(title: "SIMILAR MOVIES", future: apiService.getSimilarMovies(movieData.id))
  //           ],
  //         ),
  //       ),




  //       // // -- FOOTER BUTTON
  //       // persistentFooterButtons: [
  //       //   SizedBox(
  //       //     height: 40.h,
  //       //     child: GestureDetector(
  //       //         onTap: () {
  //       //           Navigator.push(
  //       //               context,
  //       //               MaterialPageRoute(
  //       //                 builder: (context) =>
  //       //                     TrailerSection(movieId: movieData.id),
  //       //               ));
  //       //         },
  //       //         child: Container(
  //       //           color: AppColors.primaryColor,
  //       //           child: const Row(
  //       //             mainAxisAlignment: MainAxisAlignment.center,
  //       //             children: [
  //       //               Icon(
  //       //                 Iconsax.play_bold,
  //       //               ),
  //       //               Text("Watch Trailer")
  //       //             ],
  //       //           ),
  //       //         )),
  //       //   )
  //       // ],
  //     ),
  //   );
  // }
}




