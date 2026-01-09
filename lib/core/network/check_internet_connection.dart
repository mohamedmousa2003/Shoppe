// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
//
// class CheckInternetConnection {
//   final Connectivity _connectivity = Connectivity();
//
//   // للتحقق الفوري من حالة الإنترنت الحالية
//   Future<bool> isConnected() async {
//     final result = await _connectivity.checkConnectivity();
//     return _isOnline(result);
//   }
//
//   // Stream لمراقبة تغييرات الاتصال بالإنترنت
//   Stream<bool> get onConnectivityChanged {
//     return _connectivity.onConnectivityChanged.map(_isOnline);
//   }
//
//   // تحويل ConnectivityResult إلى bool
//   bool _isOnline(ConnectivityResult result) {
//     switch (result) {
//       case ConnectivityResult.mobile:
//       case ConnectivityResult.wifi:
//         return true;
//       case ConnectivityResult.none:
//       default:
//         return false;
//     }
//   }
// }
