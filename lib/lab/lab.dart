  
                    // ValueListenableBuilder(
                    //   valueListenable: visibleMonth,
                    //   builder: (BuildContext context, bool value, Widget? _) {
                    //     return Visibility(
                    //       visible: value,
                    //       child: TextButton(
                    //           onPressed: () {
                    //             pickDate(
                    //               context,
                    //               'en',
                    //             );
                    //           },
                    //           child: Text(
                    //               DateFormat('MMMM').format(selectedMonth))),
                    //     );
                    //   },
                    // ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     Icons.calendar_month,
                    //     color: Colors.white,

                    //   ),

                    // GestureDetector(
                    //   onTap: () {
                    //     selectMonth(context, 'en');
                    //   },
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     width: width / 2.5,
                    //     height: height / 15,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: Colors.white60,
                    //     ),
                    //     child: const FittedBox(child: Text('data')),
                    //   ),
                    // ),




                 // Expanded(
                //     child: ValueListenableBuilder(
                //         valueListenable: valueChecking(context),
                //         builder: (BuildContext context,
                //             List<TransactionModel> newList, Widget? _) {
                //           return newList.isEmpty
                //               ? const Center(
                //                   child: Text('No Transaction Found',
                //                       style: TextStyle(
                //                           color: primaryTextColor,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 20)),
                //                 )
                //               : ListView.builder(
                //                   physics: const BouncingScrollPhysics(),
                //                   shrinkWrap: true,
                //                   itemCount: newList.length,
                //                   itemBuilder:
                //                       (BuildContext context, int index) {
                //                     final newValue = newList[index];
                //                     return Slidable(
                //                         endActionPane: ActionPane(
                //                           motion: const ScrollMotion(),
                //                           children: [
                //                             SlidableAction(
                //                               onPressed: (context) {
                //                                 showDialog(
                //                                   context: context,
                //                                   builder: (context) {
                //                                     return AlertDialog(
                //                                       title: const Text(
                //                                           "Do you want to delete?"),
                //                                       actions: [
                //                                         Row(
                //                                           mainAxisAlignment:
                //                                               MainAxisAlignment
                //                                                   .end,
                //                                           children: [
                //                                             TextButton(
                //                                                 onPressed: () {
                //                                                   TransactionDB
                //                                                       .instance
                //                                                       .deleteTransaction(
                //                                                           newValue
                //                                                               .id
                //                                                               .toString());
                //                                                   Navigator.of(
                //                                                           context)
                //                                                       .pop();
                //                                                 },
                //                                                 child:
                //                                                     const Text(
                //                                                         "Yes")),
                //                                             const SizedBox(
                //                                               width: 30,
                //                                             ),
                //                                             TextButton(
                //                                               onPressed: () {
                //                                                 Navigator.of(
                //                                                         context)
                //                                                     .pop();
                //                                               },
                //                                               child: const Text(
                //                                                   "No"),
                //                                             ),
                //                                           ],
                //                                         ),
                //                                       ],
                //                                     );
                //                                   },
                //                                 );
                //                               },
                //                               backgroundColor:
                //                                   const Color.fromARGB(
                //                                       255, 255, 255, 255),
                //                               foregroundColor:
                //                                   const Color.fromARGB(
                //                                       255, 175, 2, 2),
                //                               icon: Icons.delete,
                //                               label: 'Delete',
                //                             ),
                //                             SlidableAction(
                //                               onPressed:
                //                                   (BuildContext context) {
                //                                 Navigator.of(context).push(
                //                                   MaterialPageRoute(
                //                                     builder: (context) =>
                //                                         ScreenUpdate(
                //                                       data: newValue,
                //                                     ),
                //                                   ),
                //                                 );
                //                               },
                //                               backgroundColor:
                //                                   const Color.fromARGB(
                //                                       255, 255, 255, 255),
                //                               foregroundColor:
                //                                   const Color.fromARGB(
                //                                       255, 38, 157, 2),
                //                               icon: Icons.edit,
                //                               label: 'Edit',
                //                             ),
                //                           ],
                //                         ),
                //                         child: Card(
                //                           color: secondColor,
                //                           child: ListTile(
                //                             leading: CircleAvatar(
                //                               backgroundColor:
                //                                   newValue.incomeOrExpense ==
                //                                           'Income'
                //                                       ? incomeColor
                //                                       : expenseColor,
                //                               child: Icon(
                //                                 newValue.incomeOrExpense ==
                //                                         'Income'
                //                                     ? Icons.trending_up
                //                                     : Icons.trending_down,
                //                               ),
                //                             ),
                //                             title: TextWidgets(
                //                               text: newValue.categoryName,
                //                               textcolor: primaryTextColor,
                //                               textsize: 20,
                //                               textFontWeight: FontWeight.bold,
                //                             ),
                //                             subtitle: TextWidgets(
                //                               text: DateFormat.MMMMd().format(
                //                                   newValue.selectedDate),
                //                               textcolor: primaryTextColor,
                //                             ),
                //                             trailing: Column(
                //                               children: [
                //                                 TextWidgets(
                //                                   text: newValue.amount
                //                                       .toString(),
                //                                   textcolor:
                //                                       newValue.incomeOrExpense ==
                //                                               'Income'
                //                                           ? incomeColor
                //                                           : expenseColor,
                //                                   textFontWeight:
                //                                       FontWeight.bold,
                //                                   textsize: 20,
                //                                 ),
                //                                 TextWidgets(
                //                                   text: newValue.note,
                //                                   textcolor: primaryTextColor,
                //                                   textFontWeight:
                //                                       FontWeight.bold,
                //                                   textsize: 15,
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ));
                //                   },
                //                 );
                //         })), 
 
 
 
 
 
 
    // ValueNotifier<List<TransactionModel>> valueChecking(context) {
  //   visibleMonth.value = false;
  //   if (dropDownVlaue == 'Today') {
  //     return TransactionDB.instance.todayTransactionList;
  //   } else if (dropDownVlaue == 'Yesterday') {
  //     return TransactionDB.instance.yesterdayTransactionList;
  //   } else if (dropDownVlaue == 'Monthly') {
  //     visibleMonth.value = true;
  //     return TransactionDB.instance.monthlyTransactionList;
  //     // } else if (dropDownVlaue == 'Select Month') {
  //     //   visibleMonth.value = true;
  //     //   return TransactionDB.instance.monthlyTransactionList;
  //   } else {
  //     return TransactionDB.instance.transactionListNotifierNew;
  //   }
  // }
  // pickDate(context, String? locale) async {
  //   final localeObj = locale != null ? Locale(locale) : const Locale('en');
  //   final selected = await showMonthYearPicker(
  //       context: context,
  //       initialDate: selectedMonth,
  //       firstDate: DateTime(2021),
  //       lastDate: DateTime.now(),
  //       locale: localeObj);
  //   setState(() {
  //     selectedMonth = selected ?? DateTime.now();
  //   });
  //   updateData();
  // }

  // updateData() async {
  //   Future.forEach(
  //     TransactionDB.instance.transactionListNotifierNew.value,
  //     (TransactionModel model) {
  //       if (model.selectedDate.month == selectedMonth.month &&
  //           model.selectedDate.year == selectedMonth.year) {
  //         TransactionDB.instance.monthlyTransactionList.value.add(model);
  //       }
  //     },
  //   );
  // }

  // String parseDate(DateTime date) {
  //   final datefrmt = DateFormat.MMMd().format(date);
  //   final splitDate = datefrmt.split(' ');
  //   return '${splitDate.last}\n${splitDate.first}';
  // }

  // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotificationSettings {
