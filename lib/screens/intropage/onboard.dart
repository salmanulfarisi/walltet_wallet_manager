import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletx/main.dart';
import 'package:walletx/screens/homepage/navigationscreen.dart';
import 'package:walletx/screens/intropage/intro_widgets/buidpage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController(initialPage: 0);
  final nameController = TextEditingController();
  bool isLastPage = false;
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 3);
          },
          children: [
            const BuildPage(
              color: Colors.white,
              image: 'assets/lottie/images/Onboard1.png',
              title: 'Follow your plan and\n         dreams',
              description:
                  'Build your financial life.Make the right financial\n decisions.See only what is important for you.',
            ),
            const BuildPage(
              color: Colors.white,
              image: 'assets/lottie/images/Onboard2.png',
              title: 'Track Your Spending',
              description:
                  'Track and analyse spending immediately\n and automatically through the app.',
            ),
            const BuildPage(
              color: Colors.white,
              image: 'assets/lottie/images/Onbard3.png',
              title: 'Budget your money',
              description:
                  'Build healthy budgets and track your\n expenses in one place.',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/lottie/images/Onboard4.png'),
                      const SizedBox(
                        height: 64,
                      ),
                      Text(
                        'What is Your name?',
                        style: TextStyle(
                            color: Colors.teal.shade700,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () {
                checkName(context);
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                primary: Colors.white,
                backgroundColor: Colors.teal.shade700,
                minimumSize: const Size.fromHeight(80),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24),
              ),
            )
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(3),
                      child: const Text('Skip')),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: const WormEffect(
                          dotColor: Colors.black26,
                          activeDotColor: Colors.green),
                    ),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: const Text('Next')),
                ],
              ),
            ),
    );
  }

  void checkName(BuildContext context) async {
    final userName = nameController.text;

    if (userName.isNotEmpty) {
      final SharedPreferences userName = await SharedPreferences.getInstance();
      userName.setString(sharedName, nameController.text);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ScreenNavigation()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter your name'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
