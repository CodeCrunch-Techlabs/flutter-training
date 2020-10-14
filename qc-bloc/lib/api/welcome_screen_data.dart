import 'package:flutter/material.dart';

class LandingScreenItem {
  final String title;
  final String subTitle;
  final String image;
  final Color color;

  const LandingScreenItem({this.title, this.subTitle, this.image, this.color});
}

class LandingScreenItems {
  static List<LandingScreenItem> loadLandingScreenItem() {
    const data = <LandingScreenItem>[
      LandingScreenItem(
        title: "Welcome",
        subTitle:
            "Participate in and create anonymous, secure observational studies using Quantifis Citizen.",
        image: "images/qc1.png",
        color: Colors.white,
      ),
      LandingScreenItem(
        title: "Find out more about yourself (while Contributing to science)",
        subTitle:
            "What are ou interested in learning more about? Join an array if studies, related to health and well being.",
        image: "images/qc2.png",
        color: Colors.white,
      ),
      LandingScreenItem(
        title: "Validate research methods",
        subTitle:
            "We use study methods traditionally used in in-person clinical setting and bring it to the comfort of your home.",
        image: "images/qc4.png",
        color: Colors.white,
      ),
      LandingScreenItem(
        title: "Anonymity and privacy",
        subTitle:
            "Your privacy is very important to us. Participations in our studies is anonymous. which means we don't collect your email and personally identifiable information.",
        image: "images/qc3.png",
        color: Colors.white,
      ),
    ];
    return data;
  }
}
