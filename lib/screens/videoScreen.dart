import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';

import '../main.dart';
import '../server/api.dart';

class VideoScreen extends StatefulWidget {
  final String asetName;
  final int index;
  final String nameEntity;
  final new_ind;
  const VideoScreen({super.key, required this.asetName, required this.index, required this.nameEntity, required this.new_ind});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

Timer? timer;

class _VideoScreenState extends State<VideoScreen> {


  late List links;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState(){
    super.initState();
    int ind = 0;
    if(widget.asetName == "animals"){
      ind = 0;
    }
    else if(widget.asetName == "insects"){
      ind = 1;
    }
    else if(widget.asetName == "birds"){
      ind = 2;
    }
    else if(widget.asetName == "fishes"){
      ind = 3;
    }
    else{
      ind = 4;
    }
    
    links = video_links[ind];
    _controller = VideoPlayerController.network(links[widget.index-1][widget.new_ind]);
    _initializeVideoPlayerFuture = _controller.initialize();
    setState(() {
      _controller.play();
    });
    
  }

  int count = 0;
  bool isPlay = true;

  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(177, 81, 36, 1),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, 
        icon: const Icon(Icons.arrow_back),),
      ),
      backgroundColor: Color.fromRGBO(177, 81, 36, 1),
      body: Center(
        child: FutureBuilder(
          future: getLink(links[widget.index-1][0]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: 9/16,
                // Use the VideoPlayer widget to display the video.
                child:  Chewie(controller: ChewieController(videoPlayerController: _controller, aspectRatio: 9/16)),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}