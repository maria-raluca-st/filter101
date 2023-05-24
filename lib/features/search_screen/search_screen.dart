import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filter101/data/post.dart';
import 'package:filter101/network/reddit_service.dart';

import 'search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(),
      child: _SearchScreenContent(),
    );
  }
}

class _SearchScreenContent extends StatefulWidget {
  @override
  _SearchScreenContentState createState() => _SearchScreenContentState();
}

class _SearchScreenContentState extends State<_SearchScreenContent> {
  late SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = context.read<SearchBloc>();
    _searchBloc.subredditName = 'Your initial subreddit name here';
  }

  @override
  void dispose() {
    _searchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchLoadedState) {
            final probabilities = state.probabilities;
            final posts = state.posts;

            return Column(
              children: [
                Column(
                  children: [
                    if (probabilities.containsKey('hateSpeechProbability'))
                      Text(
                        'Hate Speech Score: ${probabilities['hateSpeechProbability']!.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    // Display scores for other categories here

                    SizedBox(height: 20),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.subreddit),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is SearchErrorState) {
            return Center(
              child: Text(
                'An error occurred while fetching data.',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
