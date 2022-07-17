import 'package:driving_app/function.dart';
import 'package:driving_app/map/globals.dart';
import 'package:flutter/material.dart';
import 'fouth_screen.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalculationWidget extends StatefulWidget {

  final int index;
  CalculationWidget({required this.index});
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  _CalculationWidgetState createState() => _CalculationWidgetState();
}

/*void loadAsset() async {
  String loadedString = await rootBundle.loadString('proviences.txt');
  List<String> items = loadedString.split('\n');
}*/

class _CalculationWidgetState extends State<CalculationWidget>
    with TickerProviderStateMixin {
  late String dropDownValue;
  // TextEditingController textController = TextEditingController();
  double rain = 0.00;
  var rainPercent;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  final List<String> items = <String>[
    "นครราชสีมา",
    "เชียงใหม่",
    "กาญจนบุรี",
    "ตาก",
    "อุบลราชธานี",
    "สุราษฎร์ธานี",
    "ชัยภูมิ",
    "แม่ฮ่องสอน",
    "เพชรบูรณ์",
    "ลำปาง",
    "อุดรธานี",
    "เชียงราย",
    "น่าน",
    "เลย",
    "ขอนแก่น",
    "พิษณุโลก",
    "บุรีรัมย์",
    "นครศรีธรรมราช",
    "สกลนคร",
    "นครสวรรค์",
    "ศรีสะเกษ",
    "กำแพงเพชร",
    "ร้อยเอ็ด",
    "สุรินทร์",
    "อุตรดิตถ์",
    "สงขลา",
    "สระแก้ว",
    "กาฬสินธุ์",
    "อุทัยธานี",
    "สุโขทัย",
    "แพร่",
    "ประจวบคีรีขันธ์",
    "จันทบุรี",
    "พะเยา",
    "เพชรบุรี",
    "ลพบุรี",
    "ชุมพร",
    "นครพนม",
    "สุพรรณบุรี",
    "ฉะเชิงเทรา",
    "มหาสารคาม",
    "ราชบุรี",
    "ตรัง",
    "ปราจีนบุรี",
    "กระบี่",
    "พิจิตร",
    "ยะลา",
    "ลำพูน",
    "นราธิวาส",
    "ชลบุรี",
    "มุกดาหาร",
    "บึงกาฬ",
    "พังงา",
    "ยโสธร",
    "หนองบัวลำภู",
    "สระบุรี",
    "ระยอง",
    "พัทลุง",
    "ระนอง",
    "อำนาจเจริญ",
    "หนองคาย",
    "ตราด",
    "พระนครศรีอยุธยา",
    "สตูล",
    "ชัยนาท",
    "นครปฐม",
    "นครนายก",
    "ปัตตานี",
    "กรุงเทพมหานคร",
    "ปทุมธานี",
    "สมุทรปราการ",
    "อ่างทอง",
    "สมุทรสาคร",
    "สิงห์บุรี",
    "นนทบุรี",
    "ภูเก็ต",
    "สมุทรสงคราม"
  ];
  String? selectedValue;
  // String fuel = " ";
  var data = {};
  // List weatherData = []; //ข้อมูล อากาศ
  // var gasData; //ข้อมูล น้ำมัน

  getData() async {
    data = Rom.get()[widget.index];
    // weatherData = await getWeatherData();
    // gasData = await getGasData();
    print(weatherData);
    print("");
    print(gasData);
    // fuel = gasData[(data["item"])]["today"];
    print("");
    print("---------------TEST-----------------------");
    print(weatherData[0]["Province"]);
    print("");
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
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        // key: _formKey,
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
              ]),
          elevation: 0,
        ),
      ),
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
              ),
            ),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                      child: Text(
                        'Weather (3 hours)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(5),
                      child: Wrap(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        spacing: -2,
                        children: [
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            color: kBrightCardColor,
                            child: SizedBox(
                              width: 90,
                              height: 100,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Column(
                                  children: [
                                    weatherLogo(2),
                                    Flexible(child: new Text("${weatherData[2]["Province"]}"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            color: kBrightCardColor,
                            child: SizedBox(
                              width: 90,
                              height: 100,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Column(
                                  children: [
                                    weatherLogo(8),
                                    Flexible(child: new Text("${weatherData[8]["Province"]}"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            color: kBrightCardColor,
                            child: SizedBox(
                              width: 90,
                              height: 100,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Column(
                                  children: [
                                    weatherLogo(1),
                                    // Text("กรุงเทพฯ"),
                                    Flexible(child: new Text("${weatherData[1]["Province"]}"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            color: kBrightCardColor,
                            child: SizedBox(
                              width: 90,
                              height: 100,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Column(
                                  children: [
                                    weatherLogo(7),
                                    Flexible(child: new Text("${weatherData[7]["Province"]}"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            color: kBrightCardColor,
                            child: SizedBox(
                              width: 90,
                              height: 100,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Column(
                                  children: [
                                    weatherLogo(54),
                                    // Text("อยุธยา"),
                                    Flexible(child: new Text("${weatherData[54]["Province"]}"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            color: kBrightCardColor,
                            child: SizedBox(
                              width: 90,
                              height: 100,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                child: Column(
                                  children: [
                                    weatherLogo(66),
                                    Flexible(child: new Text("${weatherData[66]["Province"]}"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Column(
                          //   children: [
                          //     weatherLogo(8),
                          //     Text("${weatherData[8]["Province"]}"),
                          // Text("${weatherData[8]["Province"]} "+"Rainfall = "+"${weatherData[8]["Observation"]["Rainfall"]}"),
                          // Text("${weatherData[61]["Province"]} "+"Rainfall = "+"${weatherData[61]["Observation"]["Rainfall"]}"),
                          // Text("${weatherData[56]["Province"]} "+"Rainfall = "+"${weatherData[56]["Observation"]["Rainfall"]}"),
                          // Text("${weatherData[80]["Province"]} "+"Rainfall = "+"${weatherData[80]["Observation"]["Rainfall"]}"),
                          // Text("${weatherData[79]["Province"]} "+"Rainfall = "+"${weatherData[79]["Observation"]["Rainfall"]}"),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(130, 4, 24, 25),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${data["name"]}',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Image.network(
              'https://www.topgear.com/sites/default/files/cars-car/image/2019/01/tom_5734.jpg',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Align(
            //       child: DropdownButtonHideUnderline(
            //         child: DropdownButton(
            //           hint: Text(
            //             'Select Destination Province',
            //             style: TextStyle(
            //               fontSize: 20,
            //               color: Theme.of(context).hintColor,
            //             ),
            //           ),
            //           items: items
            //               .map((item) => DropdownMenuItem<String>(
            //                   value: item,
            //                   child: Center(
            //                     child: Text(item),
            //                   )))
            //               .toList(),
            //           value: selectedValue,
            //           onChanged: (value) {
            //             setState(() {
            //               bool set = true;
            //               selectedValue = value as String;
            //               weatherData.forEach((e) {
            //                 if (e["Province"] == selectedValue && set) {
            //                   print(e["Observation"]["Rainfall"]);
            //                   rain = double.parse(e["Observation"]["Rainfall"]);
            //                   set = false;
            //                 }
            //               });
            //             });
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'The Distance for this trip is:',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
            //   child: TextFormField(
            //     controller: textController,
            //     autofocus: true,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       hintText: 'Type range in kilometer..',
            //       enabledBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Color(0x00000000),
            //           width: 1,
            //         ),
            //         borderRadius: const BorderRadius.only(
            //           topLeft: Radius.circular(4.0),
            //           topRight: Radius.circular(4.0),
            //         ),
            //       ),
            //       focusedBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Color(0x00000000),
            //           width: 1,
            //         ),
            //         borderRadius: const BorderRadius.only(
            //           topLeft: Radius.circular(4.0),
            //           topRight: Radius.circular(4.0),
            //         ),
            //       ),
            //     ),
            //     keyboardType: TextInputType.number,
            //   ),
            // ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                "${distance}",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(3, 0, 10, 10),
                        child: Text(
                          'Your Fuel Consumption:',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        '${data["fuel"]}',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
                        child: Text(
                          'Fuel Price:',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        child: Text(
                          gasData[(data["item"])]["today"],
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Container(
                height: 130,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.02, -0.21),
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
                              onPressed: () {
                                double money = 0.00;
                                double range =
                                    double.parse(distance);
                                double km_L = double.parse("${data["fuel"]}");
                                double price = double.parse(gasData[(data["item"])]["today"]);
                                money = (range / km_L) * price;
                                if (rain < 0.5) {
                                  money = money + ((money * 5) / 100);
                                } else if (rain < 4) {
                                  money = money + ((money * 8) / 100);
                                } else if (rain < 8) {
                                  money = money + ((money * 12) / 100);
                                } else {
                                  money = money + ((money * 15) / 100);
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CalculateWidget(
                                      totol: money,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('calculate'),
                            ),
                          ],
                        ),
                      ),

/*                      child: RaisedButton(
                          onPressed: () {
                            double money = 0.00;
                            double range = double.parse(textController.text);
                            double km_L = double.parse("${data["fuel"]}");
                            double price = double.parse(fuel);
                            money = (range / km_L) * price;
                            if (rain < 0.5) {
                              money = money + ((money * 5) / 100);
                            } else if (rain < 4) {
                              money = money + ((money * 8) / 100);
                            } else if (rain < 8) {
                              money = money + ((money * 12) / 100);
                            } else {
                              money = money + ((money * 15) / 100);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CalculateWidget(
                                  totol: money,
                                ),
                              ),
                            );
                          },
                          color: Colors.blue,
                          child: Text('Calculate')),*/
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  weatherLogo(int data) {
    rainPercent = double.parse(weatherData[data]["Observation"]["Rainfall"]);
    print("$rainPercent" + " this ");
    if (rainPercent == 0) {
      // return Text("$rainPercent");
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Haze_Heat_Sun_Low_Visibility_Apple_Flat_iOS_Weather-512.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else if (rainPercent > 0 && rainPercent <= 0.5) {
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Scattered_Showers_Rain_Showers_Raindrops_Apple_iOS_Flat_Weather-512.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else if (rainPercent > 0.5 && rainPercent <= 4) {
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Drizzle_Rain_Raindrops_Apple_iOS_Flat_Weather-128.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else if (rainPercent > 4 && rainPercent <= 8) {
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-1/50/Heavy_rain_Rain_Raindrops_Apple_iOS_Flat_Weather-128.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
      //
    } else {
      return SizedBox(
        width: 60,
        height: 60,
        child: Image.network(
          'https://cdn3.iconfinder.com/data/icons/weather-ios-11-black-white/50/Rainfall_Rain_Lightning_Tempest_Apple_Weather-128.png',
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
