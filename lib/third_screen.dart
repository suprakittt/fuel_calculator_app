/*import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';*/
import 'package:driving_app/constants.dart';
import 'package:driving_app/function.dart';
import 'package:flutter/material.dart';
import 'fouth_screen.dart';
import 'package:flutter/services.dart';
/*import 'package:google_fonts/google_fonts.dart';*/

class CalculationWidget extends StatefulWidget {
  final int index;
  CalculationWidget({required this.index});

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
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> items = <String>[
    "กรุงเทพ",
    "นครนายก",
    "นครปฐม",
  ];
  String? selectedValue;
  String fuel = " ";
  var data = {};
  var weatherData; //ข้อมูล อากาศ
  var gasData; //ข้อมูล น้ำมัน

  getData() async {
    data = Rom.get()[widget.index];
    weatherData = await getWeatherData();
    gasData = await getGasData();
    print(weatherData);
    print("");
    print(gasData);
    fuel = gasData[(data["item"])]["today"];
    print("");
    print("---------------ตัวอย่างการใช้-----------------------");
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 70, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Your NAME',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(130, 4, 24, 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${data["name"]}',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Image.network(
              'https://static.vecteezy.com/system/resources/thumbnails/005/576/332/small/car-icon-car-icon-car-icon-simple-sign-free-vector.jpg',
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'Select Destination Province',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Center(
                                child: Text(item),
                              )))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Enter Destination Range(m):',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
              child: TextFormField(
                controller: textController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Type range in meter..',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 10),
                        child: Text(
                          'KM/L',
                        ),
                      ),
                      Text(
                        '${data["fuel"]}',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 10),
                        child: Text(
                          'FUEL Price/L',
                        ),
                      ),
                      Text(
                        fuel,
                      ),
                    ],
                  ),
                ],
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
                              MaterialPageRoute(
                                  builder: (context) => CalculateWidget(
                                        key: null,
                                      )),
                            );
                          },
                          color: Colors.blue,
                          child: Text('Calculate')),
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
}
