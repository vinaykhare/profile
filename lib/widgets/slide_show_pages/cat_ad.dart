import 'package:flutter/material.dart';
import 'package:vinaykhare/utils/constants.dart';

class CatAd extends StatelessWidget {
  const CatAd({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                assetMap["appBarBackground"]!,
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "A PROFESSIONALLY COMPETENT, CAPABLE, HIGHLY MOTIVATED AND RIGOROUSLY TRAINEDTELECOM PROFESSIONAL WITH EXCELLENT SOFTWARE DEVELOPMENT SKILLS AND EXPERIENCEOF 13 YEARS IN TELECOM OSS/BSS DOMAIN.Worked for Telecom Operators across the Globe including South Korea, Jamaica, Trinidad &Tobago, Belgium, Italy, Chile and Peru for integrating Telecom Order and Catalog ManagementSolutions, that gave me ability to interact with client to solve the problems proactively, and anextensive cross functional experience in Telecom domain.",
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
