
class BrowseModel {
  final String title;
  final String image;
  BrowseModel({
    required this.title, 
    required this.image,   
  });
}
List<BrowseModel> browseList =[
  BrowseModel(
  title: 'Action', 
  image: 'Assets/ic_action.png'),
  BrowseModel(
  title: 'War', 
  image: 'Assets/ic_war.png'),
  BrowseModel(
  title: 'Drama', 
  image: 'Assets/ic_drama.png'),
  BrowseModel(
  title: 'Music', 
  image: 'Assets/ic_music.png'),
  BrowseModel(
  title: 'Horor', 
  image: 'Assets/ic_horror.png'),
  BrowseModel(
  title: 'Crime', 
  image: 'Assets/ic_crime.png'),

];