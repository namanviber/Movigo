import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ApiLib extends StatefulWidget {
  const ApiLib({Key? key}) : super(key: key);

  @override
  State<ApiLib> createState() => _ApiLibState();
}

class _ApiLibState extends State<ApiLib> {
  static const _apiKey = '60b574988af5f6b7e4f9fd74504d7bbe';
  static const _readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MGI1NzQ5ODhhZjVmNmI3ZTRmOWZkNzQ1MDRkN2JiZSIsInN1YiI6IjYzZTEzOTkyYzkwNDRjMDA5Y2RlZmE1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.V8oV0LTM1Ta0d6YCT7d1I2C582KaOeeaODpJFahRbqg';

  List trendingmovies = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdblogs = TMDB(
      ApiKeys(_apiKey, _readaccesstoken),
    );

    Map trendingmap = await tmdblogs.v3.trending.getTrending();
    setState(() {
      trendingmovies = trendingmap['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
