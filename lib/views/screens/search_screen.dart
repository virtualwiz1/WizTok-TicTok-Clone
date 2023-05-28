import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiztok/constants.dart';
import 'package:wiztok/controllers/search_controller.dart';
import 'package:wiztok/views/screens/profile_screen.dart';

import '../../models/user.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchUserController searchController = Get.put(SearchUserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: buttonColor,
            title: TextFormField(
              decoration: const InputDecoration(
                filled: false,
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onFieldSubmitted: (value) => searchController.searchUser(value),
            ),
          ),
          body: searchController.searchedUsers.isEmpty
              ? const Center(
                  child: Text(
                    'Search for users!',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: searchController.searchedUsers.length,
                  itemBuilder: (context, index) {
                    User user = searchController.searchedUsers[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid),
                      ),
                    ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.profilePic,
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      }
    );
  }
}
