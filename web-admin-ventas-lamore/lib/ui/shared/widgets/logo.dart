import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( top: 30 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon( Icons.list_alt_outlined,color: Color(0xff7A6BF5) ),
          SizedBox( width: 10 ),
          Text(
            'Administracion',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}