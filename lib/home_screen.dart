import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'get_users_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      // CRUD
      // C - Create (post)
      // R - Read (fecth/get)
      // U - Update
      // D - Delete
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  registerUser();
                },
                child: Text("Register User")),
            ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => GetUsersList()));
                },
                child: Text("Get Users")),
            ElevatedButton(
                onPressed: () async {
                  updateUser();
                },
                child: Text("Update")),
            ElevatedButton(
                onPressed: () async {
                  deleteUser();
                },
                child: Text("Delete"))
          ],
        ),
      ),
    );
  }

  registerUser() async {
    String post_api = "https://reqres.in/api/users";

    Map map = {"name": "morpheus", "job": "leader"};

    http.Response response = await http.post(Uri.parse(post_api), body: map);

    if (response.body != null) {
      if (response.statusCode == 201) {
        // insert
      } else {
        // failed
      }
      print("response " + response.statusCode.toString());
    } else {
      print("something went wrong");
    }
  }

  updateUser() async {
    String post_api = "https://reqres.in/api/users";

    Map<String, String> map = {"name": "morpheus", "job": "developer"};

    http.Response response = await http.put(Uri.parse(post_api), headers: map);

    if (response.body != null) {
      if (response.statusCode == 201) {
        // insert
      } else {
        // failed
      }
      print("response " + response.statusCode.toString());
    } else {
      print("something went wrong");
    }
  }

  deleteUser() async {
    String post_api = "https://reqres.in/api/users";

    Map<String, String> map = {"name": "morpheus"};

    http.Response response =
        await http.delete(Uri.parse(post_api), headers: map);

    if (response.body != null) {
      if (response.statusCode == 201) {
        // insert
      } else {
        // failed
      }
      print("response " + response.statusCode.toString());
    } else {
      print("something went wrong");
    }
  }
}
