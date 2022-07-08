import 'package:driving_app/function.dart';
import 'package:driving_app/third_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenWidget createState() => _HomeScreenWidget();
}

class _HomeScreenWidget extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List profile = [];
  @override
  @override
  Widget build(BuildContext context) {
    profile = Rom.get();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: kWhite,
        automaticallyImplyLeading: false,
        title: Text('Ultimate Driving App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: kExtra3Color,
            )),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: Icon(Icons.directions_car_filled, color: Color(0xFF57636C)),
            // child: FlutterFlowIconButton(
            //   borderColor: Colors.transparent,
            //   borderRadius: 30,
            //   borderWidth: 1,
            //   buttonSize: 44,
            //   icon: Icon(
            //     Icons.pending,
            //     color: FlutterFlowTheme.of(context).secondaryText,
            //     size: 24,
            //   ),
            //   onPressed: () {
            //     print('IconButton pressed ...');
            //   },
            // ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: kWhite,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(),
            ),
          ).then((_) => setState(() => null));
        },
        backgroundColor: Colors.blue,
        elevation: 8,
        child: Icon(Icons.add),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text('Select Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: kButtonColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: profile.length,
                  itemBuilder: (context, index) {
                    final item = profile[index];
                    return Dismissible(
                      key: Key(item["name"]),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        color: Colors.red,
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        profile.removeAt(index);
                        Rom.set(profile);
                      },
                      child: items(
                        name: profile[index]["name"],
                        fuel: profile[index]["fuel"],
                        index: index,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget items(
      {required String name, required String fuel, required int index}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CalculationWidget(index: index),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBox,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x411D2429),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: kExtra3Color,
                            )),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 8, 0),
                          child: Text(fuel,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: kButtonColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF57636C),
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 4, 8),
                      child: Text('KM/l',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kExtra3Color,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
