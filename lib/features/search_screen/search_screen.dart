import 'package:filter101/constants/colour.dart';
import 'package:filter101/constants/text_style.dart';
import 'package:filter101/features/category_details/category_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../coordinator.dart';
import '../../routes.dart';
import 'search_bloc.dart';

class SearchScreen extends StatelessWidget {
  final SearchBloc searchBloc;

  const SearchScreen({required this.searchBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          'Prediction Results',
          style: TextStyles.heading(
            color: Colour.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colour.hunterGreen,
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        bloc: searchBloc,
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colour.hunterGreen,
                semanticsLabel: 'Loading',
                strokeWidth: 6.0,
              ),
            );
          } else if (state is SearchLoadedState) {
            final probabilities = state.probabilities;
            final selectedCategories = searchBloc.selectedCategories;
            final filteredCategories = selectedCategories.keys
                .where((category) => selectedCategories[category] == true)
                .toList();

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCategories.length,
                    itemBuilder: (context, index) {
                      final category = filteredCategories[index];
                      final probability =
                          probabilities![category]?.toStringAsFixed(2) ?? 'N/A';
                      return ListTile(
                        // title: Text(category),
                        title: Text(_getCategoryName(category),
                            style: TextStyles.heading(color: Colour.black)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text('Probability: $probability'),
                            SizedBox(height: 4.0),
                            Row(
                              children: [
                                Text(
                                  _getCategorySection(category) +
                                      ': ' +
                                      probability,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _getCategoryColor(category),
                                  ),
                                ),
                                // SizedBox(width: 100.0),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          Coordinator.of(context).push(
                            RouteEntity.detailsScreen(
                              category,
                              searchBloc.processedPosts,
                              searchBloc.processedComments,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 32.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 48.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Coordinator.of(context).push(RouteEntity.homeScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colour.hunterGreen,
                    ),
                    child: Text(
                      'Search again',
                      style: TextStyles.body(color: Colour.white),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text('OR',
                    style: TextStyles.heading(color: Colour.hunterGreen)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'You can now explore more in-depth each category by pressing the correct tile. This will lead to a few relevant examples of posts and comments from r/${searchBloc.subredditName}',
                    textAlign: TextAlign.center,
                    style: TextStyles.body(color: Colour.hunterGreen),
                  ),
                ),
                SizedBox(height: 16.0)
              ],
            );
          } else if (state is SearchErrorState) {
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'An error occurred while fetching data. Please try again.',
                    style: TextStyles.subheading(color: Colour.cordovan),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Dismiss the dialog
                      Coordinator.of(context).push(
                          RouteEntity.homeScreen()); // Navigate to HomeScreen
                    },
                    child: Text('Search again'),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  String _getCategorySection(String category) {
    if (category == 'hateSpeech' || category == 'sarcasmExcluding') {
      return 'Probability of exclusion';
    } else if (category == 'humor' ||
        category == 'positiveContent' ||
        category == 'sarcasmIncluding') {
      return 'Probability of inclusion';
    } else {
      return '';
    }
  }

  String _getCategoryName(String category) {
    if (category == 'hateSpeech') {
      return 'Hate Speech';
    } else if (category == 'sarcasmExcluding')
      return 'Excluding Sarcasm';
    else if (category == 'humor')
      return 'Humor';
    else if (category == 'positiveContent')
      return 'Positive Content';
    else if (category == 'sarcasmIncluding') {
      return 'Including Sarcasm';
    } else {
      return '';
    }
  }

  Color _getCategoryColor(String category) {
    if (category == 'hateSpeech' || category == 'sarcasmExcluding') {
      return Colour.atomicTangerine;
    } else if (category == 'humor' ||
        category == 'positiveContent' ||
        category == 'sarcasmIncluding') {
      return Colour.hunterGreen;
    } else {
      return Colour.black;
    }
  }
}
