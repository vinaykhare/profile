import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vinaykhare/model/web_model.dart';
import 'package:vinaykhare/utils/constants.dart';
// import 'package:vinaykhare/components/menu_options.dart';

class AppDrawer extends StatelessWidget {
  final double appWidth, appHeight;
  final WebModel webModel;
  final Function switchScreen;
  const AppDrawer({
    super.key,
    required this.appWidth,
    required this.appHeight,
    required this.webModel,
    required this.switchScreen,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: appWidth * 0.5,
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                assetMap["appBarBackground"]!,
              ),
              fit: BoxFit.none,
            ),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DrawerHeader(
                child: webModel.getWebAppLogo(
                  context,
                  appHeight,
                  appWidth,
                ),
              ),
              // ...webModel.getMenuOptions(context),
              TextButton(
                // onPressed: () => Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   MyHomePage.name,
                //   ModalRoute.withName(
                //     Navigator.defaultRouteName,
                //   ),
                // ),
                onPressed: () => launchUrlString(
                  "https://www.linkedin.com/in/vinay-kumar-khare-75b01623/",
                ),
                child: Text(
                  "LinkedIn",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              TextButton(
                onPressed: () => switchScreen(widgetAbout),
                child: Text(
                  "Donwload CV",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
