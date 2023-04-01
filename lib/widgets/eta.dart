import 'package:flutter/material.dart';
import 'package:geo_app/utils/device.utils.dart';
import 'package:geo_app/variants/variants.dart';

import '../utils/time.utils.dart';

class ETA extends StatelessWidget {
  final String locationName;
  final double timeSpentInSec;
  final double distanceInMeter;

  const ETA({super.key, required this.locationName, required this.timeSpentInSec, required this.distanceInMeter});

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
              child: Image.asset(
                Drawables.location,
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
