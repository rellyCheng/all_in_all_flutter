import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/taurus_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';

/// 弹出圆圈样式页面
class Explore extends StatefulWidget {
  @override
  _Explore createState() => _Explore();
}

class _Explore extends State<Explore> {
  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["11", "22", "33", "44", "55", "66", "77", "88", "99", "00"];
  List<String> str1 = ["11", "22", "33", "44", "55", "66", "77", "88", "99", "00"];
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: new EasyRefresh(
        key: _easyRefreshKey,
        refreshHeader: TaurusHeader(
          key: _headerKey,
        ),
        refreshFooter: BezierBounceFooter(
          key: _footerKey,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: new ListView.builder(
            //ListView的Item
            itemCount: str.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  height: 70.0,
                  child: Card(
                    child: new Center(
                      child: new Text(
                        str[index],
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ));
            }),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              str.clear();
              str.addAll(addStr);
            });
          });
        },
        loadMore: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            if (str.length < 20) {
              setState(() {
                str.addAll(addStr);
              });
            }
          });
        },
      )),
    );
  }
}