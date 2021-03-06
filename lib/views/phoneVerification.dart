import 'package:flutter/material.dart';
import 'package:mobeebanq/components/appBar.dart';
import 'package:mobeebanq/components/painterContainer.dart';
import 'package:mobeebanq/constants.dart';
import 'package:mobeebanq/views/test.dart';

import 'OTP.dart';

class phoneVerification extends StatefulWidget {
  @override
  _phoneVerificationState createState() => _phoneVerificationState();
}

class _phoneVerificationState extends State<phoneVerification> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: basicColor,
      appBar: CustomAppBar("OTP Verification"),

      body: Stack(
        children: [

          _header(),
          _whitebackgroud(),
          _form(),







          // Positioned.fill(
          //   bottom: 90,
          //   // right: 150,
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //       width: 60.0,
          //       height: 60.0,
          //       // decoration: new BoxDecoration(
          //       //   color: basicColor,
          //       //   borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          //       //   border: new Border.all(
          //       //     color: Colors.white.withOpacity(0.9),
          //       //     width: 5.0,
          //       //   ),
          //       // ),
          //       child: RaisedButton(
          //         onPressed: (){
          //           Navigator.of(context).push(
          //               MaterialPageRoute(builder: (Context) => otpScreen()));
          //         },
          //           color: basicColor,
          //           elevation: 0,
          //           focusColor: basicColor,
          //           disabledColor: basicColor,
          //           shape: RoundedRectangleBorder(
          //
          //             borderRadius: BorderRadius.circular(50.0),
          //             side: BorderSide(color: Colors.white.withOpacity(0.9), width: 5),
          //           ),
          //           child: Icon(Icons.arrow_forward,color: Colors.white,)),
          //     ),
          //   ),
          // ),


          Align(
            alignment: FractionalOffset.bottomCenter,
            child: new Image(
              image: AssetImage("images/bottom.png"),
              width:  MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height/6,
            ),
          ),


        ],
      ),

    );
  }

  Widget _header() {
    return  Positioned(
      top: 20,
      child: Image(
        image: AssetImage("images/smsVerification.png"),
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/5,
      ),
    );
  }

  Widget _whitebackgroud() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            )
        ),
      ),
    );
  }

  Widget _form() {
    return Positioned(
      top: MediaQuery.of(context).size.height/3.5,
      right: 15,
      child: Center(
        child: AdvanceCustomAlert(
        ),
      ),
    );
  }

}
