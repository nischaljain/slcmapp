import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart' ;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

const String _documentPath = 'assets/MECH.pdf';
const String _documentPath1 = 'assets/MEDIA.pdf';
const String _documentPath2 = 'assets/MECHATRONIX.pdf';
const String _documentPath3 = 'assets/IT-CCE.pdf';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);


  //FRONTEND FOR PDF VIEWER PAGE
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
          backgroundColor: Colors.redAccent,
        ),
        path: pdfPath);
  }
}


//FUNCTION FOR PDF CALLING
class _MyHomePageState extends State<MyHomePage> {

  // This moves the PDF file from the assets to a place accessible by our PDF viewer.
  //-------------link0-------------
  Future<String> prepareTestPdf() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(_documentPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }
  //-----------------link 1--------------
  Future<String> prepareTestPdf1() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(_documentPath1);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath1';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }
  //-------------link2-------------
  Future<String> prepareTestPdf2() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(
        _documentPath2);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath2';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }
  //-------------link3-------------
  Future<String> prepareTestPdf3() async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(_documentPath3);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath3';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }


//body properties
  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
//APPBAR PROPERTIES
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 55),
        child: new Container(
          height: 400.0,
          decoration: new BoxDecoration(
            color: Colors.redAccent,
            boxShadow: [
              new BoxShadow(blurRadius: 10.0)
            ],
            borderRadius: new BorderRadius.vertical(
                bottom: new Radius.elliptical(
                    MediaQuery.of(context).size.width, 10.0)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "SLCM Notices",
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'TileTitle',
                  ),),]

          ),
        ),
      ),

//TILESLIST
      body: ListView(
        children:  <Widget>[

          Padding(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/pdf.png'),
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  "Mech Time-Table",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'TileTitle',
                  ),
                ),
                subtitle: Padding(
                  child: Text(
                    "Effective from 3-08-2020",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,

                    ),),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),

                contentPadding: EdgeInsets.all(3),
                enabled: true,
                onTap: () => {
                  // We need to prepare the test PDF, and then we can display the PDF.
                  prepareTestPdf().then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  })
                },
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 10, 30),
          ),

          const Divider(

            color: Colors.white38,
            thickness: 5,
            height: 0.1,
            indent: 20,
            endIndent: 20,
          ),


          //----------------CARD 1-------------------------

          Padding(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/pdf.png'),
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  "Media Time-Table",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'TileTitle',
                  ),
                ),
                subtitle: Padding(
                  child: Text(
                    "Effective from 3-08-2020",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,

                    ),),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),

                contentPadding: EdgeInsets.all(3),
                enabled: true,
                onTap: () => {
                  // We need to prepare the test PDF, and then we can display the PDF.
                  prepareTestPdf1().then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  })
                },
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 10, 30),
          ),

          const Divider(

            color: Colors.white38,
            thickness: 5,
            height: 0.1,
            indent: 20,
            endIndent: 20,
          ),

          //---------------CARD2------------------------
          Padding(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/pdf.png'),
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  "Mechatronix Time-Table",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'TileTitle',
                  ),
                ),
                subtitle: Padding(
                  child: Text(
                    "Effective from 3-08-2020",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,

                    ),),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),

                contentPadding: EdgeInsets.all(3),
                enabled: true,
                onTap: () => {
                  // We need to prepare the test PDF, and then we can display the PDF.
                  prepareTestPdf2().then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  })
                },
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 10, 30),
          ),
        //--------------------card 3---------------
          const Divider(

            color: Colors.white38,
            thickness: 5,
            height: 0.1,
            indent: 20,
            endIndent: 20,
          ),

          Padding(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/pdf.png'),
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  "Mech Time-Table",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'TileTitle',
                  ),
                ),
                subtitle: Padding(
                  child: Text(
                    "Effective from 3-08-2020",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,

                    ),),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),

                contentPadding: EdgeInsets.all(3),
                enabled: true,
                onTap: () => {
                  // We need to prepare the test PDF, and then we can display the PDF.
                  prepareTestPdf3().then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path)),
                    );
                  })
                },
              ),
              color: Colors.black,
            ),
            padding: EdgeInsets.fromLTRB(20, 20, 10, 30),
          ),

          const Divider(

            color: Colors.white38,
            thickness: 5,
            height: 0.1,
            indent: 20,
            endIndent: 20,
          ),

        ]



    )


      );
  }
}