import 'package:flutter/cupertino.dart';
import 'package:cart_app/res/Resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
