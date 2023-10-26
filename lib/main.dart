import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
        appBar: AppBar(title: Text("This is the App title"),),
        body: const ListDisplay()
        )

      );
  }
}

class ListDisplay extends StatefulWidget{
  const ListDisplay({super.key});

  @override
  State<ListDisplay> createState() {
   return ListDisplayState();
  }
}

class ListDisplayState extends State<ListDisplay>{


  void setMovieAsFavorite(Movie movie){
    setState(() {
      movie.isFavorite = !movie.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index){
          return MovieItem(movies[index], (){
            setMovieAsFavorite(movies[index]);
          });
        }
    );
  }


}

class MovieItem extends StatelessWidget{

  final Movie movie;
  final VoidCallback setFavorite;

  MovieItem(this.movie, this.setFavorite);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 150,
      child: Card(
        child: Row(
          children: [
            Image.asset(movie.image),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text(movie.genre),
                      Text(movie.rate.toString()),
                      IconButton(
                          onPressed: (){
                              setFavorite();
                          },
                          icon: Icon(movie.isFavorite? Icons.star: Icons.star_border))

                    ],
                  ),

                ))
          ],
        ),
      ),
    );
  }
}

class Movie{
  String name;
  String genre;
  double rate;
  String image;
  bool isFavorite;

  Movie({required this.name, required this.genre, required this.rate, required this.image, required this.isFavorite});
}

List<Movie> movies = [
  Movie(name: "test1", genre: "Drama", rate: 9.2, image: 'images/m2.jpg', isFavorite: true),
  Movie(name: "test2", genre: "Drama", rate: 9.2, image: 'images/m3.jpg', isFavorite: false),
  Movie(name: "test3", genre: "Drama", rate: 9.2, image: 'images/m4.jpg', isFavorite: true),
  Movie(name: "test4", genre: "Drama", rate: 9.2, image: 'images/m5.jpg', isFavorite: false),
];

