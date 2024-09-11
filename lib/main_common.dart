import 'package:cart_app/utils/routes/routes.dart';
import 'package:cart_app/utils/routes/routes_name.dart';
import 'package:cart_app/view_model/auth_view_model.dart';
import 'package:cart_app/view_model/user_view_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'flover_banner.dart';
import 'flovers.dart';

void mainCommon() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
        return snapshot.data == ConnectivityResult.mobile ||
                snapshot.data == ConnectivityResult.wifi
            ? MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => AuthViewModel()),
                  ChangeNotifierProvider(create: (_) => UserViewModel())
                ],
                child: MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  initialRoute: RoutesName.splash,
                  onGenerateRoute: Routes.generateRoute,
                ),
              )
            : /*MaterialApp(
                // Offline mode
                title: FlavorConfig.instance!.name,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: MyHomePage(
                  title: FlavorConfig.instance!.name,
                ),
              );*/
            MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => AuthViewModel()),
                  ChangeNotifierProvider(create: (_) => UserViewModel())
                ],
                child: MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  initialRoute: RoutesName.splash,
                  onGenerateRoute: Routes.generateRoute,
                ),
              );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late final TextEditingController _controller;
  TextEditingController _controller = TextEditingController();
  String topic = '';
  callBackFunction(childTopic) {
    setState(() {
      topic = childTopic;
    });
  }

  @override
  void initState() {
    _controller = TextEditingController();

    super.initState();
  }

  String appName = "";
  String packageName = "";
  String version = "";
  String buildNumber = "";

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Text("App Name: $appName"),
              Text("packageName: $packageName"),
              Text("version: $version"),
              Text("buildNumber: $buildNumber"),
              SampleCallBack(
                callBackFunction: callBackFunction,
                topic: 'topic',
              ),
              ElevatedButton(
                  child: const Text('Show bottom sheet'), onPressed: () {}),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class SampleCallBack extends StatelessWidget {
  final String topic;
  final Function callBackFunction;

  const SampleCallBack(
      {Key? key, required this.callBackFunction, required this.topic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text(topic),
        onPressed: () => callBackFunction(topic),
      ),
    );
  }
}
