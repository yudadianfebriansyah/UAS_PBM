import 'package:flutter/material.dart';
import 'package:movie_tix/utils/text.dart';

import 'desc.dart';



class Populer extends StatelessWidget {
  final List populer;

  const Populer({Key? key, required this.populer});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Populer',size: 26, color: Colors.black,),
          Container(height: 270,
          child: ListView.builder(
            itemCount: populer.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: populer[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              populer[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              populer[index]['poster_path'],
                                      description: populer[index]['overview'],
                                      vote: populer[index]['vote_average']
                                          .toString(),
                                      launch_on: populer[index]
                                          ['release_date'],
                                    )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 240,
                  height: 100,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+populer[index]['poster_path']
                        ),
                        fit: BoxFit.cover,
                        ),
                        ),
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: modified_text(text: populer[index]['title']!=null?
                        populer[index]['title']:'Loading', color: Colors.white, size: 26)
                  ),
                ),
              );
            },),
          ),
        ],
      ),
      // BrowseMovie(browseList:browseList),
      // ComingSoon(comingsoon: [],),
      ]
    );
  }
}