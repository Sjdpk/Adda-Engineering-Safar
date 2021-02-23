import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatelessWidget {
  final String noteTitle;
  final String noteUrl;

  const PdfPage({
    Key key,
    this.noteUrl,
    this.noteTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noteTitle),
      ),
      body: SfPdfViewer.network(noteUrl),
    );
  }
}
