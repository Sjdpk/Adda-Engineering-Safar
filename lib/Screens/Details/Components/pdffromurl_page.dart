import 'package:adda/Screens/Details/Components/makePdfDarkMode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

// PdfPage
class PdfPage extends StatelessWidget {
  const PdfPage({Key key, this.noteTitle, this.noteUrl}) : super(key: key);

  final String noteTitle, noteUrl;

  @override
  Widget build(BuildContext context) {
    Color _fgColor = Colors.white;

    Color _bgColor = Colors.black;

    return Scaffold(
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
                Icons.nightlight_round,
                color: _fgColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PdfDarkModePage(
                        noteTitle: noteTitle,
                        noteUrl: noteUrl,
                      );
                    },
                  ),
                );
              })
        ],
      ),
      body: const PDF().cachedFromUrl(
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