//   static final _notifications = FlutterLocalNotificationsPlugin();
//   static final onNotification = BehaviorSubject<String?>();
//   dynamic locationName;

//   Future init({bool initScheduled = false}) async {
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const settings = InitializationSettings(android: android);
//     _notifications.initialize(settings, onSelectNotification: (payload) {
//       onNotification.add(payload);
//     });
//     if (initScheduled) {
//       tz.initializeTimeZones();
//       locationName = await FlutterNativeTimezone.getLocalTimezone();
//       tz.setLocalLocation(tz.getLocation(locationName));
//     }
//   }

//   static Future _notificationDetails() async {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel Id',
//         'channel Name',
//         importance: Importance.max,
//         playSound: true,
//         enableVibration: true,
//       ),
//     );
//   }

//   static Future showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//     required Time scheduleTime,
//   }) async {
//     return _notifications.zonedSchedule(id, title, body,
//         _scheduledDaily(scheduleTime), await _notificationDetails(),
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         androidAllowWhileIdle: true,
//         matchDateTimeComponents: DateTimeComponents.time);
//   }

//   static tz.TZDateTime _scheduledDaily(Time time) {
//     final now = tz.TZDateTime.now(tz.local)
//         .add(Duration(hours: time.hour, minutes: time.minute, seconds: 0));
//     final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
//         time.hour, time.minute, time.second);
//     return scheduledDate.isBefore(now)
//         ? scheduledDate.add(const Duration(days: 1))
//         : scheduledDate;
//   }
// }
