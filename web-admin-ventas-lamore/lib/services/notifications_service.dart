import 'package:flutter/material.dart';



class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();


  static showSnackbarError( String message ) {

    final snackBar = new SnackBar(
      backgroundColor: Color(0xff050A40),
      content: Text( message, style: TextStyle( color: Colors.white, fontSize: 20 ) )
    );

    messengerKey.currentState!.showSnackBar(snackBar);

  }

   static showSnackbar( String message ) {

    final snackBar = new SnackBar(
      backgroundColor: Color(0xff050A40),
      content: Text( message, style: TextStyle( color: Colors.white, fontSize: 20 ) )
    );

    messengerKey.currentState!.showSnackBar(snackBar);

  }

}