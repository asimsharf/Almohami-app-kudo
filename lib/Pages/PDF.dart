import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:google_fonts_arabic/fonts.dart';

class Pdf extends StatefulWidget {
  String user_id;
  String pdf_docs;
  Pdf({
    this.user_id,
    this.pdf_docs,
  });

  @override
  _PdfState createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  bool _isLoading = true;
  PDFDocument document;
  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    final String Link =
        "http://almohamigroup.com/wp-content/uploads/ultimatemember/${widget.user_id}/${widget.pdf_docs}";
    document = await PDFDocument.fromURL(Link);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'المستندات',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
      ),
      body: Center(
        child: _isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : PDFViewer(
          document: document,
          tooltip: PDFViewerTooltip(
            first: "Batatas",
          ),
        ),
      ),
    );
  }
}
