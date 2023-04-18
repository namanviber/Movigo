import 'package:flutter/material.dart';
import '../../service/mongoDbCall.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //Local Variables
  String _searchQuery = '';
  bool _isSearching = false;
  bool _isScrollingUp = false;

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
            return Center(child: Text('No s found'));
          } else {
            return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final movie = searchResults[index];
                final List<dynamic> genreList = movie['genres'];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  color: Color(0xFF09090F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        // Movie photo
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(8),
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
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
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
                              Row(
                                children: [
                                  Text(
                                    genreList.join("  "),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                    overflow:
                                    TextOverflow.ellipsis,
                                  ),
                                ],
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
        }
      },
    );
  }


  // Search bar
  Widget Searchbar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          color: Color(0xffc0bfbf),
          child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              hintStyle: TextStyle(
                color: Color(0xff000000),
              ),
              hintText: 'Search movie...',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                ),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              fillColor: Colors.white,
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
          )

      ),
    );
  }



  List<Color> a=[Color(0xffE13300),
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
  Widget ColorBox(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        child: Stack(
          children: [
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                color: a[index],
                borderRadius: BorderRadius.circular(11.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/facebook_logo.png',
                      width: 30,
                      height: 30,

                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Action',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Colors.black,

        title: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            'Search',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Searchbar(),
          _isSearching == false
              ? Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 60,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: a.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ColorBox(index);
                  },
                ),
              ),
            ],
          )
              : Container(),
          // Conditionally delete Row widget when _isSearching is true
          Expanded(
            child: (_isSearching == false)
                ? _buildPopularMoviesListView()
                : _buildSearchedMovies(),
          ),
        ],
      ),
    );
  }
}

