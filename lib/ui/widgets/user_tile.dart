import 'package:esesech/core/constants/route_path.dart';
import 'package:esesech/core/models/server_user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final ServerUser user;
  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Container(
          color: Colors.yellow,
          padding: EdgeInsets.all(10.0),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  user.username,
                  style: TextStyle(fontFamily: "Ubuntu Mono", fontSize: 22.0),
                ),
              ),
              Container(
                child: Icon(Icons.arrow_right, color: Colors.black54,),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(RoutePath.SERVER_USER_SETTINGS, arguments: this.user);
          return;
        },
      ),
    );
  }
}
