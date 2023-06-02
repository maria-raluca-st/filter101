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
            ));
          } else if (state is SearchLoadedState) {
            final probabilities = state.probabilities;
            final selectedCategories = searchBloc.selectedCategories;
            final filteredCategories = selectedCategories.keys
                .where((category) => selectedCategories[category] == true)
                .toList();

            return ListView.builder(
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final category = filteredCategories[index];
                final probability =
                    probabilities![category]?.toStringAsFixed(2) ?? 'N/A';

                return ListTile(
                  title: Text(category),
                  subtitle: Text('Probability: $probability'),
                  onTap: () {
                    // // Handle tile click
                    Coordinator.of(context).push(RouteEntity.detailsScreen(
                        category, searchBloc.processedPosts));

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CategoryDetailsScreen(
                    //       category: category,
                    //       posts: searchBloc.processedPosts,
                    //     ),
                    //   ),
                    // );
                  },
                );
              },
            );
          } else if (state is SearchErrorState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'An error occurred while fetching data. Please try again.',
                      style: TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16.0),
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
