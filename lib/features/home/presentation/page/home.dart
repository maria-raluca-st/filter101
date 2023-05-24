// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../constants/colour.dart';
// import '../../../../constants/text_style.dart';
// import '../../../../coordinator.dart';
// import '../../../../routes.dart';
// import '../../../search_screen/search_bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late SearchBloc searchBloc;
//   bool hateSpeechSelected = false;
//   bool negativeContentSelected = false;
//   bool humorSelected = false;
//   bool positiveContentSelected = false;
//   bool sarcasmExcludingSelected = false;
//   bool sarcasmIncludingSelected = false;

//   @override
//   void initState() {
//     super.initState();
//     searchBloc = SearchBloc();
//   }

//   @override
//   void dispose() {
//     searchBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<SearchBloc>.value(
//       value: searchBloc,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: SizedBox(),
//           title: Text(
//             'Home',
//             style: TextStyles.heading(
//               color: Colour.white,
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           backgroundColor: Colour.hunterGreen,
//           centerTitle: true,
//           elevation: 0,
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 60),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Please choose a community to explore: ',
//                 style: TextStyles.heading(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextField(
//                 onChanged: (value) {
//                   searchBloc.add(ChangeSubredditEvent(subreddit: value));
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Enter Subreddit Name',
//                   labelStyle: TextStyles.body(color: Colour.black),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     'Excluding',
//                     style: TextStyles.heading(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             hateSpeechSelected = !hateSpeechSelected;
//                             searchBloc.add(
//                               SelectCategoryEvent(
//                                 category: 'hateSpeech',
//                                 selected: hateSpeechSelected,
//                               ),
//                             );
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: hateSpeechSelected
//                               ? Colour.hunterGreen
//                               : Colour.ashGray,
//                         ),
//                         child: Text(
//                           'Hate Speech',
//                           style: TextStyles.body(
//                             color: hateSpeechSelected
//                                 ? Colour.white
//                                 : Colour.black,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 20),
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             negativeContentSelected = !negativeContentSelected;
//                             searchBloc.add(
//                               SelectCategoryEvent(
//                                 category: 'negativeContent',
//                                 selected: negativeContentSelected,
//                               ),
//                             );
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: negativeContentSelected
//                               ? Colour.hunterGreen
//                               : Colour.ashGray,
//                         ),
//                         child: Text(
//                           'Negative Content',
//                           style: TextStyles.body(
//                             color: negativeContentSelected
//                                 ? Colour.white
//                                 : Colour.black,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         sarcasmExcludingSelected = !sarcasmExcludingSelected;
//                         searchBloc.add(
//                           SelectCategoryEvent(
//                             category: 'sarcasmExcluding',
//                             selected: sarcasmExcludingSelected,
//                           ),
//                         );
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: sarcasmExcludingSelected
//                           ? Colour.hunterGreen
//                           : Colour.ashGray,
//                     ),
//                     child: Text(
//                       'Sarcasm',
//                       style: TextStyles.body(
//                         color: sarcasmExcludingSelected
//                             ? Colour.white
//                             : Colour.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     'Including',
//                     style: TextStyles.heading(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             humorSelected = !humorSelected;
//                             searchBloc.add(
//                               SelectCategoryEvent(
//                                 category: 'humor',
//                                 selected: humorSelected,
//                               ),
//                             );
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: humorSelected
//                               ? Colour.hunterGreen
//                               : Colour.ashGray,
//                         ),
//                         child: Text(
//                           'Humor',
//                           style: TextStyles.body(
//                             color: humorSelected ? Colour.white : Colour.black,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 16.0),
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             positiveContentSelected = !positiveContentSelected;
//                             searchBloc.add(
//                               SelectCategoryEvent(
//                                 category: 'positiveContent',
//                                 selected: positiveContentSelected,
//                               ),
//                             );
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: positiveContentSelected
//                               ? Colour.hunterGreen
//                               : Colour.ashGray,
//                         ),
//                         child: Text(
//                           'Positive Content',
//                           style: TextStyles.body(
//                             color: positiveContentSelected
//                                 ? Colour.white
//                                 : Colour.black,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 16.0),
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             sarcasmIncludingSelected =
//                                 !sarcasmIncludingSelected;
//                             searchBloc.add(
//                               SelectCategoryEvent(
//                                 category: 'sarcasmIncluding',
//                                 selected: sarcasmIncludingSelected,
//                               ),
//                             );
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: sarcasmIncludingSelected
//                               ? Colour.hunterGreen
//                               : Colour.ashGray,
//                         ),
//                         child: Text(
//                           'Sarcasm',
//                           style: TextStyles.body(
//                             color: sarcasmIncludingSelected
//                                 ? Colour.white
//                                 : Colour.black,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 100,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 80),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 height: 50.0,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Coordinator.of(context).push(
//                       RouteEntity.searchPage(searchBloc: SearchBloc()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colour.hunterGreen,
//                   ),
//                   child: Text(
//                     'Search',
//                     style: TextStyles.subheading(color: Colour.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// -------------------------------------------

