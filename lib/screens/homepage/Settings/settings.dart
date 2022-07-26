import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:share_plus/share_plus.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/screens/homepage/Settings/SettingWidgets/iconwidgets.dart';
import 'package:walletx/screens/homepage/Settings/SettingWidgets/notifications.dart';
import 'package:walletx/screens/homepage/screenhome.dart';
import 'package:walletx/screens/splash/splashscreen.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  TimeOfDay currentTime = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    NotificationApi.init(initScheduled: true);
    listenNotifications();
    // NotificationSettings().init(initScheduled: true);
  }

  void listenNotifications() => NotificationApi.onNotifications;

  // void listenNotifications() {
  //   NotificationSettings.onNotification.listen(onClickNotifications);
  // }

  onClickNotifications(String? payload) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ScreenHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(color: primaryTextColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: primaryIconColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          final deffent = DateTime.now().difference(pressedtime);
          final isExit = deffent >= const Duration(seconds: 2);
          pressedtime = DateTime.now();

          if (isExit) {
            exitsnackbar();
            return false;
          } else {
            return true;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Card(
                color: Colors.grey[700],
                child: ListTile(
                  leading: const IconWidget(
                      color: Colors.amberAccent, icon: Icons.notifications),
                  title: const Text('Set Reminder',
                      style: TextStyle(color: primaryTextColor)),
                  trailing: const Icon(Icons.keyboard_arrow_right,
                      color: primaryIconColor),
                  onTap: () {
                    timePicking(context);
                    // timePicking(context: context);
                    // NotificationSettings.showNotification(
                    //     title: 'WalletX',
                    //     body: 'You have a transaction',
                    //     payload: 'payload',
                    //     scheduleTime: timePicking(context: context).pickedTime);
                  },
                  onLongPress: () {
                    showCancelReminder(context);
                  },
                ),
              ),
              Card(
                color: Colors.grey[700],
                child: ListTile(
                  leading: const IconWidget(
                      color: Colors.redAccent, icon: Icons.delete),
                  title: const Text('Reset App',
                      style: TextStyle(color: primaryTextColor)),
                  onTap: () {
                    showReset(context);
                  },
                ),
              ),
              Card(
                color: Colors.grey[700],
                // child: const AboutListTile(
                //   icon: IconWidget(color: Colors.greenAccent, icon: Icons.info),
                //   applicationName: 'WalletX',
                //   applicationVersion: 'version 1.0.0',
                //   applicationLegalese: '© 2020',
                //   aboutBoxChildren: [
                //     Text('This is a simple app to help you manage your money.'),
                //   ],
                // ),
                child: ListTile(
                  leading: const IconWidget(
                      color: Colors.greenAccent, icon: Icons.info),
                  title: const Text('About App',
                      style: TextStyle(color: primaryTextColor)),
                  onTap: () {
                    showAbout();
                  },
                ),
              ),
              Card(
                color: Colors.grey[700],
                child: ListTile(
                  leading:
                      const IconWidget(color: Colors.green, icon: Icons.share),
                  title: const Text('Share App',
                      style: TextStyle(color: primaryTextColor)),
                  onTap: () async {
                    await Share.share('text');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showReset(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Reset App'),
            content: const Text('Are you sure you want to reset the app?'),
            actions: [
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('Reset'),
                onPressed: () async {
                  TransactionDB.instance.resetApp();

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const ScreenSplash()),
                      (route) => false);
                },
              ),
            ],
          );
        });
  }

  DateTime pressedtime = DateTime.now();
  exitsnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        content: Text(" Press back again to exit ")));
  }

  // timePicking({required context}) async {
  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     initialEntryMode: TimePickerEntryMode.dial,
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  // }

  showCancelReminder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancel Reminder'),
          content: const Text('Did You want to cancel the reminder?'),
          actions: [
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                NotificationApi.cancelNotification();
                Navigator.pop(context);
                // NotificationApi.showScheduledNotification(
                //   title: 'Walletx',
                //   body: 'Time to Add Transaction',
                //   payload: 'Transaction',
                //   scheduledDate:
                //       DateTime.now().add(const Duration(seconds: 12)),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  showAbout() {
    showAboutDialog(
        context: context,
        applicationIcon: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/lottie/images/logoapp.png'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            )),
        applicationName: 'WalletX',
        applicationVersion: 'version 1.0.0',
        applicationLegalese: '© 2020',
        children: [
          const Text('This is a simple app to help you manage your money.'),
        ]);
  }

  timePicking(context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != currentTime) {
      NotificationApi.showScheduledNotification(
          title: 'WalletX',
          body: "Don't Forget to add your Transaction",
          scheduledDate: Time(pickedTime.hour, pickedTime.minute));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          content: Text(
            'Successfully set reminder for  ${pickedTime.hour > 12 ? pickedTime.hour - 12 : pickedTime.hour} : ${pickedTime.minute < 10 ? '0${pickedTime.minute}' : pickedTime.minute} ${pickedTime.hour < 12 ? 'AM' : 'PM'}',
            style: const TextStyle(color: primaryTextColor),
          ),
          backgroundColor: appBarColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
