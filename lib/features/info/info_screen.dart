import 'package:flutter/material.dart';
import '../../../../constants/colour.dart';
import '../../../../constants/text_style.dart';
import '../../../../coordinator.dart';
import '../../../../routes.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<InfoScreen> {
  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/info_1.jpg',
      'title': 'About the app',
      'description':
          ' On the home screen, you can choose your preferred filters from our list. After entering a community name, we will apply the Tensorflow models to get the predictions for you.',
    },
    {
      'image': 'assets/images/info_2.jpg',
      'title': 'Functionalities',
      'description':
          'On the favorites page, you can save your preerred filters for the current session. Note that after you logout, the favorites list will be cleared. This ensures that you can start fresh for each login session.',
    },
    {
      'image': 'assets/images/info_3.jpg',
      'title': 'The profile page',
      'description':
          'On the profile page, you can choose a profile picture, change your username and password or logout. ',
    },
  ];

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page['image']!,
                          height: MediaQuery.of(context).size.height * 0.5,
                        ),
                        const SizedBox(height: 48.0),
                        Text(
                          page['title']!,
                          style: TextStyles.heading(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colour.hunterGreen),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          page['description']!,
                          style: TextStyles.body(color: Colour.hunterGreen),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_currentPageIndex == _pages.length - 1)
                    SizedBox(
                      width: double.infinity,
                      height: 48.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Coordinator.of(context)
                              .push(RouteEntity.homeScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colour.hunterGreen,
                        ),
                        child: Text(
                          'Go to home page',
                          style: TextStyles.body(color: Colour.white),
                        ),
                      ),
                    ),
                  if (_currentPageIndex != _pages.length - 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicators(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicators() {
    return List.generate(
      _pages.length,
      (index) => Container(
        width: 8.0,
        height: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              index == _currentPageIndex ? Colour.hunterGreen : Colour.ashGray,
        ),
      ),
    );
  }
}
