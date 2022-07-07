// import 'package:flutter/material.dart';
//
// class SecondScreen extends StatelessWidget {
//   const SecondScreen({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text( 'Test'),
//         actions: [
//           IconButton(onPressed: () async {
//             Navigator.pop(context);
//           },
//               icon: Icon(Icons.start),)
//         ],
//       ),
//     );
//   }
// }

// import '../flutter_flow/flutter_flow_drop_down.dart';
// import '../flutter_flow/flutter_flow_icon_button.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../flutter_flow/flutter_flow_widgets.dart';
// import '../profile/profile_widget.dart';
import 'package:driving_app/constants.dart';
import 'package:driving_app/homepage.dart';
/*import 'package:constants.dart';
import 'package:homepage.dart';*/
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenWidgetState createState() => _SecondScreenWidgetState();
}

class _SecondScreenWidgetState extends State<SecondScreen> {
  String dropDownValue = 'e20';
  // TextEditingController emailAddressController1;
  // TextEditingController emailAddressController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var items = ['e20', 'Gasohol 95', 'Gasohol 91', 'e85', 'Diesel'];

  @override
  void initState() {
    super.initState();
    // emailAddressController1 = TextEditingController();
    // emailAddressController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: kWhite,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          iconSize: 26,
                          color: kExtra3Color,
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: kExtra3Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: kExtra3Color,
                    ),
                  ),
                ),
              ]),
          elevation: 0,
        ),
      ),
      backgroundColor: kWhite,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Text(
                      'Create your account by filling in the information below to access the app.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kButtonColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: kBox,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D101213),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                  // controller: emailAddressController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Car model',
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kButtonColor,
                    ),
                    hintText: 'Enter your Car model...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: kButtonColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: kBox,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: kButtonColor,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: kBox,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D101213),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                // controller: emailAddressController2,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Fuel Economy',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kButtonColor,
                  ),
                  hintText: 'Enter your Fuel Economy...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: kButtonColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: kBox,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                ),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: kButtonColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: kBox,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D101213),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 355,
                    height: 60,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10)
                          ),
                          borderSide: BorderSide(width: 0.1),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: kExtra3Color),
                        hintText: "Select your Fuel",
                        fillColor: kBox,
                      ),
                      value: dropDownValue,
                      icon: Icon(
                        Icons.local_gas_station,
                        size: 15,
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: kButtonColor),
                          ),

                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                      // width: 180,
                      // height: 50,
                      // textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      //       fontFamily: 'Poppins',
                      //       color: Colors.black,
                      //     ),
                      // hintText: 'Please select Fuel...',
                      //
                      // fillColor: Colors.white,
                      // elevation: 2,
                      // borderColor: Colors.transparent,
                      // borderWidth: 0,
                      // borderRadius: 0,
                      // margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      // hidesUnderline: true,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Padding(
          //   padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          //   child: TextButton(
          //     style: TextButton.styleFrom(
          //       padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          //       primary: Colors.black,
          //       textStyle: const TextStyle(fontSize: 20),
          //     ),
          //     onPressed: () async {
          //       await Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => HomeScreen(),
          //         ),
          //       );
          //     },
          //     child: const Text('Create Account'),
          //   ),
          // ),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('Create Account'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
