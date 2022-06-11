import 'package:bfproperty/constants/size_config.dart';
import 'package:bfproperty/widgets/custom_app_bar.dart';
import 'package:bfproperty/widgets/floating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_thailand_provinces/provider/province_provider.dart';
import 'package:flutter_thailand_provinces/dao/province_dao.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'widgets/dropdown.dart';

class Fillter extends StatefulWidget {
  // fillter({Key? key}) : super(key: key);

  @override
  _FillterState createState() => _FillterState();
}

class _FillterState extends State<Fillter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar("ค้นหา"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ทำเลที่ตั้ง',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              SizedBox(height: getProportionateScreenHeight(15)),
              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                        hintText: 'จังหวัด', border: OutlineInputBorder())),
                suggestionsCallback: (pattern) async {
                  return await ProvinceProvider.all();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion.nameTh),
                  );
                },
                onSuggestionSelected: (suggestion) {},
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              dropdown(),
              SizedBox(height: getProportionateScreenHeight(15)),
              dropdown(),
              SizedBox(height: getProportionateScreenHeight(15)),
              dropdown(),
              SizedBox(height: getProportionateScreenHeight(15)),
              dropdown(),
            ],
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingWidget(
              leadingIcon: Icons.cancel,
              txt: "ล้างข้อมูล",
              color: Get.theme.errorColor,
              onPressed: () {
                // sendEmail(data.email, data.name, labels);
              },
            ),
            FloatingWidget(
              leadingIcon: Icons.check_circle,
              txt: "ตกลง",
            ),
          ],
        ),
      ),
    );
  }
}
