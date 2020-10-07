import 'package:analog_clock/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'clock.dart';
import 'country_card.dart';
import 'time_in_hour_and_minute.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Text(
              "Kathmandu, Nepal",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TimeInHourAndMinute(),
            Spacer(),
            Clock(),
            Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  CountryCard(
                    country: "New York, USA",
                    timeZone: "+3 HRS | EST",
                    iconSrc: "assets/icons/Liberty.svg",
                    url: "America/New_York",
                    period: "PM",
                  ),
                  CountryCard(
                    country: "Sydney, AU",
                    timeZone: "+19 HRS | AEST",
                    iconSrc: "assets/icons/Sydney.svg",
                    url: "Australia/Sydney",
                    period: "AM",
                  ),
                  CountryCard(
                    country: "Paris, France",
                    timeZone: "+3 HRS | EST",
                    iconSrc: "assets/icons/paris.svg",
                    url: "Europe/Paris",
                    period: "PM",
                  ),
                  CountryCard(
                    country: "London, England",
                    timeZone: "+19 HRS | AEST",
                    iconSrc: "assets/icons/london-bridge.svg",
                    url: "Europe/London",
                    period: "AM",
                  ),
                  CountryCard(
                    country: "Dubai, UAE",
                    timeZone: "+19 HRS | AEST",
                    iconSrc: "assets/icons/dubai.svg",
                    url: "Asia/Dubai",
                    period: "AM",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


