import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vinaykhare/model/web_model.dart';
import 'package:vinaykhare/utils/constants.dart';

/// Menu/Navigation Bar
///
/// A top menu bar with a text or image logo and
/// navigation links. Navigation links collapse into
/// a hamburger menu on screens smaller than 400px.

class WebMenuBar extends StatefulWidget {
  final double menuBarHeight, menuBarWidth;
  final WebModel webModel;

  final Function switchScreen;
  const WebMenuBar({
    super.key,
    required this.webModel,
    required this.switchScreen,
    required this.menuBarHeight,
    required this.menuBarWidth,
  });

  @override
  State<WebMenuBar> createState() => _WebMenuBarState();
}

class _WebMenuBarState extends State<WebMenuBar> {
  @override
  Widget build(BuildContext context) {
    // double appHeight = MediaQuery.of(context).size.height -
    //     MediaQuery.of(context).viewPadding.top -
    //     MediaQuery.of(context).viewPadding.bottom;

    double appWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: widget.menuBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (appWidth > 200)
                  widget.webModel.getWebAppLogo(
                    context,
                    widget.menuBarHeight,
                    widget.menuBarWidth,
                  ),
                if (appWidth > 500)
                  widget.webModel.getWebAppTitle(
                    context,
                    widget.menuBarHeight,
                    widget.menuBarWidth,
                  ),
                // webModel.getWebAppLogo(context),
                // webModel.getWebAppTitle(context),
              ],
            ),
          ),
          if (appWidth > 600)
            Row(
              children: [
                //...webModel.getMenuOptions(context),
                TextButton(
                  //onPressed: () => widget.switchScreen(widgetSlideShow),
                  onPressed: () => launchUrlString(
                    "https://www.linkedin.com/in/vinay-kumar-khare-75b01623/",
                  ),
                  child: Text(
                    "LinkedIn",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                TextButton(
                  onPressed: () => widget.switchScreen(widgetAbout),
                  child: Text(
                    "Download CV",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
