import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_model.dart';
import 'package:http/http.dart' as http;

class GetUsersList extends StatefulWidget {
  @override
  State<GetUsersList> createState() => _GetUsersListState();
}

class _GetUsersListState extends State<GetUsersList> {
  Future<http.Response> getData() async {
    http.Response response =
        await http.get(Uri.parse("https://reqres.in/api/users/"));
    // 200
    // 201 for successfully insert
    // print("response >> " + response.statusCode.toString());
    // print("response >> " + response.body.toString());
    return response;
  }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Users"),
      ),
      body: FutureBuilder<http.Response>(
          future: getData(),
          builder: ((context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              Map map = jsonDecode(snapshot.data!.body.toString());
              print("snapshot.data " + map['data'].toString());

              List<UserModel> usersModelList = (map["data"] as List)
                  .map((e) => UserModel.fromJson(e))
                  .toList();

              // without model
              // return ListView.builder(
              //     itemCount: map["data"].length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         leading: Text(map["data"][index]["id"].toString()),
              //         title: Text(map["data"][index]["email"].toString()),
              //       );
              //     });
              // with model
              return ListView.builder(
                  itemCount: usersModelList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(usersModelList[index].id.toString()),
                      title: Text(usersModelList[index].email.toString()),
                    );
                  });
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Center(child: CircularProgressIndicator());
          })),
    );
  }
}
