import 'package:flutter/material.dart';
import '../../../../constants/colour.dart';
import '../../../../constants/text_style.dart';
import '../../../../coordinator.dart';
import '../../../../routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/onboarding_1.jpg',
      'title': 'We know how daunting the world of social media is.',
      'description': ' And by association, the world of reddit.',
    },
    {
      'image': 'assets/images/onboarding_2.jpg',
      'title': 'It may be overwhelming at first, but we are here to help!',
      'description':
          'With the help of Artificial Intelligence, we will do our best to help you filter the noise out.',
    },
    {
      'image': 'assets/images/onboarding_3.jpg',
      'title': 'How does it work?',
      'description':
          'You can choose your preferred filters from our list, and we will do the rest for you. For any given subreddit, we will first filter out the posts that are not in English. And the rest... well, we will let you decide whether to continue browsing or not based on the predictions we make.',
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
                          'Get Started',
                          style: TextStyles.body(),
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
