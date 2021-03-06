import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "all_animals.dart";
import 'constants.dart';

// The home page of the application
class Home extends StatelessWidget {
  Home(this.firstCamera, this.animals, this.prefs);

  final CameraDescription firstCamera;
  final animals;
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg.jpg"),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 120.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Animal Snap",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.camera_enhance,
                    size: 120,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Hero(
              tag: "bottom",
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: InkWell(
                  onTap: () {
                    // Open all animals page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AllAnimals(animals, firstCamera, prefs)),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chevron_right,
                          size: 125,
                          color: kMainColor,
                        )
                      ],
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
