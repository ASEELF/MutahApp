import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/appBar/app_bar_widget.dart';

class HoursFeesPage extends StatefulWidget {
  @override
  _HoursFeesPageState createState() => _HoursFeesPageState();
}

class _HoursFeesPageState extends State<HoursFeesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int hours = 17; // Default hours
  int feePerHour = 40; // Example fee per hour
  int totalFee = 720; // Example initial total fee

  void updateTotalFee() {
    setState(() {
      totalFee = hours * feePerHour; // Update total based on hours
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: const AppBarWidget(title: AppStrings.hoursFees),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(AppStrings.hoursFeesNeededHours,
                          style:  getFirstMediumStyle(color: ColorManager.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Decrement Button
                            IconButton(
                              onPressed: () {
                                if (hours > 0) {
                                  setState(() {
                                    hours--;
                                    updateTotalFee();
                                  });
                                }
                              },
                              icon: Icon(Icons.remove),
                              color: Colors.green,
                              iconSize: 30,
                            ),
                            // Hours Display
                            Container(
                              width: 70,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '$hours',
                                style: getFirstMediumStyle(color: ColorManager.black),
                              ),
                            ),
                            // Increment Button
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  hours++;
                                  updateTotalFee();
                                });
                                print("Inquiry for $hours hours");
                              },
                              icon: Icon(Icons.add),
                              color: Colors.green,
                              iconSize: 30,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // Placeholder action for the inquiry button
                        //     print("Inquiry for $hours hours");
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //   ),
                        //   child: Text(
                        //     'استفسار',
                        //     style: TextStyle(fontSize: 18),
                        //   ),
                        // ),
                        SizedBox(height: 20),
                        // Total Fee Display
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: ColorManager.green,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Text(
                              '${AppStrings.total} : $totalFee',
                            style:  getFirstMediumStyle(color: ColorManager.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
