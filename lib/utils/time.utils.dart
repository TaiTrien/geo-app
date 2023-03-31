import 'package:flutter/material.dart';

class TimeUtils {
  static String getTimeString(Duration duration) {
    int inDays = duration.inDays;
    int inHours = duration.inHours;
    int inMinutes = duration.inMinutes;
    return "${inDays}d ${inHours}h ${inMinutes}m";
  }
}
