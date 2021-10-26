import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MethodUtils {

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static void showSnackBar(BuildContext ctx, msgToDisplay) {
    print(msgToDisplay);

    var snackBar = SnackBar(
      content: Text(msgToDisplay),
    );

    Scaffold.of(ctx).showSnackBar(snackBar);
  }

  static void showSnackBarGK(
      GlobalKey<ScaffoldState> globalScaffoldKey, msgToDisplay) {
    print(msgToDisplay);

    var snackBar = SnackBar(content:Text(msgToDisplay));

    globalScaffoldKey.currentState!.showSnackBar(snackBar);
  }

  static String getGreetingText() {
    String wText = "";
    DateTime c = DateTime.now();
    int timeOfDay = c.hour;

    if (timeOfDay >= 0 && timeOfDay < 12) {
      wText = "Good Morning";
    } else if (timeOfDay >= 12 && timeOfDay < 16) {
      wText = "Good Afternoon";
    } else if (timeOfDay >= 16 && timeOfDay < 21) {
      wText = "Good Evening";
    } else if (timeOfDay >= 21 && timeOfDay < 24) {
      wText = "Good Night";
    }
    return wText;
  }


  static void showConfirmDialog(BuildContext context, String mTitle,
      String mContent, Function callback(bool)) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(mTitle),
          content: new Text(mContent),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
                callback(false);
              },
            ),
            FlatButton(
              child: new Text("YES"),
              onPressed: () {
                Navigator.of(context).pop();
                callback(true);
              },
            ),
          ],
        );
      },
    );
  }

  static void showAlertDialogCupertino(
      BuildContext context, String mTitle, String mContent, Function callback) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) => new CupertinoAlertDialog(
        title: new Text(mTitle),
        content: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            mContent,
          ),
        ),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(ctx);
                callback();
                // Navigator.pop(context);
              },
              isDefaultAction: true,
              child: new Text("OK"))
        ],
      ),
    );
  }

  static void showAlertDialogWithParameter(
      BuildContext context, String mTitle, var mVarData, Function callback) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(mTitle),
          content: new Text("subtitle"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                callback(context, mVarData);
              },
            ),
          ],
        );
      },
    );
  }


  static Future<bool> isInternetPresentOld() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //  print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      //print('not connected');
      return false;
    }
  }

  static Future<bool> isInternetPresent() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        print("Connected to Mobile Network");

        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        print("Connected to WiFi");
        return true;
      } else {
        print("Unable to connect. Please Check Internet Connection");
        return false;
      }
    } on SocketException catch (_) {
      //print('not connected');
      return false;
    }
  }
}
