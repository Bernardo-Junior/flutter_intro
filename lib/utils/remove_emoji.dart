// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/services.dart';

final emojiFormatter = FilteringTextInputFormatter.deny(
  RegExp(
    '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
  ),
);
