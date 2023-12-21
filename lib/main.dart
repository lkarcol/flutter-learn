import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/app.dart';


void main() {
  runApp(
    // To install Riverpod, we need to add this widget above everything else.
    // This should not be inside "MyApp" but as direct parameter to "runApp".
    const ProviderScope(
      child: MyApp(),
    ),
  );
}