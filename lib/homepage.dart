/*
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_app/function.dart';
import 'package:driving_app/third_screen.dart';
import 'package:flutter/material.dart';
import 'CarInfo.dart';
import 'constants.dart';
import 'second_screen.dart';
import 'map/globals.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenWidget createState() => _HomeScreenWidget();
}

class _HomeScreenWidget extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List profile = [];
  String? selectedValue;



  getData() async {
    // weatherData = await getWeatherData();
    // gasData = await getGasData();
    // print(weatherData);
    // print("");
    // print(gasData);
    // fuel = gasData[(data["item"])]["today"];
    // print("");
    // print("---------------TEST-----------------------");
    // print(weatherData[0]["Province"]);
    // print("");
    print(gasData[0]["today"]);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    //profile = Rom.get();
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
            child: IconButton(
              icon: Icon(Icons.refresh),
              color: Color(0xFF57636C),
              onPressed: () async {
                gasData = await getGasData();
                // print(gasData);
              },
            ),
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
              builder: (context) => CalculationWidget(),
            ),
          ).then((_) => setState(() => null));
        },
        backgroundColor: Colors.blue,
        elevation: 8,
        child: Icon(Icons.add),
      ),

*/
/*      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                    child: Container(
                      // alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: fuelPrice,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x411D2429),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Text(
                              'Today Fuel Price (Bangchak)',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text("Hi Premium Diesel S B7 "),
                                      Text("Diesel S B7"),
                                      Text("HI DIESEL S "),
                                      Text("HI DIESEL B20 S "),
                                      Text("Gasohol E85 S EVO "),
                                      Text("Gasohol E20 S EVO "),
                                      Text("Gasohol 91 S EVO "),
                                      Text("Gasohol 95 S Evo "),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      isLoaded(),
                                      isLoaded1(),
                                      isLoaded2(),
                                      isLoaded3(),
                                      isLoaded4(),
                                      isLoaded5(),
                                      isLoaded6(),
                                      isLoaded7(),
                                    ],
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text("Select Profile"),
          Expanded(child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("CarModel").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }
              return ListView(
                children: snapshot.data!.docs.map((document){
                  return Container(

                    child: ListTile(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CalculationWidget(index: index),
                            //builder: (context) => MapView(),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(child: Text(document["fuel"]),),
                      ),
                      title: Text(document["name"]),
                      subtitle: Text("km/l"),
                    ),
                  );
                }).toList(),
              );
            },
          )
          ),
          Expanded(child: GestureDetector(

          ))
        ],
      ),*//*


     body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                child: Container(
                  // alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: fuelPrice,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x411D2429),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          'Today Fuel Price (Bangchak)',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text("Hi Premium Diesel S B7 "),
                                  Text("Diesel S B7"),
                                  Text("HI DIESEL S "),
                                  Text("HI DIESEL B20 S "),
                                  Text("Gasohol E85 S EVO "),
                                  Text("Gasohol E20 S EVO "),
                                  Text("Gasohol 91 S EVO "),
                                  Text("Gasohol 95 S Evo "),
                                ],
                              ),
                              Column(
                                children: [
                                  isLoaded(),
                                  isLoaded1(),
                                  isLoaded2(),
                                  isLoaded3(),
                                  isLoaded4(),
                                  isLoaded5(),
                                  isLoaded6(),
                                  isLoaded7(),
                                ],
                              ),
                            ],
                          ),
                        ],

                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                ),
              ),
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
              builder: (context) => CalculationWidget(),
              // builder: (context) => MapView(index:10),
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



  isLoaded() {
    if (gasData!= null) {
      return Text("${gasData[0]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator( strokeWidth: 2.0,),
      );
      return Text("loading");
    }
  }
  isLoaded1() {
    if (gasData != null) {
      return Text("${gasData[1]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator( strokeWidth: 2.0,),
      );
      return Text("loading");
    }
  }
  isLoaded2() {
    if (gasData != null) {
      return Text("${gasData[2]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator( strokeWidth: 2.0,),
      );
      return Text("loading");
    }
  }
  isLoaded3() {
    if (gasData != null) {
      return Text("${gasData[3]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator( strokeWidth: 2.0,),
      );
      return Text("loading");
    }
  }
  isLoaded4() {
    if (gasData != null) {
      return Text("${gasData[4]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator( strokeWidth: 2.0,),
      );
      return Text("loading");
    }
  }
  isLoaded5() {
    if (gasData != null) {
      return Text("${gasData[5]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator( strokeWidth: 2.0,),
      );
      return Text("loading");
    }
  }
  isLoaded6() {
    if (gasData != null) {
      return Text("${gasData[6]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator( strokeWidth: 2.0,),
      );
      return Text("loading");
    }
  }
  isLoaded7() {
    if (gasData != null) {
      return Text("${gasData[7]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator( strokeWidth: 2.0,),
      );
      return Text("loading");
    }
  }

}
*/

