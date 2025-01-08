import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void printSchedule(List<Map<String, String>> scheduleData) async {
  final pdf = pw.Document();


  final fontData = await rootBundle.load("assets/fonts/cairo/Cairo-Medium.ttf");
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());

  // Add content to the PDF
  pdf.addPage(
    pw.Page(
      textDirection: pw.TextDirection.rtl,
      build: (context) => pw.Column(
        children: [
          // Use the Arabic font for the heading
          pw.Text(
            'الجدول الدراسي',
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold, font: ttf),
          ),
          pw.SizedBox(height: 16),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              // Header Row
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.grey300),
                children: [
                  pw.Text('رقم المادة', textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                  pw.Text('اسم المادة', textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                  pw.Text('الأيام', textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                  pw.Text('المدرس', textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                  pw.Text('وقت المحاضرة', textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                  pw.Text('الموقع', textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                ],
              ),
              // Data Rows
              ...scheduleData.map((data) {
                return pw.TableRow(
                  children: [
                    pw.Text(data["courseNumber"]!, textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                    pw.Text(data["courseName"]!, textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                    pw.Text(data["credits"]!, textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                    pw.Text(data["instructor"]!, textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                    pw.Text(data["lectureTime"]!, textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                    pw.Text(data["lectureLocation"]!, textAlign: pw.TextAlign.center, style: pw.TextStyle(font: ttf)),
                  ],
                );
              }).toList(),
            ],
          ),
        ],
      ),
    ),
  );

  // Print or Save the PDF
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