import 'package:filter101/features/search_screen/search_bloc.dart';
import 'package:filter101/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SearchBloc searchBloc;
  late TextEditingController _subredditController;
  late bool hateSpeechSelected;
  late bool negativeContentSelected;
  late bool humorSelected;
  late bool positiveContentSelected;
  late bool sarcasmExcludingSelected;
  late bool sarcasmIncludingSelected;

  @override
  void initState() {
    super.initState();
    searchBloc = SearchBloc();
    _subredditController = TextEditingController();
    hateSpeechSelected = false;
    negativeContentSelected = false;
    humorSelected = false;
    positiveContentSelected = false;
    sarcasmExcludingSelected = false;
    sarcasmIncludingSelected = false;
  }

  @override
  void dispose() {
    searchBloc.close();
    _subredditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>.value(
      value: searchBloc,
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          title: const Text('Home'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Please choose a community to explore: ',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _subredditController,
                onChanged: (value) {
                  searchBloc.add(ChangeSubredditEvent(subreddit: value));
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Subreddit Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    'Excluding',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            hateSpeechSelected = !hateSpeechSelected;
                            searchBloc.add(
                              SelectCategoryEvent(
                                category: 'hateSpeech',
                                selected: hateSpeechSelected,
                              ),
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              hateSpeechSelected ? Colors.green : Colors.grey,
                        ),
                        child: const Text('Hate Speech'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            negativeContentSelected = !negativeContentSelected;
                            searchBloc.add(
                              SelectCategoryEvent(
                                category: 'negativeContent',
                                selected: negativeContentSelected,
                              ),
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: negativeContentSelected
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: const Text('Negative Content'),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sarcasmExcludingSelected = !sarcasmExcludingSelected;
                      searchBloc.add(
                        SelectCategoryEvent(
                          category: 'sarcasmExcluding',
                          selected: sarcasmExcludingSelected,
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        sarcasmExcludingSelected ? Colors.green : Colors.grey,
                  ),
                  child: const Text('Sarcasm'),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    'Including',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            humorSelected = !humorSelected;
                            searchBloc.add(
                              SelectCategoryEvent(
                                category: 'humor',
                                selected: humorSelected,
                              ),
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: humorSelected ? Colors.green : Colors.grey,
                        ),
                        child: const Text('Humor'),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            positiveContentSelected = !positiveContentSelected;
                            searchBloc.add(
                              SelectCategoryEvent(
                                category: 'positiveContent',
                                selected: positiveContentSelected,
                              ),
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: positiveContentSelected
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: const Text('Positive Content'),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sarcasmIncludingSelected =
                                !sarcasmIncludingSelected;
                            searchBloc.add(
                              SelectCategoryEvent(
                                category: 'sarcasmIncluding',
                                selected: sarcasmIncludingSelected,
                              ),
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: sarcasmIncludingSelected
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: const Text('Sarcasm'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    // searchBloc.fetchData(_subredditController.text);
                    searchBloc
                        .add(SearchEvent.fetchData(_subredditController.text));
                    Navigator.pushNamed(context, Routes.searchScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
