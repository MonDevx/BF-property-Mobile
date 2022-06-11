import 'dart:convert';

import 'package:bfproperty/constants/size_config.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/models/real_estate_model.dart';
import 'package:bfproperty/widgets/floating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'widgets/body.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  RealEstateModel data;
  bool disable = false;
  bool _isButtonDisabled;
  TextEditingController _controllername;
  TextEditingController _controlleremail;
  TextEditingController _controllerphone;
  bool isvaildemail = true;
  bool isvaildname = true;
  bool isvaildphone = true;
  Future<RealEstateModel> _loadRealestate;
  List<dynamic> nearByPlaces;
  void initState() {
    super.initState();
    _isButtonDisabled = false;
    _loadRealestate = loadRealestate(Get.arguments);
    _controllername = TextEditingController();
    _controlleremail = TextEditingController();
    _controllerphone = TextEditingController();
  }

  void dispose() {
    super.dispose();
  }

  Future<RealEstateModel> loadRealestate(name) async {
    final response = await http.get(Uri.parse(
        'https://us-central1-bfproperty.cloudfunctions.net/webApi/api/v1/realestatedetail/' +
            name));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      Map<String, dynamic> jsonResponse = json.decode(response.body);
      jsonResponse['data'].addAll({'id': jsonResponse['id']});
      final responsapi = await http.get(Uri.parse(
        'https://api.longdo.com/POIService/json/search?limit=5&lon=${jsonResponse['data']['longitude']}&lat=${jsonResponse['data']['latitude']}&key=${dotenv.env['FLUTTER_APP_LONGDO_KEY']}',
      ));
      if (responsapi.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(responsapi.body);
        setState(() {
          nearByPlaces = jsonResponse['data'];
          disable = true;
        });
      } else {
        Get.snackbar(
          'ข้อผิดพลาด',
          responsapi.body,
          colorText: Colors.white,
          backgroundColor: Get.theme.errorColor,
          duration: Duration(seconds: 5),
        );
      }
      return new RealEstateModel.fromJson(jsonResponse['data']);
    } else {
      Get.snackbar(
        'ข้อผิดพลาด',
        response.body,
        colorText: Colors.white,
        backgroundColor: Get.theme.errorColor,
        duration: Duration(seconds: 5),
      );
    }
  }

  void sendEmail(String email, String name, AppLocalizations_Labels labels) {
    final labels = AppLocalizations.of(context);
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(labels?.propertydetail?.titledialoglabel),
              content: Container(
                height: 240.0,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _controllername,
                            decoration: InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.user,
                                    color: Colors.grey),
                                labelText: labels?.propertydetail?.namelabel,
                                hintText: labels?.propertydetail?.namehintlabel,
                                errorText: isvaildname
                                    ? null
                                    : labels?.propertydetail?.namehintlabel),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _controlleremail,
                            decoration: InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.mail_bulk,
                                    color: Colors.grey),
                                labelText: labels?.propertydetail?.emaillabel,
                                hintText:
                                    labels?.propertydetail?.emailhintlabel,
                                errorText: isvaildemail
                                    ? null
                                    : labels?.propertydetail?.emailerrorlabel),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            maxLength: 12,
                            inputFormatters: [PhoneInputFormatter()],
                            keyboardType: TextInputType.number,
                            controller: _controllerphone,
                            decoration: InputDecoration(
                                prefixIcon: Icon(LineAwesomeIcons.mobile_phone,
                                    color: Colors.grey),
                                labelText: labels?.propertydetail?.phonelabel,
                                hintText:
                                    labels?.propertydetail?.phonehintlabel,
                                counterText: "",
                                errorText: isvaildphone
                                    ? null
                                    : labels?.propertydetail?.phoneerrorlabel),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.send),
                  label: Text(labels?.propertydetail?.sendlabel),
                  onPressed: _isButtonDisabled
                      ? null
                      : () async {
                          if (_controllername.text?.isNotEmpty ?? true) {
                            setState(() {
                              isvaildname = true;
                            });
                          } else {
                            setState(() {
                              isvaildname = false;
                            });
                          }
                          if (_controllername.text?.isNotEmpty ??
                              true && _controllerphone.text.length == 12) {
                            setState(() {
                              isvaildphone = true;
                            });
                          } else {
                            setState(() {
                              isvaildphone = false;
                            });
                          }
                          if (!EmailValidator.validate(_controlleremail.text)) {
                            setState(() {
                              isvaildemail = false;
                            });
                          } else {
                            setState(() {
                              isvaildemail = true;
                            });
                          }
                          if (isvaildemail && isvaildphone && isvaildname) {
                            setState(() {
                              _isButtonDisabled = true;
                            });
                            final http.Response response = await http.post(
                              Uri.parse(
                                  'https://us-central1-bfproperty.cloudfunctions.net/sendMailOverHTTP'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'name': _controllername.text,
                                'email': _controlleremail.text,
                                'phone': _controllerphone.text,
                                'propertyname': name,
                                'emailowner': email,
                              }),
                            );
                            if (response.statusCode == 200) {
                              Get.back();
                              Get.snackbar(
                                labels?.propertydetail?.successlabel,
                                labels?.propertydetail?.successdetaillabel,
                                colorText: Colors.white,
                                backgroundColor: Colors.green[400],
                                duration: Duration(seconds: 5),
                              );
                            } else {
                              Get.snackbar(
                                labels?.propertydetail?.errorlabel,
                                labels?.propertydetail?.errordetaillabel,
                                colorText: Colors.white,
                                backgroundColor: Colors.red[400],
                                duration: Duration(seconds: 5),
                              );
                            }
                          }
                        },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.close),
                  label: Text(labels?.profile?.dialogcancel),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final labels = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: FutureBuilder<RealEstateModel>(
          future: _loadRealestate,
          builder: (context, AsyncSnapshot<RealEstateModel> snapshot) {
            if (snapshot.hasData) {
              data = snapshot.data;
              return Body(data: data, nearByPlaces: nearByPlaces);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        child: Visibility(
          visible: disable,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingWidget(
                leadingIcon: Icons.mail,
                txt: labels?.propertydetail?.sendmaillabel,
                onPressed: () {
                  sendEmail(data.email, data.name, labels);
                },
              ),
              FloatingWidget(
                leadingIcon: Icons.monetization_on,
                txt: labels?.propertydetail?.callabel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
