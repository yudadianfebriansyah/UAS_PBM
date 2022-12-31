import 'package:flutter/material.dart';
import 'package:movie_tix/utils/text.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer(){
     controller = VideoPlayerController.network("https://drive.google.com/file/d/1Ntp5m1KOLzdthhO3xZi8NOMpznfyRHYx/view?usp=sharing");
     controller.addListener(() {
        setState(() {});
     });
    controller.initialize().then((value){
        setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
                backgroundColor: Colors.white,
                leading: new IconButton(
                      icon: new Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ), 
              title: modified_text(color: Colors.black, size: 13, text: 'Your Name',),
          ),
          body: Container( 
            child: Column(
              children:[
                  AspectRatio( 
                    aspectRatio: controller.value.aspectRatio,
                     child: VideoPlayer(controller),
                  ),

                  Container( //duration of video
                     child: Text("Total Duration: " + controller.value.duration.toString()),
                  ),

                  Container(
                      child: VideoProgressIndicator(
                        controller, 
                        allowScrubbing: true,
                        colors:VideoProgressColors(
                            backgroundColor: Colors.redAccent,
                            playedColor: Colors.green,
                            bufferedColor: Colors.purple,
                        )
                      )
                  ),

                  Container(
                     child: Row(
                         children: [
                            IconButton(
                                onPressed: (){
                                  if(controller.value.isPlaying){
                                    controller.pause();
                                  }else{
                                    controller.play();
                                  }

                                  setState(() {
                                    
                                  });
                                }, 
                                icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
                           ),

                           IconButton(
                                onPressed: (){
                                  controller.seekTo(Duration(seconds: 0));

                                  setState(() {
                                    
                                  });
                                }, 
                                icon:Icon(Icons.stop)
                           )
                         ],
                     ),
                  )
              ]
            )
          ),
       );
  }
}