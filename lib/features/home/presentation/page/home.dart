// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // class HomeScreen extends StatefulWidget {
// //   @override
// //   _HomeScreenState createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   String _searchQuery = '';
// //   List<dynamic> _posts = [];

// //   void _updateSearchQuery(String query) {
// //     setState(() {
// //       _searchQuery = query;
// //     });
// //   }

// //   Future<void> _fetchSubredditData() async {
// //     final response = await http
// //         .get(Uri.parse('https://www.reddit.com/r/$_searchQuery.json'));

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       setState(() {
// //         _posts = data['data']['children'];
// //       });
// //     } else {
// //       setState(() {
// //         _posts = [];
// //       });
// //     }
// //   }

// //   void _navigateToCommentsScreen(String postId) {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => CommentsScreen(postId: postId),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Home'),
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: TextField(
// //               onChanged: _updateSearchQuery,
// //               decoration: InputDecoration(
// //                 hintText: 'Search...',
// //                 suffixIcon: IconButton(
// //                   icon: Icon(Icons.search),
// //                   onPressed: _fetchSubredditData,
// //                 ),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 16.0),
// //           if (_posts.isNotEmpty)
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: _posts.length,
// //                 itemBuilder: (context, index) {
// //                   final post = _posts[index]['data'];
// //                   return ListTile(
// //                     title: Text(post['title']),
// //                     subtitle: Text(post['author']),
// //                     onTap: () => _navigateToCommentsScreen(post['id']),
// //                   );
// //                 },
// //               ),
// //             )
// //           else
// //             Text(
// //               'No posts found',
// //               style: TextStyle(fontSize: 16.0),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CommentsScreen extends StatelessWidget {
// //   final String postId;

// //   CommentsScreen({required this.postId});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Comments'),
// //       ),
// //       body: Center(
// //         child: Text('Comments for Post: $postId'),
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------------------------------------------------

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // class HomeScreen extends StatefulWidget {
// //   @override
// //   _HomeScreenState createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   final _subredditController = TextEditingController();
// //   List<dynamic> _posts = [];
// //   String _after = '';

// //   final _scrollController = ScrollController();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _scrollController.addListener(_scrollListener);
// //   }

// //   @override
// //   void dispose() {
// //     _subredditController.dispose();
// //     _scrollController.removeListener(_scrollListener);
// //     super.dispose();
// //   }

// //   void _scrollListener() {
// //     if (_scrollController.position.pixels ==
// //         _scrollController.position.maxScrollExtent) {
// //       _getPosts();
// //     }
// //   }

// //   Future<void> _getPosts() async {
// //     final subreddit = _subredditController.text.trim();
// //     if (subreddit.isEmpty) {
// //       return;
// //     }

// //     final url = 'https://www.reddit.com/r/$subreddit.json?after=$_after';
// //     final response = await http.get(Uri.parse(url));
// //     if (response.statusCode == 200) {
// //       final decodedData = json.decode(response.body);
// //       final posts = decodedData['data']['children'];
// //       final after = decodedData['data']['after'];
// //       setState(() {
// //         _posts.addAll(posts);
// //         _after = after;
// //       });
// //     }
// //   }

// //   void _navigateToCommentsScreen(Map<String, dynamic> post) {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => CommentsScreen(post: post)),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: TextField(
// //           controller: _subredditController,
// //           decoration: InputDecoration(
// //             hintText: 'Search for a subreddit...',
// //             hintStyle: TextStyle(color: Colors.white54),
// //             border: InputBorder.none,
// //           ),
// //           style: TextStyle(color: Colors.white),
// //           textInputAction: TextInputAction.search,
// //           onSubmitted: (_) {
// //             _getPosts();
// //           },
// //         ),
// //       ),
// //       body: ListView.builder(
// //         controller: _scrollController,
// //         itemCount: _posts.length,
// //         itemBuilder: (context, index) {
// //           final post = _posts[index]['data'];
// //           return ListTile(
// //             title: Text(post['title']),
// //             subtitle: Text('by ${post['author']}'),
// //             trailing: Icon(Icons.arrow_forward_ios),
// //             onTap: () {
// //               _navigateToCommentsScreen(post);
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // class CommentsScreen extends StatelessWidget {
// //   final Map<String, dynamic> post;

// //   CommentsScreen({required this.post});

// //   @override
// //   Widget build(BuildContext context) {
// //     final comments = post['num_comments'];
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Comments'),
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Center(
// //             child: Text(
// //               '${post['title']}',
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //           Center(
// //             child: Text(
// //               'by ${post['author']}',
// //               style: TextStyle(fontSize: 16),
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //           // Add code to fetch and display comments here
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ---------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';

// import '../../../../data/post.dart';
// import '../../../../network/reddit_service.dart';
// import '../../../post_details/post_details_page.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<RedditPost> posts = [];
//   String subredditName = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchRedditPosts();
//   }

//   Future<void> fetchRedditPosts() async {
//     try {
//       List<RedditPost> fetchedPosts =
//           await RedditService.fetchPosts(subredditName);
//       setState(() {
//         posts = fetchedPosts;
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reddit Posts'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   subredditName = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Enter Subreddit Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: fetchRedditPosts,
//             child: Text('Fetch Posts'),
//           ),
//           SizedBox(height: 16),
//           Expanded(
//             child: ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 final post = posts[index];
//                 return ListTile(
//                   title: Text(post.title),
//                   subtitle: Text(post.selftext),
//                   onTap: () {
//                     navigateToPostDetails(post);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void navigateToPostDetails(RedditPost post) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => PostDetailsPage(post: post)),
//     );
//   }
// }

// --------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import '../../../../data/post.dart';
import '../../../../network/reddit_service.dart';
import '../../../../utils/classifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RedditPost> posts = [];
  String subredditName = '';
  late Classifier classifier;

  @override
  void initState() {
    super.initState();
    classifier = Classifier();
    fetchRedditPosts();
  }

  Future<void> fetchRedditPosts() async {
    try {
      List<RedditPost> fetchedPosts =
          await RedditService.fetchPosts(subredditName);
      setState(() {
        posts = fetchedPosts;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void classifyPost(String text) {
    final label = classifier.classify(text);
    print(text);
    if (label != null) {
      print(label);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit Posts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  subredditName = value;
                  print(subredditName);
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter Subreddit Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: fetchRedditPosts,
            child: const Text('Fetch Posts'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.selftext),
                  onTap: () {
                    classifyPost(post.title);
                    // classifyPost(
                    //     "They must be fucked in the head if they are black people.");
                    // navigateToPostDetails(post);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // void navigateToPostDetails(RedditPost post) {
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => PostDetailsPage(post: post)),
  //   // );
  // }
}
