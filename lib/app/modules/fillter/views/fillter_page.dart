
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';
import '../../../core/utils/size_config.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/floating_widget.dart';
import '../widgets/dropdown.dart';

class FillterPage extends StatefulWidget {
  // FillterPage({Key? key}) : super(key: key);

  @override
  _FillterPageState createState() => _FillterPageState();
}

class _FillterPageState extends State<FillterPage> {
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
              // TypeAheadField(
              //   textFieldConfiguration: TextFieldConfiguration(
              //       decoration: InputDecoration(
              //           hintText: 'จังหวัด', border: OutlineInputBorder())),
              //   suggestionsCallback: (pattern)  {
              //     return null;
              //   },
              //   itemBuilder: (context, suggestion) {
              //     return ListTile(
              //       // title: Text(suggestion.nameTh.toString()),
              //     );
              //   },
              //   onSuggestionSelected: (suggestion) {},
              // ),
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
              txt: "ตกลง", onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
