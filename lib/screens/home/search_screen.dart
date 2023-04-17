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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Search'),
      ),
      body: Column(
        children: [
          TextField(
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
            decoration: InputDecoration(
              hintText: 'Search movies...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: (_isSearching == false)
                ? _buildPopularMoviesListView()
                : FutureBuilder<List<Map<String, dynamic>>>(
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
                  ),
          ),
        ],
      ),
    );
  }
}
