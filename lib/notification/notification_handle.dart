import 'dart:io';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification/notification/local_notification_manager.dart';
import 'package:notification/notification/notification_page.dart';



class HandleNotifications {

  /// 8
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static String defaultTopic = 'general';

  ///8. Ways of sending notifications
  static Future<void> notificationMethods() async {
    /// 8.1 Token Based
    tokenWiseNotification();

    /**
     * Method 2 : Topic Based
     * */
    subscribeToTopic(topicName: defaultTopic);

  }

  /// 8.1
  static void tokenWiseNotification() {
    /**
     *   Method 1 : Token Based
     */

    /// For IOS
    if (Platform.isIOS) {
      firebaseMessaging.getAPNSToken().then((String? token) => {
        /// Token For IOS is in the token variable
      });
    }

    /// FCM  For Android
    firebaseMessaging.getToken().then((String? token) {
      print("Token For Android :$token");

      /**
       * Send this token to Backend server to receive notification token wise
       * It is used to  target specific devices for receiving notifications.
       * */

      /** Note the token gets update
       * The token is typically updated when the app is
       * installed or
       * re-installed, or when
       * app is updated.
       * */
    });
  }

  /// 8.2
  static void subscribeToTopic({required String topicName}) {
    firebaseMessaging.subscribeToTopic(topicName);
  }

  /// 8.3
  static void unSubscribeToTopic({required String topicName}) {
    firebaseMessaging.unsubscribeFromTopic(topicName);
  }

  /// 9
  static Future handleNotifications(context) async {

    ///  Works When App is in Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {

      /// 12
      if (message?.notification != null) {
        LocalNotificationManager.createNDisplayNotification(message);
      }


    });


    /// App is in Background and But not terminated

    /**
     * When an app is in the background and a notification is received,
     * the notification is handled by the system tray (also known as the notification drawer)
     * of the device's operating system.
     * */
    FirebaseMessaging.onMessageOpenedApp.listen((event) {


      Navigator.push(context , MaterialPageRoute(builder: (context) => const NotificationPage()));
    });


    /// App is terminated
    FirebaseMessaging.instance.getInitialMessage().then((value) => {});

  }

  /// 10
  /// Register the background message handler in your HandleNotifications class
  static void registerBackgroundMessageHandler() {
    FirebaseMessaging.onBackgroundMessage(backgroundMsgHandler);
  }

  /// Handling Background Messages
  @pragma('vm:entry-point')
  static Future backgroundMsgHandler(RemoteMessage? remoteMessage) async {
    // print(remoteMessage?.data.toString());
    // print(remoteMessage?.notification!.title!);
  }


/// 11 Configure Android Manifest File


}


///  Link to Flutter Notification Document
///  : https://firebase.google.com/docs/cloud-messaging/flutter/first-message
///