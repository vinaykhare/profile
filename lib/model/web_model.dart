import 'package:flutter/material.dart';
import 'package:vinaykhare/utils/constants.dart';

class WebModel with ChangeNotifier {
  final BuildContext context;

  bool loaded = false;

  WebModel(this.context) {
    if (!loaded) {
      // await Future.delayed(const Duration(seconds: 5), () {});
    }
    loaded = true;
    notifyListeners();
  }

  Future<void> initialize() async {
    if (!loaded) {
      // await Future.delayed(const Duration(seconds: 5), () {});
    }
    loaded = true;
    notifyListeners();
  }

  getWebAppLogo(BuildContext context, double height, double width) {
    // double appWidth = MediaQuery.of(context).size.width;

    return Image(
      height: height,
      image: AssetImage(
        assetMap['appvinaykhareLogo']!,
      ),
      fit: BoxFit.fill,
      // height: 75,
    );
  }

  getWebAppTitle(BuildContext context, double height, double width) {
    // double appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Vinay ",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.amber,
                    ),
              ),
              Text(
                "Kumar ",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.green,
                    ),
              ),
              Text(
                "Khare",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.red,
                    ),
              ),
            ],
          ),
          Text(
            "Telecom OSS Business Analyst",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
