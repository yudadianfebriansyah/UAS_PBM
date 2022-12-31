import 'package:flutter/material.dart';
import 'package:movie_tix/utils/text.dart';

import 'desc.dart';



class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Top Rating',size: 26, color: Colors.black,),
          Container(height: 270,
          child: ListView.builder(
            itemCount: toprated.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: toprated[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                      description: toprated[index]['overview'],
                                      vote: toprated[index]['vote_average']
                                          .toString(),
                                      launch_on: toprated[index]
                                          ['release_date'],
                                    )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 240,
                  height: 100,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                        ),
                        fit: BoxFit.cover,
                        ),
                        ),
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: modified_text(text: toprated[index]['title']!=null?
                        toprated[index]['title']:'Loading', color: Colors.white, size: 26)
                  ),
                ),
              );
            },),
          ),
        ],
      ),
      ]
    );
  }
}