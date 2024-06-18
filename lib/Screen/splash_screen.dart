import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'account_type.dart';

class splash_screen extends StatefulWidget {

  splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        QuickAlert.show(
          onCancelBtnTap: () {
            Navigator.pop(context);
          },
          onConfirmBtnTap: (){
            SystemNavigator.pop();
          },
          context: context,
          type: QuickAlertType.confirm,
          text: 'Do you want to Exit?',
          titleAlignment: TextAlign.center,
          textAlignment: TextAlign.center,
          confirmBtnText: 'Yes',
          cancelBtnText: 'No',
          confirmBtnColor: Colors.green,
          backgroundColor: Colors.white,
          headerBackgroundColor: Colors.grey,
          confirmBtnTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          cancelBtnTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          barrierColor: Colors.white,
          titleColor: Colors.black,
          textColor: Colors.black,
        );
        return false;
      },
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:  InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Account_type() ));
            },
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                decoration: ShapeDecoration(
                  color: Color(0xFF46BA80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: Text('Sign to your Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w600,
                        height: 2,
                      )),
                )),
          ),
          body: Stack(
            children: [
              Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
      //       margin: EdgeInsets.only(top: size.height * 0.5),
                          height: MediaQuery.of(context).size.height * 0.55,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFF1F2D36),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Text(
                                'Let us help the community',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 4,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .8,
                                child: Text(
                                  'Second Chance Support is a compassionate initiative dedicated to providing essential assistance to homeless individuals. ',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6000000238418579),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                    height: 1,

                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*.15,)
                            ],
                          ),
                        ),
                      ),
                    ),

                  ]
              ),
              Container(

                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .1,top:MediaQuery.of(context).size.height *.1),
                width:  MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height > 600 ? MediaQuery.of(context).size.height * .5 :MediaQuery.of(context).size.height * .3 ,
                child: ClipRRect(
                  child: Image.asset('assets/img.png'),
                ),
              ),
            ],
          ),

      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(0, size.height);

    path.lineTo(0, size.height * 0.24);
//    path.lineTo(size.width, size.height);
//    path.lineTo(size.width, size.height * 0.5);

    path.quadraticBezierTo(size.width / 2, -10, size.width, size.height * 0.24);

    path.lineTo(size.width, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
