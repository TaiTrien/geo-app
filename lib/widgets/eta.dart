import 'package:flutter/material.dart';
import 'package:geo_app/utils/device.utils.dart';

import '../utils/time.utils.dart';

class ETA extends StatelessWidget {
  final String locationName;
  final double timeSpentInSec;
  final double distanceInMeter;

  const ETA({super.key, required this.locationName, required this.timeSpentInSec, required this.distanceInMeter});
  final String tempImgUrl =
      "https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: DeviceUtils.deviceHeight(context) * 0.6,
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                tempImgUrl,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "📍$locationName",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "⏰${TimeUtils.getTimeString(Duration(seconds: timeSpentInSec.toInt()))}",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    "🛣️${(distanceInMeter / 1000).toStringAsFixed(2)}km",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
