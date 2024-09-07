import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reeltime/common/colors.dart';
import 'package:reeltime/services/api_services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerSection extends StatefulWidget {
  TrailerSection({super.key, required this.movieId});
  final int movieId;

  @override
  State<TrailerSection> createState() => _TrailerSectionState();
}

class _TrailerSectionState extends State<TrailerSection> {
  final ApiService apiService = ApiService();
  YoutubePlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }


  void _shareTrailer(String trailerUrl){
    Share.share("Check out this movie $trailerUrl");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getMovieTrailer(widget.movieId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var results = snapshot.data!.results;
      
            // Check if results are empty
            if (results.isEmpty) {
              return const Center(
                child: Text('No trailer available'),
              );
            }

            
            String videoKey = results.where( (element) => element.type=="Trailer" || element.type == "Teaser" ).toList()[0].key;
            String videoUrl = 'https://www.youtube.com/watch?v=$videoKey';
            // Initialize the YouTube player controller
            _controller = YoutubePlayerController(
              
              initialVideoId: videoKey,
              
              flags: const YoutubePlayerFlags(autoPlay: false, showLiveFullscreenButton: false),
            );


      
            return Center(
              child: YoutubePlayer(
                
                topActions: [
                  IconButton(
                    onPressed: ()=> _shareTrailer(videoUrl),
                    icon: Icon(Iconsax.share_outline),
                  )
                ],
                progressIndicatorColor: AppColors.primaryColor,
                progressColors: ProgressBarColors(
                  backgroundColor: Colors.white,
                  playedColor: AppColors.primaryColor,
                  handleColor: AppColors.primaryColor,
                ),
                liveUIColor: AppColors.primaryColor,
                controller: _controller!,
              ),
            );
          }
        },
      ),
    );
  }
}
