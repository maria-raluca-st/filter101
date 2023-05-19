import 'package:flutter/material.dart';

import '../../../../coordinator.dart';
import '../../../../routes.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> _pages = [
    {
      // 'image': 'assets/images/onboarding_1.png',
      'title': 'Title 1',
      'description': 'Description 1',
    },
    {
      // 'image': 'assets/images/onboarding_2.png',
      'title': 'Title 2',
      'description': 'Description 2',
    },
    {
      // 'image': 'assets/images/onboarding_3.png',
      'title': 'Title 3',
      'description': 'Description 3',
    },
  ];

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset(
                        //   page['image']!,
                        //   height: MediaQuery.of(context).size.height * 0.5,
                        // ),
                        SizedBox(height: 48.0),
                        Text(
                          page['title']!,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          page['description']!,
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
              padding: EdgeInsets.all(24.0),
              child: Column(
                children: [
                  if (_currentPageIndex == _pages.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        Coordinator.of(context).push(RouteEntity.homeScreen());
                      },
                      child: Text('Get Started'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                    ),
                  if (_currentPageIndex != _pages.length - 1)
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _currentPageIndex += 1;
                        });
                      },
                      child: Text('Next'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
