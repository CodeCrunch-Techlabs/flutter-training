import 'package:flutter/material.dart';


class DataModel {
  final String title;
  final String description;
  final String image;
  final Color buttonColor;

  DataModel({
    this.title,
    this.description,
    this.image,
    this.buttonColor,
  });
}

class WelcomeScreenData {
  List<DataModel> data = [
    DataModel(
      title: "Welcome!",
      description:
          "Participate in and create anonymous, secure observational studies using Quantified Citizen ",
      image: 'images/QC_app_Welcome1.png',
      buttonColor: Colors.green,
    ),
    DataModel(
      title: "Find out more about yourself (while contributing to science)",
      description:
      "What are you interested in learning more about? Join an array of studies, related to health and wellbeing.",
      image: 'images/QC_app_Welcome4.png',
      buttonColor: Colors.white,
    ),
    DataModel(
      title: "Validated research methods",
      description:
      "We use study methods traditionally used in in-person clinical setting and bring it to the comfort of your home.",
      image: 'images/QC_app_Welcome3.png',
      buttonColor: Colors.white,
    ),
    DataModel(
      title: "Anonymity and privacy",
      description:
          "Your privacy is very important to us. Participations in our studies is anonymous. which means we don't collect your email and personally identifiable information",
      image: 'images/QC_app_Welcome2.png',
      buttonColor: Colors.green,
    ),
  ];
}
