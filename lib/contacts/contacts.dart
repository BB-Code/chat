import 'package:chat/contacts/contact_header.dart';
import 'package:chat/contacts/contact_item.dart';
import 'package:chat/contacts/contact_sider_list.dart';
import 'package:chat/contacts/contact_vo.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContactSiderList(
      items: contactData,
      headerBuilder: (BuildContext context, int index) {
        return Container(child: ContactHeader());
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(item: contactData[index]));
      },
      sectionBuilder: (BuildContext context, int index) {
        return Container(
            height: 32.0,
            padding: EdgeInsets.only(left: 14.0),
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            child: Text(contactData[index].seationKey,
                style: TextStyle(fontSize: 14.0, color: Color(0xff909090))));
      },
    ));
  }
}
