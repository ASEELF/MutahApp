import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/schedule/printSchedule.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<Map<String, String>> scheduleData = [
    {
      "courseNumber": "2211547",
      "courseName": "نظم التشغيل",
      "credits": "ث ر",
      "instructor": "د. باسم مصطفى",
      "lectureTime": "9:30 - 11:00",
      "lectureLocation": " 101",
    },
    {
      "courseNumber": "2211547",
      "courseName": "قواعد البيانات",
      "credits": "ث ر",
      "instructor": "د. معتز الشويكي",
      "lectureTime": "11:00 - 12:30",
      "lectureLocation": " 103",
    },
    {
      "courseNumber": "2211547",
      "courseName": "تركيب البيانات",
      "credits": "ث ر",
      "instructor": "د. حنان الفاخوري",
      "lectureTime": "12:30 - 2:00",
      "lectureLocation": " 202",
    },
    {
      "courseNumber": "2211547",
      "courseName": "شبكات الحاسوب",
      "credits": "ث ر",
      "instructor": "أ. أحمد الصرايرة",
      "lectureTime": "2:00 - 3:30",
      "lectureLocation": " 101",
    },
    {
      "courseNumber": "2211547",
      "courseName": "مختبر قواعد البيانات",
      "credits": "أ ث خ",
      "instructor": "خولة الطراونة",
      "lectureTime": "12:00 - 1:00",
      "lectureLocation": " It-lab03",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorManager.transparentcolor,
          appBar: const AppBarWidget(title: AppStrings.schedule),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // White background
                          border: Border.all(color: Colors.black, width: 1.0), // Black border
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 8.0), // Inner padding
                        child: Text(
                          'الفصل الدراسي الأول 2024-2025',
                          style: getFirstSemiBoldStyle(color: ColorManager.black), // Your custom text style
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.white), // White header row
                          columnSpacing: 10,
                          border: TableBorder.all(color: Colors.black, width: 1),
                          columns: [
                            DataColumn(
                                label: Text('رقم المادة',
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                            DataColumn(
                                label: Text('اسم المادة',
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                            DataColumn(
                                label: Text('الأيام',
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                            DataColumn(
                                label: Text('المدرس',
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                            DataColumn(
                                label: Text('وقت المحاضرة',
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                            DataColumn(
                                label: Text('القاعة',
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                          ],
                          rows: scheduleData.map((data) {
                            return DataRow(
                              color: MaterialStateColor.resolveWith((states) => Colors.white), // White row background
                              cells: [
                                DataCell(Text(data["courseNumber"]!,
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                                DataCell(Text(data["courseName"]!,
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                                DataCell(Text(data["credits"]!,
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                                DataCell(Text(data["instructor"]!,
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                                DataCell(Text(data["lectureTime"]!,
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                                DataCell(Text(data["lectureLocation"]!,
                                    style: getFirstRegularStyle(color: ColorManager.black))),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 305.0,
                  right: 20.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your print functionality here
                      printSchedule(scheduleData);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.green,
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'طباعة',
                      style: getFirstRegularStyle(color: ColorManager.white ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

