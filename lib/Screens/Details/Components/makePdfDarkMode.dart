import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

// PdfPage
class PdfDarkModePage extends StatelessWidget {
  const PdfDarkModePage({Key key, this.noteTitle, this.noteUrl})
      : super(key: key);

  final String noteTitle, noteUrl;

  @override
  Widget build(BuildContext context) {
    Color _fgColor = Colors.white;

    Color _bgColor = Colors.black;

    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        backgroundColor: _bgColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: _fgColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          noteTitle.toUpperCase(),
          style: TextStyle(
            color: _fgColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.wb_sunny_outlined,
              color: _fgColor,
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: const PDF(
        nightMode: true,
      ).cachedFromUrl(
        noteUrl,
        placeholder: (double progress) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: _fgColor,
              ),
              Text('$progress %')
            ],
          ),
        ),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
