import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myplus/myplus.dart';

class P3 extends StatefulWidget {
  P3(this.name, {Key? key}) : super(key: key);
  String name = '';

  @override
  State<P3> createState() => _P3State();
}

class _P3State extends State<P3> {
  StreamController<String> ss = StreamController();
  @override
  void dispose() {
    ss.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        StreamBuilder(
            stream: ss.stream,
            initialData: '---',
            builder: (context, snapshot) {
              return Text((Trees().corePageViewClassData[widget.name]) == null ? "" : (Trees().corePageViewClassData[widget.name]).myTitle);
            }),
        SizedBox(
          width: 50,
        ),
        OutlinedButton.icon(onPressed: ff, icon: Icon(Icons.abc), label: Text('测试持久化value')),
      ],
    ));
  }

  void ff() {
    (Trees().corePageViewClassData[widget.name]).myTitle = '值:' + (Trees().corePageViewClassData[widget.name]).i.toString() + '';
    ss.add((Trees().corePageViewClassData[widget.name]).myTitle);

    (Trees().corePageViewClassData[widget.name]).i++;
  }
}
