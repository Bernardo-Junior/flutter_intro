// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';

class IntroModel {
  final Intro intro;
  final List<Widget> introBuilder;
  final int order;
  final String group;

  IntroModel({
    required this.intro,
    required this.introBuilder,
    required this.order,
    this.group = 'default',
  });
}
