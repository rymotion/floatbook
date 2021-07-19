import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  RELEASE
}

class Config {

  static Flavor appFlavor;

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return 'RELEASE';
      case Flavor.DEV:
      default:
        return 'DEVELOPMENT';
    }
  }

  static Icon get helloIcon {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return new Icon(Icons.new_releases);
      case Flavor.DEV:
      default:
        return new Icon(Icons.developer_mode);
    }
  }
}