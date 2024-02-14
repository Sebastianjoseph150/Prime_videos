import 'package:flutter/material.dart';
import 'package:prime/funtion.dart';
import 'GetModel.dart';
import 'package:prime/url.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: Allmovies(),
    );
  }
}

class Allmovies extends StatelessWidget {
  Allmovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call the getMovie function to populate the movieList.
    getMOvie();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Movies'),
      ),
      body: FutureBuilder(
        future: getMOvie(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            height: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(movieList[index].title.toString());
                  },
                  child: Container(
                    width: 130,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(imgBaseUrl +
                            movieList[index].backdropPath.toString()),
                      ),
                      title: Text(movieList[index].title.toString()),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
