import 'dart:async';
import 'dart:convert';

import 'package:almohami/Pages/LawyersDetails.dart';
import 'package:almohami/model/ModelLawyers.dart';
import 'package:almohami/tools/TextIcon.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;

class Lawyers extends StatefulWidget {
  @override
  _LawyersState createState() => _LawyersState();
}

class _LawyersState extends State<Lawyers> {
  //---------------------------------------------------------------
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final TextEditingController _filter = new TextEditingController();
  final dio = new Dio();
  String _searchText = "";
  List names = new List();
  Icon _searchIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  bool _loading = false;

  void getLawyersNames() async {
    try {
      final response = await dio.get('http://almohamigroup.com/api.php');
      List<ModelLawyers> tempList = <ModelLawyers>[];
      for (int i = 0; i < response.data.length; i++) {
        var rest = response.data as List;
        _Model_Lawyers = rest
            .map<ModelLawyers>(
              (rest) => ModelLawyers.fromJson(rest),
        )
            .toList();
        tempList.add(
          ModelLawyers.fromJson(
            response.data[i],
          ),
        );
      }
      setState(
            () {
          if (response.statusCode == 200) {
            names = tempList;
            names.shuffle();
            _Model_Lawyers = names;
          }
        },
      );
    } catch (Exception) {
      return null;
    }
  }

  List<ModelLawyers> _Model_Lawyers = <ModelLawyers>[];
  Future<List<ModelLawyers>> getLawyers() async {
    String link = "http://almohamigroup.com/api.php";

    try {
      final response = await http
          .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
      setState(
            () {
          if (response.statusCode == 200) {
            var data = json.decode(response.body);
            var rest = data as List;
            _Model_Lawyers = rest
                .map<ModelLawyers>(
                  (rest) => ModelLawyers.fromJson(rest),
            )
                .toList();
            _loading = false;
          }
        },
      );
    } catch (Exception) {
      return _Model_Lawyers;
    }
    return _Model_Lawyers;
  }

  //---------------------------------------------------------------
  Widget _appBarTitle = new Text(
    'المحامين',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: ArabicFonts.Cairo,
      color: Colors.black,
      package: 'google_fonts_arabic',
    ),
  );

  _LawyersState() {
    _filter.addListener(
          () {
        if (_filter.text.isEmpty) {
          setState(
                () {
              _searchText = "";
              _Model_Lawyers = names;
            },
          );
        } else {
          setState(
                () {
              _searchText = _filter.text;
            },
          );
        }
      },
    );
  }

  Future<Null> _refresh() {
    return getLawyers().then(
          (modelCen) {
        setState(() => _Model_Lawyers = modelCen);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _refreshIndicatorKey.currentState.show(),
    );
    this.getLawyers();
    this.getLawyersNames();
    setState(
          () {
        _loading = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: new Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: _loading
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : _buildProductList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    Widget CentersList;
    if (_Model_Lawyers.length > 0) {
      if (!(_searchText.isEmpty)) {
        List<ModelLawyers> tempList = <ModelLawyers>[];
        for (int i = 0; i < _Model_Lawyers.length; i++) {
          if (_Model_Lawyers[i]
              .Office
              .toLowerCase()
              .contains(_searchText.toLowerCase())) {
            tempList.add(_Model_Lawyers[i]);
          }
        }
        _Model_Lawyers = tempList;
      }
      CentersList = new ListView.builder(
        padding: EdgeInsets.all(1.0),
        itemExtent: 114.0,
        shrinkWrap: true,
        itemCount: _Model_Lawyers.length,
        itemBuilder: (BuildContext context, index) {
          final LawyersObj = _Model_Lawyers[index];
          try {
            if (LawyersObj.profile_photo == null) {
              LawyersObj.profile_photo = '';
            }
          } catch (Exception) {
            return null;
          }

          return new GestureDetector(
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                //This is the list view search result
                child: Container(
                  height: 140.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 80.0,
                          width: 80.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/icon.png',
                              image:
                                  'http://almohamigroup.com/wp-content/uploads/ultimatemember/${LawyersObj.user_id}/${LawyersObj.profile_photo}',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${LawyersObj.Office}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "${LawyersObj.work_fields}",
                                        softWrap: false,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    TextIcon(
                                      text: "${LawyersObj.city}",
                                      icon: FontAwesomeIcons.city,
                                      isColumn: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${LawyersObj.officename}',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.red,
                                          fontFamily: ArabicFonts.Cairo,
                                          package: 'google_fonts_arabic',
                                        ),
                                      ),
                                    ),
                                    TextIcon(
                                      text: '${LawyersObj.address_info}',
                                      icon: Icons.my_location,
                                      isColumn: false,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LawyersDetails(
                        user_id: LawyersObj.user_id,
                        Office: LawyersObj.Office,
                        city: LawyersObj.city,
                        officename: LawyersObj.officename,
                        work_fields: LawyersObj.work_fields,
                        address_info: LawyersObj.address_info,
                        pdf_docs: LawyersObj.pdf_docs,
                        profile_photo: LawyersObj.profile_photo,
                        cover_photo: LawyersObj.cover_photo,
                      ),
                ),
              );
            },
          );
        },
      );
    } else {
      CentersList = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(Icons.hourglass_empty),
            ),
            Text(
              'عفواً لا محامين !',
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontSize: 20.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }
    return CentersList;
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          autofocus: true,
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: 'بحث بإسم المحامي...',
            hintStyle: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                color: Colors.black),
          ),
        );
      } else {
        this._searchIcon = new Icon(
          Icons.search,
          color: Colors.black,
        );
        this._appBarTitle = new Text(
          'المحامين',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            color: Colors.black,
            package: 'google_fonts_arabic',
          ),
        );
        _Model_Lawyers = names;
        _filter.clear();
      }
    });
  }
}
