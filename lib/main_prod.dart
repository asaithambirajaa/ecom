import 'flovers.dart';
import 'main_common.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.PROD,
    env: "PROD",
    name: "PROD Flutter",
    values: FlavorValues(
        bundleID: 'com.myapp.app',
        appID: 'com.myapp.app',
        baseUrl: '',
        sentryUrl: '',
        dynamicLinkUrl: ''),
  );

  mainCommon();
}
