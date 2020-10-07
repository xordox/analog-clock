import 'package:analog_clock/services/world_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';

class CountryCard extends StatefulWidget {
  final String country, timeZone, iconSrc, url, period;

   CountryCard({
    Key key,
    @required this.country,
    @required this.timeZone,
    @required this.iconSrc,
    @required this.url,
    @required this.period,
  }) : super(key: key);

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  String _time ="loading";


  void setupWorldTime() async{
    WorldTime instance = WorldTime( url:widget.url);
    await instance.getTime();
    print(instance.time);
    setState(() {
      _time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  widget.country,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: getProportionateScreenWidth(16)),
                ),
                SizedBox(height: 5),
                Text(widget.timeZone),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      widget.iconSrc,
                      width: getProportionateScreenWidth(40),
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                    Spacer(),
                    Text(
                      _time,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    /*RotatedBox(
                      quarterTurns: 3,
                      child: Text(widget.period),
                    ),*/
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}