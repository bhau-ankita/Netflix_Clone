import 'package:flutter/material.dart';
//import 'package:netflix_clone_3/common/utils.dart';
import 'package:netflix_clone_3/model/tvseriesmodel.dart';
import 'package:netflix_clone_3/model/upcomingmoviemodel.dart';
import 'package:netflix_clone_3/screens/searchscreen.dart';
import 'package:netflix_clone_3/services/apiservices.dart';
import 'package:netflix_clone_3/widgets/customcarousel.dart';
import 'package:netflix_clone_3/widgets/moviecardwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowPlaying;
  late Future<TvModelSeries> topRatedShows;

  @override
  void initState() {
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlaying = apiServices.getNowPlayingMovies();
    topRatedShows = apiServices.getTopRatedSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          width: 120,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              onTap: () {},
              child: Container(
                color: Colors.blue,
                height: 27,
                width: 27,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<TvModelSeries>(
              future: topRatedShows,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCarouselSlider(data: snapshot.data!);
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                future: nowPlaying,
                headLineText: 'Now Playing',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: MovieCardWidget(
                future: upcomingFuture,
                headLineText: 'UpComing Movie',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
