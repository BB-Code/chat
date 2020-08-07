import 'package:chat/contacts/contact_vo.dart';
import 'package:flutter/material.dart';

class ContactSiderList extends StatefulWidget {
  final List<ContactVO> items;
  //好友列表头构造器
  final IndexedWidgetBuilder headerBuilder;
  //好友列表项构造器
  final IndexedWidgetBuilder itemBuilder;
  //字母构造器
  final IndexedWidgetBuilder sectionBuilder;
  ContactSiderList(
      {Key key,
      this.items,
      this.headerBuilder,
      this.itemBuilder,
      this.sectionBuilder})
      : super(key: key);

  @override
  _ContactSiderListState createState() => _ContactSiderListState();
}

class _ContactSiderListState extends State<ContactSiderList> {
  final ScrollController _scrollController = ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  _isShowHeaderView(index) {
    if (index == 0 && widget.headerBuilder != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  bool _shouldShowHeader(int position) {
    if (position <= 0) {
      return false;
    }
    if (position != 0 &&
        widget.items[position].seationKey !=
            widget.items[position - 1].seationKey) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Stack(children: <Widget>[
        NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
                controller: _scrollController,
                //list里面的内容不足一屏时，list都可以滑动
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        _isShowHeaderView(index),
                        //控制是否显示英文字母
                        Offstage(
                            offstage: _shouldShowHeader(index),
                            child: widget.sectionBuilder(context, index)),
                        Column(
                          children: <Widget>[
                            widget.itemBuilder(context, index),
                          ],
                        )
                      ],
                    ),
                  );
                })),
      ])),
    );
  }
}
