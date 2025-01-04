import 'package:flutter/material.dart';
import 'package:vinaykhare/model/web_model.dart';
import 'package:vinaykhare/utils/constants.dart';
import 'package:vinaykhare/widgets/app_drawer.dart';
import 'package:vinaykhare/widgets/footer.dart';
import 'package:vinaykhare/widgets/slide_show.dart';
import 'package:vinaykhare/widgets/web_menu_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static const String name = '/home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool initPage = false;
  late WebModel webModel;
  late double appHeight, appWidth;
  String currentWidgetToShow = widgetSlideShow;
  void switchScreen(String screenName) {
    setState(() {
      currentWidgetToShow = screenName;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!initPage) {
      webModel = WebModel(context);

      initPage = true;
    }

    appHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top -
        MediaQuery.of(context).viewPadding.bottom;

    appWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      endDrawer: (appWidth > 600)
          ? null
          : AppDrawer(
              appHeight: appHeight,
              appWidth: appWidth,
              webModel: webModel,
              switchScreen: switchScreen,
            ),
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage(
            assetMap["appBarBackground"]!,
          ),
          fit: BoxFit.none,
        ),
        toolbarHeight: appHeight * 0.10,
        title: WebMenuBar(
          menuBarHeight: appHeight * 0.10,
          menuBarWidth: appWidth,
          webModel: webModel,
          switchScreen: switchScreen,
        ),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                assetMap["appBarBackground"]!,
              ),
              fit: BoxFit.none,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      spreadRadius: constraints.maxHeight * 0.02,
                      blurRadius: constraints.maxHeight * 0.02,
                      offset: Offset(
                        constraints.minWidth,
                        constraints.minHeight,
                      ),
                    ),
                  ],
                ),
                child: (currentWidgetToShow == widgetSlideShow)
                    ? SlideShow(
                        slideShowHeight: constraints.maxHeight * 0.90,
                        slideShowWidth: constraints.maxWidth,
                      )
                    : const Text("Contact"),
              ),
              Footer(
                footerHeight: constraints.maxHeight * 0.05,
                footerWidth: constraints.maxWidth,
              ),
            ],
          ),
        );
      }),
    );
  }
}
