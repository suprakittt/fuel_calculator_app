import 'package:driving_app/function.dart';
import 'package:flutter/material.dart';
import 'fouth_screen.dart';
import 'package:flutter/services.dart';


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
  TextEditingController textController = TextEditingController();
  double rain = 0.00;
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
  String fuel = " ";
  var data = {};
  List weatherData = []; //ข้อมูล อากาศ
  var gasData; //ข้อมูล น้ำมัน

  getData() async {
    data = Rom.get()[widget.index];
    weatherData = await getWeatherData();
    gasData = await getGasData();
    print(weatherData);
    print("");
    print(gasData);
    fuel = gasData[(data["item"])]["today"];
/*    print("");
    print("---------------TEST-----------------------");
    print(weatherData[0]["Province"]);
    print("");
    print(gasData[0]["today"]);*/
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
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(168, 4, 24, 30),
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'Select Destination Province',
                        style: TextStyle(
                          fontSize: 20,
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
                          bool set = true;
                          selectedValue = value as String;
                          weatherData.forEach((e) {
                            if (e["Province"] == selectedValue && set) {
                              print(e["Observation"]["Rainfall"]);
                              rain = double.parse(e["Observation"]["Rainfall"]);
                              set = false;
                            }
                          });
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
                        'Enter Destination Range(km):',
                        style: TextStyle(fontSize: 25),
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
                  hintText: 'Type range in kilometer..',
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
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
                          'KM/L',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Text(
                        '${data["fuel"]}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          'FUEL Price/L',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Text(
                        fuel,
                        style: TextStyle(fontSize: 15),
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
}
