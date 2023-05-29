import 'package:filter101/features/search_screen/search_bloc.dart';
import 'package:filter101/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/colour.dart';
import '../../../../constants/text_style.dart';
import '../../../search_screen/search_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(),
      child: _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  late TextEditingController _subredditController;

  late bool hundredSelected;
  late bool twoHundredSelected;
  late bool thousandSelected;

  @override
  void initState() {
    super.initState();
    _subredditController = TextEditingController();
    hundredSelected = false;
    twoHundredSelected = true;
    thousandSelected = false;
  }

  @override
  void dispose() {
    _subredditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context)
      ..add(FetchInitialDataEvent());

    return BlocProvider.value(
        value: searchBloc,
        child: Scaffold(
          appBar: AppBar(
            leading: SizedBox(),
            title: Text(
              'Home',
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
            builder: (context, state) {
              if (state is SearchLoadingState) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colour.hunterGreen,
                  semanticsLabel: 'Loading',
                  strokeWidth: 6.0,
                ));
              } else if (state is SearchLoadedState) {
                var subredditName = searchBloc.subredditName ?? '';
                var nrTextsAnalyzed = searchBloc.nrTextsAnalyzed;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Please choose a community to explore: ',
                          style: TextStyles.subheading(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: _subredditController,
                          onChanged: (value) {
                            print('Change Subreddit Event: $value');
                            // searchBloc.add(ChangeSubredditEvent(subreddit: value));
                            subredditName = value;
                            print(
                                'Subreddit Name Home: ${searchBloc.subredditName}');
                          },
                          decoration: const InputDecoration(
                            labelText: 'Enter Subreddit Name',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colour.hunterGreen),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colour.hunterGreen),
                            ),
                            labelStyle: TextStyle(color: Colour.hunterGreen),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Excluding',
                              style: TextStyles.heading(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      searchBloc.add(
                                        SelectCategoryEvent(
                                          category: 'hateSpeech',
                                          selected:
                                              !searchBloc.selectedCategories[
                                                  'hateSpeech']!,
                                        ),
                                      );
                                      print(searchBloc
                                          .selectedCategories['hateSpeech']);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: searchBloc
                                            .selectedCategories['hateSpeech']!
                                        ? Colour.hunterGreen
                                        : Colour.ashGray,
                                  ),
                                  child: const Text('Hate Speech'),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      searchBloc.add(
                                        SelectCategoryEvent(
                                          category: 'negativeContent',
                                          selected:
                                              !searchBloc.selectedCategories[
                                                  'negativeContent']!,
                                        ),
                                      );
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: searchBloc.selectedCategories[
                                            'negativeContent']!
                                        ? Colour.hunterGreen
                                        : Colour.ashGray,
                                  ),
                                  child: const Text('Negative Content'),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  searchBloc.add(
                                    SelectCategoryEvent(
                                      category: 'sarcasmExcluding',
                                      selected: !searchBloc.selectedCategories[
                                          'sarcasmExcluding']!,
                                    ),
                                  );
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: searchBloc
                                        .selectedCategories['sarcasmExcluding']!
                                    ? Colour.hunterGreen
                                    : Colour.ashGray,
                              ),
                              child: const Text('Sarcasm'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Including',
                              style: TextStyles.heading(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      searchBloc.add(
                                        SelectCategoryEvent(
                                          category: 'humor',
                                          selected: !searchBloc
                                              .selectedCategories['humor']!,
                                        ),
                                      );
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        searchBloc.selectedCategories['humor']!
                                            ? Colour.hunterGreen
                                            : Colour.ashGray,
                                  ),
                                  child: const Text('Humor'),
                                ),
                                const SizedBox(width: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      searchBloc.add(
                                        SelectCategoryEvent(
                                          category: 'positiveContent',
                                          selected:
                                              !searchBloc.selectedCategories[
                                                  'positiveContent']!,
                                        ),
                                      );
                                      print(searchBloc.selectedCategories[
                                          'positiveContent']);
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: searchBloc.selectedCategories[
                                            'positiveContent']!
                                        ? Colour.hunterGreen
                                        : Colour.ashGray,
                                  ),
                                  child: const Text('Positive Content'),
                                ),
                                const SizedBox(width: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      searchBloc.add(
                                        SelectCategoryEvent(
                                          category: 'sarcasmIncluding',
                                          selected:
                                              !searchBloc.selectedCategories[
                                                  'sarcasmIncluding']!,
                                        ),
                                      );
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: searchBloc.selectedCategories[
                                            'sarcasmIncluding']!
                                        ? Colour.hunterGreen
                                        : Colour.ashGray,
                                  ),
                                  child: const Text('Sarcasm'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Choose the number of texts(posts and comments) to be analyzed: ',
                              style: TextStyles.heading(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      hundredSelected = true;
                                      twoHundredSelected = false;
                                      thousandSelected = false;
                                      searchBloc.nrTextsAnalyzed = 100;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: hundredSelected
                                        ? Colour.hunterGreen
                                        : Colour.ashGray,
                                  ),
                                  child: const Text('100'),
                                ),
                                const SizedBox(width: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      hundredSelected = false;
                                      twoHundredSelected = true;
                                      thousandSelected = false;
                                      searchBloc.nrTextsAnalyzed = 200;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: twoHundredSelected
                                        ? Colour.hunterGreen
                                        : Colour.ashGray,
                                  ),
                                  child: const Text('200'),
                                ),
                                const SizedBox(width: 16.0),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      hundredSelected = false;
                                      twoHundredSelected = false;
                                      thousandSelected = true;
                                      searchBloc.nrTextsAnalyzed = 1000;
                                    });
                                    // print('Sub Name: ${searchBloc.subredditName}');
                                    print(
                                        'Number of texts being analyzed: ${searchBloc.nrTextsAnalyzed}');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: thousandSelected
                                        ? Colour.hunterGreen
                                        : Colour.ashGray,
                                  ),
                                  child: const Text('1000'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50.0,
                          child: ValueListenableBuilder<TextEditingValue>(
                            valueListenable: _subredditController,
                            builder: (context, value, _) {
                              final subredditName = value.text;

                              return ElevatedButton(
                                onPressed: (subredditName.isNotEmpty &&
                                        (searchBloc
                                                .selectedCategories['humor']! ||
                                            searchBloc.selectedCategories[
                                                'hateSpeech']! ||
                                            searchBloc.selectedCategories[
                                                'negativeContent']! ||
                                            searchBloc.selectedCategories[
                                                'positiveContent']! ||
                                            searchBloc.selectedCategories[
                                                'sarcasmExcluding']! ||
                                            searchBloc.selectedCategories[
                                                'sarcasmIncluding']!))
                                    ? () {
                                        print(
                                            'This sub name is searched: $subredditName');
                                        searchBloc.add(
                                          ChangeSubredditEvent(
                                              subreddit: subredditName),
                                        );

                                        searchBloc.add(SearchEvent.fetchData(
                                            subredditName));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SearchScreen(
                                                searchBloc: searchBloc),
                                          ),
                                        );
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colour.hunterGreen,
                                  disabledBackgroundColor: Colors.grey,
                                ),
                                child: const Text(
                                  'Search',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
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
              ;
            },
          ),
        ));
  }
}
