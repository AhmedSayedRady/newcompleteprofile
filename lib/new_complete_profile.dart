import 'package:flutter/material.dart';
import 'package:newcompleteprofile/bio.dart';
import 'package:newcompleteprofile/birth.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String title;
  final String note;

  final Widget body;

  BoardingModel({
    required this.title,
    required this.note,
    required this.body,
  });
}

class NewCompleteProfile extends StatefulWidget {
  const NewCompleteProfile({super.key});

  @override
  State<NewCompleteProfile> createState() => _NewCompleteProfileState();
}

class _NewCompleteProfileState extends State<NewCompleteProfile> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'On Board 1 Title',
      note: 'On Board 1 Body',
      body: const BirthdateCard(),
    ),
    BoardingModel(
      title: 'On Board 2 Title',
      note: 'On Board 2 Body',
      body: const CompleteProfileBioView(),
    ),
    BoardingModel(
      title: 'On Board 3 Title',
      note: 'On Board 3 Body',
      body: const BirthdateCard(),
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
        title: const Text(
          'Complete Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 64,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const LinearProgressIndicator(
              minHeight: 10.0,
              value: 0.5,
            ),
            Expanded(
              child: PageView.builder(
                physics: const ClampingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.deepOrange,
                        dotHeight: 10.0,
                        expansionFactor: 4.0,
                        dotWidth: 10.0,
                        spacing: 5.0,
                      ),
                      count: boarding.length,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 350,
                      height: 40,
                      color: Colors.grey[300],
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      width: 350,
                      height: 40,
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            model.note,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SingleChildScrollView(
            child: Container(
              child: model.body,
            ),
          ),
        ],
      );
}
