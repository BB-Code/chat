import 'package:chat/chart/message_page.dart';
import 'package:chat/contacts/contacts.dart';
import 'package:chat/personal/personal.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentIndex = 0;

  //聊天页面
  MessagePage message;
  //好友界面
  ContactsPage contacts;
  //我的界面
  Personal me;

  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = new ContactsPage();
        }
        return contacts;
      case 2:
        if (me == null) {
          me = new Personal();
        }
        return me;
      default:
    }
  }

  //菜单项
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          //使用图片路劲还是图标
          imagePath != null
              ? Image.asset(imagePath, width: 32.0, height: 32.0)
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(icon, color: Colors.white)),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(title, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('即时通讯'),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'search');
              },
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 20.0),
              child: GestureDetector(
                  onTap: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(500.0, 74.0, 10.0, 0.0),
                      items: <PopupMenuEntry>[
                        _popupMenuItem('发起会话',
                            imagePath: 'images/icon_menu_group.png'),
                        _popupMenuItem('添加好友',
                            imagePath: 'images/icon_menu_addfriend.png'),
                        _popupMenuItem('联系客服', icon: Icons.person),
                      ],
                    );
                  },
                  child: Icon(Icons.add)),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                title: Text('聊天',
                    style: TextStyle(
                        color: _currentIndex == 0
                            ? Color(0xFF46c01b)
                            : Color(0xff999999))),
                icon: _currentIndex == 0
                    ? Image.asset('images/message_pressed.png',
                        width: 32.0, height: 32.0)
                    : Image.asset('images/message_normal.png',
                        width: 32.0, height: 32.0)),
            BottomNavigationBarItem(
                title: Text('好友',
                    style: TextStyle(
                        color: _currentIndex == 1
                            ? Color(0xFF46c01b)
                            : Color(0xff999999))),
                icon: _currentIndex == 1
                    ? Image.asset('images/contact_list_pressed.png',
                        width: 32.0, height: 32.0)
                    : Image.asset('images/contact_list_normal.png',
                        width: 32.0, height: 32.0)),
            BottomNavigationBarItem(
                title: Text('我的',
                    style: TextStyle(
                        color: _currentIndex == 2
                            ? Color(0xFF46c01b)
                            : Color(0xff999999))),
                icon: _currentIndex == 2
                    ? Image.asset('images/profile_pressed.png',
                        width: 32.0, height: 32.0)
                    : Image.asset('images/profile_normal.png',
                        width: 32.0, height: 32.0))
          ],
        ),
        body: currentPage());
  }
}
