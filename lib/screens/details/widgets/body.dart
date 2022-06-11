import 'dart:async';
import 'dart:convert';

import 'package:bfproperty/constants/size_config.dart';
import 'package:bfproperty/controllers/auth_controller.dart';
import 'package:bfproperty/controllers/user_controller.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/models/real_estate_model.dart';
import 'package:bfproperty/widgets/facilitywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_share/flutter_share.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final RealEstateModel data;
  final List nearByPlaces;
  Body({Key key, this.data, this.nearByPlaces}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  final formatCurrency = new NumberFormat.simpleCurrency();
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final AuthController authController = AuthController.to;
  final UserController userController = UserController.to;
  Timer timerAnimation;
  bool active = false;
  bool active2 = false;
  bool myfavorite = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      myfavorite =
          authController.firestoreUser.value.favorite.contains(widget.data.id);
    });
    var imagelist = widget.data.urlimginside + widget.data.urlimgoutside;
    timerAnimation = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < imagelist.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(microseconds: 250),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timerAnimation.cancel();
    _pageController.dispose();
  }

  Future<void> share(name) async {
    await FlutterShare.share(
        title: 'บ้านในฝัน BF-property',
        linkUrl: 'https://www.bf-property.com/property-detail/' + name,
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    var imagelist = widget.data.urlimginside + widget.data.urlimgoutside;
    return SafeArea(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: ClampingScrollPhysics(),
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: PageView(
                    pageSnapping: true,
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagelist.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var image;

                          if (index < imagelist.length) {
                            image = imagelist[index];
                          }
                          return ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.srcOver),
                            child: Container(
                              child: Image.network(
                                image['original'],
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 12,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 25,
                  top: 12,
                  child: Row(
                    children: [
                      GetBuilder<AuthController>(
                          builder: (controller) => IconButton(
                                onPressed: () => userController.upDateFavorite(
                                    widget.data.id, context),
                                icon: Icon(
                                  MdiIcons.heart,
                                  color: authController
                                          .firestoreUser.value.favorite
                                          .contains(widget.data.id)
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              )),
                      IconButton(
                        onPressed: () => share(widget.data.name),
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.data.name.replaceAll(new RegExp(r'-'), ' '),
                       style: themeData.textTheme.headline1,),
                  Text(
                      widget.data.idtype == 1
                          ? labels?.propertydetail?.typeproperty1label
                          : widget.data.idtype == 2
                              ? labels?.propertydetail?.typeproperty2label
                              : labels?.propertydetail?.typeproperty3label,
                       style: themeData.textTheme.bodyText1),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.location_on, size: 25),
                          ),
                          TextSpan(
                            text: widget.data.address +
                                " " +
                                widget.data.district +
                                " " +
                                widget.data.subDistrict +
                                " " +
                                widget.data.province +
                                " " +
                                widget.data.zipcode,
                           style: themeData.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 8, left: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              labels?.propertydetail?.pricelabel,
                              style: themeData.textTheme.bodyText1
                            ),
                            Text(
                                "${formatCurrency.format(widget.data.price)} ${labels?.propertydetail?.pricelabel}",
                                style: themeData.textTheme.bodyText2)
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              labels?.propertydetail?.familylabel,
                              style: themeData.textTheme.bodyText1
                            ),
                            Text(
                                widget.data.sizefamily == 1
                                    ? labels?.propertydetail?.familytype1label
                                    : widget.data.sizefamily == 2
                                        ? labels
                                            ?.propertydetail?.familytype2label
                                        : labels
                                            ?.propertydetail?.familytype3label,
                                style: themeData.textTheme.bodyText2)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 8, right: 8),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: FacilityWidget(
                        iconData: MdiIcons.scaleBathroom,
                        text: widget.data.numberofbathrooms.toString(),
                      )),
                      Expanded(
                          child: FacilityWidget(
                        iconData: MdiIcons.car,
                        text: widget.data.numberofparkingspace.toString(),
                      )),
                      Expanded(
                          child: FacilityWidget(
                        iconData: MdiIcons.bed,
                        text: widget.data.numberofbedrooms.toString(),
                      )),
                      Expanded(
                          child: FacilityWidget(
                        iconData: MdiIcons.floorPlan,
                        text: widget.data.numberoffloors.toString(),
                      )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: FacilityWidget(
                          iconData: MdiIcons.clockTimeEightOutline,
                          text: widget.data.yearofconstruction.toString(),
                        )),
                        Expanded(
                            child: FacilityWidget(
                          iconData: MdiIcons.imageSizeSelectSmall,
                          text: widget.data.propertysize.toString(),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 24, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    labels?.propertydetail?.detaillabel,
                   style: themeData.textTheme.bodyText1
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(widget.data.detail,
                        style: themeData.textTheme.bodyText2))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  if (index == 0) {
                    setState(() {
                      active = !active;
                      active2 = false;
                    });
                  } else {
                    setState(() {
                      active = false;
                      active2 = !active2;
                    });
                  }
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(labels?.propertydetail?.furniturelabel),
                      );
                    },
                    body: Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: Wrap(
                          spacing:
                              15, // to apply margin in the main axis of the wrap
                          runSpacing:
                              1, // to apply margin in the cross axis of the wrap
                          children: <Widget>[
                            for (var item in widget.data.centralservice)
                              item['checked'] == true
                                  ? Text(item['name'])
                                  : Text(""),
                            for (var item in widget.data.furniture)
                              item['checked'] == true
                                  ? Text(item['name'])
                                  : Text(""),
                          ]),
                    ),
                    isExpanded: active,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(labels?.propertydetail?.nearbyplaceslabel),
                      );
                    },
                    body: Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                            spacing:
                                15, // to apply margin in the main axis of the wrap
                            runSpacing: 1, // to apply margin in the cross axis of the wrap
                            children: <Widget>[
                              for (var item in widget.nearByPlaces)
                                Text(item['name'])
                            ]),
                      ),
                    ),
                    isExpanded: active2,
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 24),
                height: 250,
                child: FlutterMap(
                  options: new MapOptions(
                    center: LatLng(widget.data.latitude, widget.data.longitude),
                    zoom: 17.0,
                  ),
                  layers: [
                    new TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    new MarkerLayerOptions(
                      markers: [
                        new Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(
                              widget.data.latitude, widget.data.longitude),
                          builder: (ctx) => new Container(
                            child: new Icon(
                              MdiIcons.mapMarker,
                              color: Colors.blue,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                SizedBox(height: getProportionateScreenHeight(125)),
          ],
        ),
      ),
    );
  }
}
