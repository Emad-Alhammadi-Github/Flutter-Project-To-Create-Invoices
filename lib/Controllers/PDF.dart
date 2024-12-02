import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDF {
  static String target = '';
  static String deta = '';
  static String titell = '';
  static String sum = '';
  static List data = [];

  static Get_Data(target_,titell_ ,deta_, data_, sum_) {
    target = target_;
    titell = titell_;
    deta = deta_;
    data = data_;
    sum = sum_;
  }

  static init() async {
    arFont = pw.Font.ttf(await rootBundle.load("Assets/fonts/alfont_com_AlFont_com_DINNextLTArabic-Regular-4.ttf"));
  }

  static pw.Widget IMG(i) {
    return pw.Center(child: pw.Expanded(child: i));
  }

  static late pw.Font arFont;



  static createPdf() async {
    await init();

    List<Directory>? directories = await getExternalStorageDirectories();
    Directory downloadsDirectory = directories!.first;
    String path = downloadsDirectory.path;

    File file = File('$path/$target.pdf');

    pw.Document pdf = pw.Document();

    // LOGOINCIP.png
    // logo.jpg
    final imageData = await rootBundle.load('Assets/ff.jpg');
    final bytesr = imageData.buffer.asUint8List();
    final imageProvider = pw.MemoryImage(bytesr);
    final image_1 = pw.Image(imageProvider);
    //
    final imageDataee1 = await rootBundle.load('Assets/loytr.jpg');
    final bytesree1 = imageDataee1.buffer.asUint8List();
    final imageProvideree1 = pw.MemoryImage(bytesree1);
    final image_1ee1 = pw.Image(imageProvideree1);

    pdf.addPage(pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(
          base: arFont,
        ),

        build: (context) => [
          pw.Column(
              children: [


pw.Container(
  margin: const pw.EdgeInsets.only(top: -40),
  child:  pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,

      children: [
       pw.Container(
            child:pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                        pw.Text("Haddah - Diplomatic Area"),
                        pw.Text("Email:info@incipitpro.com"),
                      pw.Text("Phone:+967 771 440 771"),
                      pw.Text("             +967 776 666 177"),

                ]
            ),

        ),


        pw.Container(
          width: 130,
          height: 100,
          alignment: pw.Alignment.center,
          margin: const pw.EdgeInsets.only(top: -15),
          padding: const pw.EdgeInsets.only(right: 10,left: 10),

          child: IMG(image_1ee1),
        ),


        pw.Container(

          width: 130,
          margin: const pw.EdgeInsets.only(top: -5),
          child:  pw.Column(children: [

            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text("${PDF.deta}"),
                  // pw.Spacer(),
                  pw.Text("التاريخ /",
                      style: pw.TextStyle(

                        color: PdfColor.fromHex("#ED7D31E6"),
                      )),
                ]),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Expanded(
                    // flex:3,
                    child: pw.Text("${PDF.target}",maxLines: 2, textAlign: pw.TextAlign.right,),
                  ),

                  // pw.Spacer(),
                  pw.Text("الجهه /",
                      style: pw.TextStyle(
                        color: PdfColor.fromHex("#ED7D31E6"),
                      )),
                ]),
          ]),
        ),








      ]
  ),
),


                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 30),
                    alignment: pw.Alignment.topRight,

                    child: pw.Text(
                      "${PDF.titell}",
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        fontSize: 13,
                      ),
                    )),


                pw.Container(
                    width: 130,
                    height: 100,

                    alignment: pw.Alignment.center,

                    child: image_1
                ),


                pw.Container(

                  color: PdfColor.fromHex("#ED7D31E6"),
                  child: pw.Table(
                    border: pw.TableBorder.all(
                        color: PdfColor.fromHex("#ED7D31E6")),
                    children: [
                      pw.TableRow(children: [
                        pw.Expanded(
                          flex: 2,
                          child: pw.Container(
                              alignment: pw.Alignment.center,
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(
                                "ملاحظات",
                                textAlign: pw.TextAlign.center,
                                style: const pw.TextStyle(
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Container(
                              alignment: pw.Alignment.center,
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(
                                "السعر",
                                textAlign: pw.TextAlign.center,
                                style: const pw.TextStyle(
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Container(
                              alignment: pw.Alignment.center,
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Text(
                                "الخدمة",
                                textAlign: pw.TextAlign.center,
                                style: const pw.TextStyle(
                                  fontSize: 15,
                                ),
                              )),
                        ),
                      ]),
                    ],
                  ),
                ),
                ...List.generate(
                  PDF.data.length,
                      (index) => pw.Container(

                    color: index % 2 == 0
                        ? PdfColor.fromHex("#FBE4D6FF")
                        : PdfColor.fromHex("#FFFFFFFF"),
                    child: pw.Table(
                      border: pw.TableBorder.all(
                          color: PdfColor.fromHex("#ED7D31E6")),
                      children: [
                        pw.TableRow(children: [
                          pw.Expanded(
                            flex: 2,
                            child: pw.Container(
                                alignment: pw.Alignment.center,
                                padding: const pw.EdgeInsets.all(8),
                                child: pw.Text(
                                  "${PDF.data[index]["notes"]}",
                                  textAlign: pw.TextAlign.center,
                                  style: const pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                )),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Container(
                                alignment: pw.Alignment.center,
                                padding: const pw.EdgeInsets.all(8),
                                child: pw.Text(
                                  "\$ ${PDF.data[index]["price"]} ",
                                  textAlign: pw.TextAlign.center,
                                  style: const pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                )),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Container(
                                alignment: pw.Alignment.center,
                                padding: const pw.EdgeInsets.all(8),
                                child: pw.Text(
                                  "${PDF.data[index]["serves"]}",
                                  textAlign: pw.TextAlign.center,
                                  style: const pw.TextStyle(
                                    fontSize: 13,
                                  ),
                                )),
                          )
                        ]),
                      ],
                    ),
                  ),
                ),

                pw.Container(

                  color: PdfColor.fromHex("#FFFFFFFF"),
                  child: pw.Table(
                    border: pw.TableBorder.all(
                        color: PdfColor.fromHex("#ED7D31E6")),
                    children: [
                      pw.TableRow(children: [
                        pw.Expanded(
                          flex: 2,
                          child: pw.Container(
                              margin: const pw.EdgeInsets.only(left: 200),
                              alignment: pw.Alignment.center,
                              padding: const pw.EdgeInsets.all(8),
                              child: pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                                children: [
                                  pw.Text(
                                    "\$ ${PDF.sum}",
                                    textAlign: pw.TextAlign.center,
                                    style: const pw.TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  // pw.Spacer(),
                                  pw.Text(
                                    "الاجمالي /",
                                    textAlign: pw.TextAlign.center,
                                    style: const pw.TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ]
                              )
                          ),
                        ),


                      ]),
                    ],
                  ),
                ),





              ]
          ),





        ]));




    Uint8List bytes = await pdf.save();
    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
  }
}
