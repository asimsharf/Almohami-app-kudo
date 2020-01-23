import 'package:almohami/Pages/PDF.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class lawyersDetails extends StatefulWidget {
  String user_id;
  String Office;
  String city;
  String officename;
  String work_fields;
  String address_info;
  String pdf_docs;
  String profile_photo;
  String cover_photo;

  lawyersDetails(
      {this.user_id,
      this.Office,
      this.city,
      this.officename,
      this.work_fields,
      this.address_info,
      this.pdf_docs,
      this.profile_photo,
      this.cover_photo});

  @override
  _lawyersDetailsState createState() => _lawyersDetailsState();
}

class _lawyersDetailsState extends State<lawyersDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('معلومات المحامي',
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black)),
      ),
      body: new Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 200.0,
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.fill,
                  placeholder: 'assets/images/default.jpg',
                  image:
                  'http://mohamigroup.com/wp-content/uploads/ultimatemember/${widget
                      .user_id}/${widget.cover_photo}',
                ),
              ),
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("إسم المحامي",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "${widget.Office}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("رقم الجوال",
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "${widget.officename}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("المدينة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "${widget.city}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("العنوان",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "${widget.address_info}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("التخصص",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "${widget.work_fields}",
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("المستندات",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Pdf(
                                    user_id: widget.user_id,
                                    pdf_docs: widget.pdf_docs,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "عرض المستندات",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          new Positioned(
            top: 130.0,
            child: Column(
              children: <Widget>[
                Container(
                  child: new Center(
                      child: new Stack(
                    children: <Widget>[
                      new Center(
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.fill,
                              placeholder: 'assets/images/icon.png',
                              image:
                              'http://mohamigroup.com/wp-content/uploads/ultimatemember/${widget
                                  .user_id}/${widget.profile_photo}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: new FlatButton(
                onPressed: () => launch("tel://${widget.officename}"),
                color: Color(0xFFFFC400),
                splashColor: Colors.yellowAccent,
                textColor: Colors.black,
                //elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("إتصال",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ),
            ),
            SizedBox(width: 3.0),
            Expanded(
              child: new FlatButton(
                onPressed: () =>
                    launch("whatsapp://send?phone=+249${widget.officename}"),
                color: Color(0xFFFFC400),
                splashColor: Colors.yellowAccent,
                textColor: Colors.black,
                //elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("واتساب",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
