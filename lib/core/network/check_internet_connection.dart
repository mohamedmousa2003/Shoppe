import 'package:connectivity_plus/connectivity_plus.dart';

/// A utility class to check internet connectivity.
class NetworkUtils {
  NetworkUtils._(); // Private constructor to prevent instantiation

  static Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    // Mobile or Wifi means there is internet
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    // No internet
    return false;
  }
}
