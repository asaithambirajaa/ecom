import 'package:flutter/material.dart';
import 'flovers.dart';

@immutable
// ignore: must_be_immutable
class FlavorBanner extends StatelessWidget {
  final Widget child;
  late BannerConfig bannerConfig;
  FlavorBanner({super.key, required this.child});
  
  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;
    bannerConfig = _getDefaultBanner();
    return Stack(
      children: <Widget>[child, _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    print(FlavorConfig.isDevelopment());
    return BannerConfig(
      bannerName: FlavorConfig.instance!.env.toString(),
      bannerColor:
          FlavorConfig.isDevelopment() ? Colors.green : Color(0xffFFDE00),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: bannerConfig.bannerName,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig.bannerColor),
      ),
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;
  BannerConfig({required this.bannerName, required this.bannerColor});
}
