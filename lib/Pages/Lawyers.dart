import 'dart:async';
import 'dart:convert';

import 'package:almohami/Pages/LawyersDetails.dart';
import 'package:almohami/model/ModelLawyers.dart';
import 'package:almohami/tools/TextIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:http/http.dart' as http;

class Lawyers extends StatefulWidget {
  @override
  _LawyersState createState() => _LawyersState();
}

class _LawyersState extends State<Lawyers> {
  TextEditingController editingController = TextEditingController();

  bool loading = false;

  List<ModelLawyers> _Model_Lawyers = <ModelLawyers>[];
  Future<List<ModelLawyers>> getCenters() async {
    String link = "http://almohamigroup.com/api.php";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data as List;
        _Model_Lawyers = rest
            .map<ModelLawyers>((rest) => ModelLawyers.fromJson(rest))
            .toList();

        loading = false;
      }
    });
    return _Model_Lawyers;
  }

  @override
  void initState() {
    super.initState();
    this.getCenters();
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'قائمة المحامين',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, right: 0.0, left: 0.0, bottom: 5.0),
              child: TextField(
//                onChanged: (value) {
//                  filterSearchResults(value);
//                },
                controller: editingController,
                decoration: InputDecoration(
                    hintText: "بحث بإسم المحامي...",
                    hintStyle: TextStyle(
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
                    suffixIcon: InkWell(
                      splashColor: Color(0xFF000000),
                      onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => FilterSearch(),
//                          ),
//                        );
                      },
                      child: Icon(
                        FontAwesomeIcons.slidersH,
                        color: Color(0xFF000000),
                      ),
                    ),
                    prefixIcon: GestureDetector(
                      child: Icon(
                        Icons.search,
                        color: Color(0xFF000000),
                      ),
                      onTap: () {},
                    ),
                    border: UnderlineInputBorder()),
              ),
            ),
            Expanded(
              child: loading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: EdgeInsets.all(1.0),
                      itemExtent: 114.0,
                      shrinkWrap: true,
                      itemCount: _Model_Lawyers.length,
                      itemBuilder: (BuildContext context, index) {
                        final LawyersObj = _Model_Lawyers[index];
                        return new GestureDetector(
                          child: Card(
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
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
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                'assets/images/icon.png',
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      '${LawyersObj.Office}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 8.0,
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
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
                                                        fontFamily:
                                                            ArabicFonts.Cairo,
                                                        package:
                                                            'google_fonts_arabic',
                                                      ),
                                                    ),
                                                  ),
                                                  TextIcon(
                                                    text:
                                                        '${LawyersObj.address_info}',
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
