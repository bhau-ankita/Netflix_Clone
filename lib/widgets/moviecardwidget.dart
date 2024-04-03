import 'package:flutter/material.dart';
import 'package:netflix_clone_3/common/utils.dart';
import 'package:netflix_clone_3/model/upcomingmoviemodel.dart';
import 'package:netflix_clone_3/screens/moviedetailedscreen.dart';

class MovieCardWidget extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headLineText;
  const MovieCardWidget(
      {super.key,
      required this.future,
//required this.HeadLineText,
      required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapShot) {
          if (!snapShot.hasData) {
            return CircularProgressIndicator(); // Or some other loading indicator
          }
          var data = snapShot.data?.results;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headLineText,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(3),
                    shrinkWrap: true,
                    itemCount: data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailScreen(movieId: data[index].id),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                              '${imageUrl}${data[index].posterPath}'),
                        ),
                      );
                    }),
              )
            ],
          );
        });
  }
}
