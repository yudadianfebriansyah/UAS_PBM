import 'package:flutter/material.dart';
import 'package:movie_tix/pages/browse_movie.dart';
import 'package:movie_tix/pages/popular.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'top_rating.dart';
import '../models/browse_model.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  
  List populer = [];
  List toprated = [];

  final String apikey = "7dada04cfdad2552566769f24a6f3949";
  final readaccesstoken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZGFkYTA0Y2ZkYWQyNTUyNTY2NzY5ZjI0YTZmMzk0OSIsInN1YiI6IjYzNWQxOTU1OWJhODZhMDA3ZDc3ZGMxOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JZSo8ns9YGonolqeU5K4h8e2GPiwamOE-h9-DH45vRg"; 
loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showErrorLogs: true,
      showWarningLogs: true,
      ));
      
Map populerresult = await tmdbWithCustomLogs.v3.movies.getPopular();
Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
setState(() {
  populer = populerresult['results'];
  toprated = topratedresult['results'];
});
print(populer);
}

  @override
  void initState() {
    super.initState();
    loadmovies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      height: 300,
      child: TopRated(toprated: toprated),
    ),
    Container(
      height: 150,
      child: BrowseMovie(browseList: browseList),
    ),
    Container(
      height: 300,
      child: Populer(populer: populer),
    ),
  ],
)
    );
  }
}