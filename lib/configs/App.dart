import 'package:flutter/material.dart';
import 'package:flutter_uis/AppLocalizations.dart';

import 'AppDimensions.dart';
import 'TextStyles.dart';
import 'CommonProps.dart';
import 'AppTheme.dart';
import 'StatusBar.dart';

class App {
  static BuildContext ctx;
  static bool isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    AppDimensions.init(context);
    AppTheme.init(context);
    TextStyles.init();
    CommonProps.init();
    App.ctx = context;
    // final route = ModalRoute.of(context).settings.name;
    // StatusBarHandler.init(context, route);
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }

  static translate(String key, [BuildContext ctx]) {
    final base = AppLocalizations.of(ctx ?? App.ctx);
    if (base == null) {
      return key;
    }
    return base.translate(key) ?? key;
  }

  static bool isDark([BuildContext context]) =>
      Theme.of(context ?? App.ctx).brightness == Brightness.dark;
}
