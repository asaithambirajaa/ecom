import 'data/remote/network/app_config.dart';
import 'flovers.dart';
import 'main_common.dart';

void main() async {
  
  FlavorConfig(
    flavor: Flavor.DEV,
    env: "DEV",
    name: "DEV Flutter",
    values: FlavorValues(
      bundleID: 'com.myapp.app.dev',
      appID: 'com.myapp.app.dev',
      baseUrl: 'https://uatq2s.shriramvalue.me/',
      sentryUrl: '',
      dynamicLinkUrl: '',
    ),
  );

  mainCommon();
}
