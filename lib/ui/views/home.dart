import 'package:esesech/core/constants/route_path.dart';
import 'package:esesech/ui/widgets/user_tile.dart';
import 'package:flutter/material.dart';

import 'base.dart';
import '../../core/viewmodels/home.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel model, Widget child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "ESESECH",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Product Sans",
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
          ),
          body: _buildUI(
            context,
            model,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.code),
            backgroundColor: Colors.yellow,
            onPressed: () {
              Navigator.pushNamed(context, RoutePath.SHELL);
            },
          ),
        );
      },
      onViewModelInit: (HomeViewModel model) => model.fetchServerUsers(),
    );
  }

  Widget _buildUI(BuildContext context, HomeViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                        child: Text(
                          "Users",
                          style: TextStyle(
                              fontSize: 32.0,
                              color: Colors.black54,
                              fontFamily: "Product Sans",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                            child: Icon(
                              Icons.add,
                              color: Colors.black54,
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(RoutePath.ADD_SERVER_USER);
                            }),
                      ),
                    ],
                  ),
                  Container(
                    height: 300.0,
                    child: model.serverUserList.length == 0
                        ? Container()
                        : ListView.builder(
                            itemCount: model.serverUserList.length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return UserTile(
                                user: model.serverUserList.elementAt(index),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Text(
                    "Groups",
                    style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.black54,
                        fontFamily: "Product Sans",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
