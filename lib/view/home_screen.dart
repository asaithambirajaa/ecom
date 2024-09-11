import 'dart:convert';

import 'package:cart_app/res/app_url.dart';
import 'package:cart_app/view/widget/components.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../data/remote/response/Status.dart';

import '../utils/routes/routes_name.dart';
import '../view_model/home_view_model.dart';
import '../view_model/user_view_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  

  @override
  void initState() {
    homeViewViewModel.fetchBannerListApi();
    // getList().then((value) {
    //   print(value);
    // });

    super.initState();
  }

  Future<Map<String, dynamic>> getList() async {
    Map requestData = {
      "Action": "Check",
      "LoginId": "bZP2bqfphqgt/Vx9u3rTqA=="
    };
    try {
      var url = Uri.parse(AppUrl.bannerListEndPoint);
      var response = await http.post(
        url,
        body: requestData,
      );
      var dict = jsonDecode(response.body);
      return dict;
    } catch (e) {
      return e as Map<String, dynamic>;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPrefernece.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(child: Text('Logout'))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch (value.bannerList.status) {
            case Status.LOADING:
              return const Loading();
            case Status.ERROR:
              return Center(child: Text(value.bannerList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.bannerList.data!.result!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        value.bannerList.data!.result![index].toString(),
                        errorBuilder: (context, error, stack) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                          );
                        },
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      // title: Text(value.moviesList.data!.movies![index].title
                      //     .toString()),
                      // subtitle: Text(value
                      //     .moviesList.data!.movies![index].year
                      //     .toString()),
                      // trailing: Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Text(Utils.averageRating(value
                      //             .moviesList.data!.movies![index].ratings!)
                      //         .toStringAsFixed(1)),
                      //     Icon(
                      //       Icons.star,
                      //       color: Colors.yellow,
                      //     )
                      //   ],
                      // ),
                    ),
                  );
                },
              );
            default:
              return Container();
          }
          // return Container();
        }),
      ),
    );
  }
}