import 'dart:collection';

import 'package:driving_app/function.dart';
import 'package:driving_app/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'constants.dart';
import 'second_screen.dart';
import 'map/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenWidget createState() => _HomeScreenWidget();
}

class _HomeScreenWidget extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List profile = [];
  String? selectedValue;
  final Box = GetStorage();

  getData() async {
    // weatherData = await getWeatherData();
    // gasData = await getGasData();
    // print(weatherData);
    // print("");
    // print(gasData);
    // fuel = gasData[(data["item"])]["today"];
    // print("");
    // print("---------------TEST-----------------------");
    // print(weatherData[0]["Province"]);
    // print("");
    // print(gasData[0]["today"]);
    // print("test");
    // print(gasOld[1]["today"]);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("restart");
  }

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
            child: IconButton(
              icon: Icon(Icons.refresh),
              color: Color(0xFF57636C),
              onPressed: () async {
                gasData = await getGasData();
                // if (gasData == null) {
                //   gasData = await getGasData();
                // } else {
                //   gasOld = gasData;
                //   gasData == await getGasData();
                // }
                // print(gasData);
              },
            ),
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
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                child: Container(
                  // alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: fuelPrice,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x411D2429),
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          'Today Fuel Price (Bangchak)',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text("Hi Premium Diesel S B7 "),
                                  Text("Diesel S B7"),
                                  Text("HI DIESEL S "),
                                  Text("HI DIESEL B20 S "),
                                  Text("Gasohol E85 S EVO "),
                                  Text("Gasohol E20 S EVO "),
                                  Text("Gasohol 91 S EVO "),
                                  Text("Gasohol 95 S Evo "),
                                ],
                              ),
                              Column(
                                children: [
                                  isLoaded(),
                                  isLoaded1(),
                                  isLoaded2(),
                                  isLoaded3(),
                                  isLoaded4(),
                                  isLoaded5(),
                                  isLoaded6(),
                                  isLoaded7(),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text('Select Profile',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: kButtonColor,
                    )),
              ),
              // testLoad(),
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
              // builder: (context) => MapView(index:10),
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
                                fontSize: 16,
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

  isLoaded() {
    if (gasData != null) {
      // box.write(gasData.toString(), gasData[0]["today"]);
      // box.remove(gasData.toString());
      print(box.read(gasData.toString()));
      // return Text("${box.read(gasData.toString())}");
      return Text("${gasData[0]["today"]}");
    } else if (gasData == null && gasOld != null) {
      return Text("special case");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded1() {
    if (gasData != null) {
      return Text("${gasData[1]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded2() {
    if (gasData != null) {
      return Text("${gasData[2]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded3() {
    if (gasData != null) {
      return Text("${gasData[3]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded4() {
    if (gasData != null) {
      return Text("${gasData[4]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded5() {
    if (gasData != null) {
      return Text("${gasData[5]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded6() {
    if (gasData != null) {
      return Text("${gasData[6]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  isLoaded7() {
    if (gasData != null) {
      return Text("${gasData[7]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }

  testLoad() {
    if (gasOld != null) {
      return Text("heelo" + "${gasOld[0]["today"]}");
    } else {
      return SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      );
      return Text("loading");
    }
  }
}