import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vinaykhare/utils/constants.dart';
import 'package:vinaykhare/widgets/slide_show_pages/cat_ad.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SlideShow extends StatefulWidget {
  final double slideShowHeight, slideShowWidth;
  const SlideShow({
    super.key,
    required this.slideShowHeight,
    required this.slideShowWidth,
  });

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  Timer? countdownTimer;
  int currentSlide = 0, secondsPassed = 0;
  bool pageInit = false, playingSlides = true;

  List<Map<String, dynamic>> slides = [
    {
      "widget": const CatAd(),
      "readMorelink": 'https://www.linkedin.com/in/vinay-kumar-khare-75b01623/',
    },
  ];

  void incrementSlide() {
    setState(() {
      secondsPassed = 0;
      if (currentSlide < (slides.length - 1)) {
        currentSlide++;
      } else {
        currentSlide = 0;
      }
    });
  }

  void decrementSlide() {
    setState(() {
      secondsPassed = 0;
      if (currentSlide > 0) {
        currentSlide--;
      } else {
        currentSlide = (slides.length - 1);
      }
    });
  }

  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (_) {
        setState(
          () {
            if (secondsPassed == slideShowDuration) {
              incrementSlide();
            } else {
              secondsPassed++;
            }
          },
        );
      },
    );
  }

  void stopTimer() {
    setState(() {
      if (countdownTimer != null) countdownTimer?.cancel();
    });
  }

  void resetTimer() {
    stopTimer();
    setState(() => currentSlide = 0);
  }

  @override
  void dispose() {
    if (countdownTimer != null) countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (pageInit == false) {
      startTimer();
      pageInit = true;
    }
    // return SizedBox(
    //   height: widget.slideShowHeight,
    //   child: Column(
    //     children: [slides[currentSlide]],
    //   ),
    // );
    var readMoreButton = TextButton.icon(
      onPressed: () => launchUrlString(
        slides[currentSlide]["readMorelink"],
      ),
      icon: const Icon(
        Icons.read_more_outlined,
      ),
      label: const Text(
        "Take a Look",
        // style: Theme.of(context).textTheme.labelMedium,
      ),
    );
    return SizedBox(
      //height: widget.slideShowHeight,
      width: widget.slideShowWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: widget.slideShowHeight,
            child: slides[currentSlide]["widget"],
          ),
          if (slides.length > 1)
            Container(
              height: widget.slideShowHeight * 0.07,
              margin: EdgeInsets.only(bottom: widget.slideShowHeight * 0.02),
              padding: EdgeInsets.symmetric(
                  horizontal: widget.slideShowHeight * 0.05),
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: slides.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => setState(() {
                      currentSlide = index;
                    }),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (index == 0)
                          IconButton(
                            onPressed: () {
                              if (playingSlides) {
                                stopTimer();
                              } else {
                                startTimer();
                              }
                              setState(() {
                                playingSlides = !playingSlides;
                              });
                            },
                            icon: Icon(
                              playingSlides
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              color: Theme.of(context).shadowColor,
                            ),
                          ),
                        if (index == 0)
                          IconButton(
                            onPressed: () => decrementSlide(),
                            icon: const Icon(
                              Icons.arrow_circle_left,
                            ),
                          ),
                        Stack(
                          children: [
                            Container(
                              height: widget.slideShowHeight * 0.01,
                              width: (index == currentSlide)
                                  ? widget.slideShowWidth * 0.1
                                  : widget.slideShowWidth * 0.05,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            if (index == currentSlide)
                              Container(
                                height: widget.slideShowHeight * 0.01,
                                width: ((widget.slideShowWidth * 0.1) /
                                        slideShowDuration) *
                                    secondsPassed,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          width: widget.slideShowWidth * 0.01,
                        ),
                        if (index == slides.length - 1)
                          IconButton(
                            onPressed: () => incrementSlide(),
                            icon: const Icon(
                              Icons.arrow_circle_right,
                            ),
                          ),
                        if (index == slides.length - 1) readMoreButton,
                      ],
                    ),
                  );
                },
              ),
            )
          else
            Container(
              height: widget.slideShowHeight * 0.07,
              margin: EdgeInsets.only(bottom: widget.slideShowHeight * 0.02),
              padding: EdgeInsets.symmetric(
                  horizontal: widget.slideShowHeight * 0.05),
              child: readMoreButton,
            ),
        ],
      ),
    );
  }
}
