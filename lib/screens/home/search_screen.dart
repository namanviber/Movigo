import 'package:flutter/material.dart';
import '../../models/MovieDetailModel.dart';
import '../../service/apiCall.dart';
import '../../service/mongoDbCall.dart';
import 'package:project2/widgets/bottom_bar.dart';

import 'movieDetail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  bool _isSearching = false;
  List genrelist = [
    'assets/images/1.png',
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
  ];

  List genrelist_onlytext = [
    'Popular Now',
    'Spotlight',
    'Trending',
    'Comedy',
    'Scary',
  ];

  Future<List<Map<String, dynamic>>> _performSearch(String query) async {
    try {
      if (query.isEmpty) {
        return [];
      } else {
        final searchResult = await MongoDatabase.searchMovies(query);
        return searchResult;
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Widget _buildPopularMoviesListView() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: MongoDatabase.getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final popularMovies = snapshot.data;
          return ListView.builder(
            itemCount: popularMovies?.length,
            itemBuilder: (context, index) {
              final movie = popularMovies![index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Color(0xFF09090F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie photo
                      Container(
                        height: 100,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/original${movie['poster_path']}'),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Movie title
                            Text(
                              movie['title'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            // Movie overview
                            Text(
                              'Movie overview goes here',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Future<void> fetchMovieDetails(int movieid) async {
    final response3 = await movieDetails(movieid);
    late MovieDetailModel movieDetail;
    setState(() {
      movieDetail = response3;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieInfo(
                  movieModel: movieDetail,
                )));
  }

  Widget _buildSearchedMovies() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _performSearch(_searchQuery),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final searchResults = snapshot.data;
          if (searchResults == null || searchResults.isEmpty) {
            return Center(
                child: Text(
              'No Search Results Found',
              style: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).textTheme.titleMedium!.color),
            ));
          } else {
            return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final movie = searchResults[index];
                final List<dynamic> genreListText = movie['genres'];
                return InkWell(
                  onTap: () {
                    setState(() {
                      fetchMovieDetails(movie['tmdbId']);
                    });
                  },
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Movie photo
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/original${movie['poster_path']}'),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Movie title
                                Text(
                                  movie['title'],
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color,
                                  ),
                                ),
                                SizedBox(height: 8),
                                // Movie overview
                                Row(
                                  children: [
                                    Text(
                                      genreListText.join("  "),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .color,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
      },
    );
  }

  // Search bar
  Widget Searchbar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          child: TextField(
        style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Color(0xff000000),
          ),
          hintText: 'Search movie...',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).textTheme.bodySmall!.color!,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).highlightColor,
              width: 1.0,
            ),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          fillColor: Theme.of(context).cardColor,
          filled: true,
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
            _isSearching = true;
          });
        },
        onSubmitted: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      )),
    );
  }

  List<Color> a = [
    Color(0xffE13300),
    Color(0xff7358FF),
    Color(0xff1E3264),
    Color(0xffE8125C),
    Color(0xFFE9142A),
    Color(0xFFB02897),
    Color(0xFFA56752),
    Color(0xFF158A08),
    Color(0xFF8C67AC),
    Color(0xFFffffff),
    Color(0xff7358FF),
    Color(0xff1E3264),
    Color(0xffE8125C),
    Color(0xFFE9142A),
    Color(0xFFB02897),
    Color(0xFFA56752),
    Color(0xFF158A08),
    Color(0xFF8C67AC),
    Color(0xFFffffff),
  ];

  double height_for_colorbox = 130;
  Widget ColorBox(int index) {
    final genreListImage = genrelist[index];
    print(genreListImage);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/filter_results',
              arguments: 'genrelist[i');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height_for_colorbox,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 24,
                    height: height_for_colorbox,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(genreListImage),
                        fit: BoxFit.cover,
                        // adjust the image fit as needed
                      ),
                    ),
                  )
                ],
              ),
              Positioned.fill(
                left: 10,
                // bottom: 0,
                top: 80,
                // top:10,
                // top: height_for_colorbox-25,
                child: Text(
                  genrelist_onlytext[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Search',
        ),
      ),
      body: Column(
        children: <Widget>[
          Searchbar(),
          // Replace Searchbar() with your own implementation of the search bar

          // Conditionally show/hide the ListView based on _isSearching flag
          if (_isSearching == false)
            Expanded(
              flex: 100,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(genrelist.length, (index) {
                  return ColorBox(index);
                }),
              ),
            )
          else
            Container(),

          // Conditionally show/hide the search results based on _isSearching flag
          Expanded(
            child: _isSearching == false ? Container() : _buildSearchedMovies(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 1,
      ),
    );
  }
}
