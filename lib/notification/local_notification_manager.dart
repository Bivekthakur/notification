
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationManager {

  /// 5.b.a
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  /// 7.a
  static NotificationDetails notificationDetails = const NotificationDetails();

  static String channelID = 'general';
  static String channelName = 'General';
  static String channelDescription =
      'Notifications from the Firebase Flutter';

  ///2. Notification Initializing
  static void initialize(){

    ///3. Requesting Permission
    requestPermission();

    ///4 Initialize Platform
    initializePlatform();

  }

  ///4
  static void initializePlatform(){

    /// 4.a Initialing Android and IOS Settings
    InitializationSettings initializationSettings = const InitializationSettings(
      /// 4.b Give the name of icon in android
      android: AndroidInitializationSettings("drawable/logo"),
      /// 4. c
      // iOS:
    );

    /// iii iOS Initialization

    /// 4.d
    _notificationsPlugin.initialize(initializationSettings);


    /// 5. Add Notification Details
    getNotificationDetails(null);
  }


  ///3. Requesting Permission
  static void requestPermission() {
    /// 3.a
    if(Platform.isIOS){
      requestIOSPermission();
    }
    /// 3.b
    else if(Platform.isAndroid){
      requestAndroidPermission();
    }
  }

  ///3.a TODO Request IOS permission
  static void requestIOSPermission() {}

  /// 3.b
  static Future<void> requestAndroidPermission() async {
    /// This code is giving the android sdk version
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    int? sdkInt = androidInfo.version.sdkInt;
    /**
     * flutter_local_notifications handles permissions for notifications
     * when sdk>=33
     */
    if (sdkInt >= 33) {
      _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    /** On Android devices with an SDK level less than 33 (Android 12) by
     * requesting the necessary permissions automatically when you use the
     * show method to display a notification.
     */

  }


  /// 5
  /// RemoteMessage: Model for our Notifications
  static Future<NotificationDetails> getNotificationDetails(RemoteMessage? message) async {
    ///7.a
    notificationDetails = NotificationDetails(
        android: await androidNotificationDetails(message)
      // iOS: iod
    );
    return notificationDetails;
  }

  /// 7.b
  ///

  static Future<AndroidNotificationDetails> androidNotificationDetails(RemoteMessage?  message) async {

    String imageUrl = message?.notification?.android?.imageUrl ?? '';
    // String soundFileName = message?.notification?.android?.sound ?? '';
    final String? imageData = await fetchImage(imageUrl);
    return AndroidNotificationDetails(
      //Channel ID,
        channelID,
        // Channel Name
        channelName,
        channelDescription: channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        fullScreenIntent: true,
        playSound: true,
        /*TODO For Sound in Notifications*/
        // sound: RawResourceAndroidNotificationSound(soundFileName),
        icon: 'drawable/logo',
        channelAction: AndroidNotificationChannelAction.createIfNotExists,
        styleInformation: BigPictureStyleInformation(
            ByteArrayAndroidBitmap.fromBase64String(imageData ?? ''))


    );
  }



  ///13
  static Future<void> createNDisplayNotification(RemoteMessage? message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      await _notificationsPlugin.show(
        id,
        message?.notification?.title ?? '',
        message?.notification?.body ?? '',
        await getNotificationDetails(message),
        // payload: message?.data['_id'],
      );
    } on Exception catch (e) {
      print("Notification  Error : $e");
    }

  }




  /// 14


  static Future<String?> fetchImage(String imageUrl) async {
    try {
      final response = await Dio().get<Uint8List>(imageUrl,
          options: Options(responseType: ResponseType.bytes));

      final base64Image = base64Encode(response.data?.toList() ?? []);
      return base64Image;
    } catch (e) {
      print('Error fetching image from the URL: $e');
      return null;
    }
  }

}