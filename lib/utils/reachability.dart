import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Reachability extends Object {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;

  // current network status
  String _connectStatus = 'Unknown';

  String get connectStatus => _connectStatus;

  //Constant for check network status
  static const String _connectivityMobile = "ConnectivityResult.mobile";
  static const String _connectivityWifi = "ConnectivityResult.wifi";
  static const String _connectivityVpn = "ConnectivityResult.vpn";

  factory Reachability() {
    return _singleton;
  }

  static final Reachability _singleton = Reachability._internal();
  static final Reachability instance = _singleton;

  Reachability._internal() {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectStatus = result.toString();
      debugPrint("ConnectionStatus :: = $_connectStatus");
    });
  }

  dispose() {
    connectivitySubscription?.cancel();
  }

  // check for network available
  bool isInterNetAvailable() {
    debugPrint("ConnectionStatus :: => $_connectStatus");
    return (_connectStatus == Reachability._connectivityMobile) ||
        (_connectStatus == Reachability._connectivityWifi) ||
        (_connectStatus == Reachability._connectivityVpn);
  }
}
