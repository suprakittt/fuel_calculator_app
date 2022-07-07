/*import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../profile/profile_widget.dart';*/
import 'package:driving_app/homepage.dart';
import 'package:driving_app/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:driving_app/third_screen.dart';
//import 'package:google_fonts/google_fonts.dart';

class CalculateWidget extends StatefulWidget {
  const CalculateWidget({Key? key}) : super(key: key);

  @override
  _CalculateWidgetState createState() => _CalculateWidgetState();
}

class _CalculateWidgetState extends State<CalculateWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '10,555',

                    ),
                  ],
                ),
              ),
              Text(
                'THB',
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Good luck!',
                ),
              ),
              Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Container(
                height: 200,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.02, -0.21),
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                        color: Colors.blue,
                        child: Text('Go Home!'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
