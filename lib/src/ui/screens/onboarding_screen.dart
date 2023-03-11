import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lomj/src/ui/screens/post/post_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildPage(
                    title: 'Welcome to MyApp',
                    image: 'assets/mary1.jpg',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut ante risus.',
                  ),
                  _buildPage(
                    title: 'Discover new things',
                    image: 'assets/mary1.jpg',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut ante risus.',
                  ),
                  _buildPage(
                    title: 'Connect with friends',
                    image: 'assets/mary1.jpg',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut ante risus.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (int index) => _buildDot(index: index),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      setState(() {
                        _currentPage -= 1;
                      });
                    }
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      setState(() {
                        _currentPage += 1;
                      });
                    } else {
                      // Navigate to the home screen
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PostScreen()));
                    }
                  },
                  child: Text(
                    _currentPage == 2 ? 'Get Started' : 'Next',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
      {required String title,
      required String image,
      required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 24.0),
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  Widget _buildDot({required int index}) {
    Color color = _currentPage == index ? Colors.blue : Colors.grey;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
