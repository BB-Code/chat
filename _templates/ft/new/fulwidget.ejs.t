---
to: ./lib/<%= folder %>/<%= name %>.dart
---
import 'package:flutter/material.dart';

class <%= appname %> extends StatefulWidget {
  @override
  _<%= appname %>State createState() => _<%= appname %>State();
}

class _<%= appname %>State extends State<<%= appname %>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}


