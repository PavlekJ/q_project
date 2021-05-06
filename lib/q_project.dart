import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'router.dart' as router;

import 'constants/app_theme.dart';

class QProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Posts",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: router.routes,
    );
  }
}
