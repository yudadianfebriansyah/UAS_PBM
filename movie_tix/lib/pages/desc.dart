import 'package:flutter/material.dart';

import '../controlers/video_player.dart';
import '../utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
                      icon: new Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
        ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: modified_text(text: '⭐ Average Rating - ' + vote, color: Colors.white, size: 13,)),
              ])),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded', size: 24, color: Colors.black,)),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child:
                  modified_text(text: 'Releasing On - ' + launch_on, size: 14, color: Colors.black)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: modified_text(text: description, size: 18, color: Colors.black,)),
              ),
            ],
          ),  
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
          heroTag: 'Play',
          child: Icon(Icons.play_arrow),
          onPressed: (){
          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
        },
        ),
    );
  }
}