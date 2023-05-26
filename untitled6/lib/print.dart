// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class print extends StatelessWidget {
  const print(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(format, " Account statement "),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.abelRegular();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.Column(
                children: [
                  pw.Row(
                      children: [
                        pw.Text(" Future National Bank ")
                      ]),
                  pw.Row(
                      children: [
                        pw.Text(" Employee name : Ahmed wael ")
                      ]),
                  pw.Row(
                      children: [
                        pw.Text(" Branch : Fifth settlement ")
                      ]),
                  pw.Row(
                      children: [
                        pw.Text(" Date : 13/04/2023 , Time : 11:30 ")
                      ]),
                  pw.SizedBox(
                      height: 10
                  ),
                ],
              ),
              pw.SizedBox(
                width: 250,
                child: pw.Text(title, style: pw.TextStyle(font: font,fontSize: 30)),
              ),
              pw.Flexible(child: pw.Container(
                child: pw.Column(children: [
                  pw.Row(children: [
                    pw.Container(
                      child: pw.Text(" Transaction id :",style: pw.TextStyle(fontSize: 16),),
                    ),
                  ]),
                  pw.Row(children: [
                    pw.Container(
                      child: pw.Text(" Acc No : ",style: pw.TextStyle(fontSize: 16)),
                    ),
                  ]),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" To : ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Amount : EGP ",
                            style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Type :  ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Date:  - Time :  ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Container(
                    child: pw.Text(
                        " -------------------------------------------------------------------------------------------------------"),
                  ),
                  pw.Row(children: [
                    pw.Container(
                      child: pw.Text(" Transaction id :",style: pw.TextStyle(fontSize: 16),),
                    ),
                  ]),
                  pw.Row(children: [
                    pw.Container(
                      child: pw.Text(" Acc No : ",style: pw.TextStyle(fontSize: 16)),
                    ),
                  ]),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" To : ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Amount : EGP ",
                            style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Type :  ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Date:  - Time :  ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Container(
                    child: pw.Text(
                        " -------------------------------------------------------------------------------------------------------"),
                  ),
                  pw.Row(children: [
                    pw.Container(
                      child: pw.Text(" Transaction id :",style: pw.TextStyle(fontSize: 16),),
                    ),
                  ]),
                  pw.Row(children: [
                    pw.Container(
                      child: pw.Text(" Acc No : ",style: pw.TextStyle(fontSize: 16)),
                    ),
                  ]),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" To : ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Amount : EGP ",
                            style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Type :  ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        child: pw.Text(" Date:  - Time :  ",style: pw.TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  pw.Container(
                    child: pw.Text(
                        " -------------------------------------------------------------------------------------------------------"),
                  ),
                ],mainAxisAlignment: pw.MainAxisAlignment.center),
              )),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}