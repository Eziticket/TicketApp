// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, camel_case_types, file_names

import 'package:backend/buyTicket.dart';
import 'package:backend/settingsItems/complains.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settingsItems/settings.dart';
import 'buyTicket.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: Profile()),
  );
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<itemSettings> menuItem1 = [
    itemSettings(text: 'settings', icon: CupertinoIcons.settings)
  ];
  final List<itemComplains> menuItem2 = [
    itemComplains(text1: 'complaints', icon1: CupertinoIcons.pen)
  ];
  final List<itemLogout> menuItem3 = [
    itemLogout(text2: 'log out', icon2: Icons.logout)
  ];
  final List<infolist> Accountinfo = [
    infolist(
      color: Colors.red,
      title: 'Contact Us',
      trailiangicon: CupertinoIcons.forward,
      notification: CupertinoIcons.phone_solid,
    ),
    infolist(
      notification: CupertinoIcons.bookmark,
      color: Colors.red,
      title: 'Bookmark Ticket Page',
      trailiangicon: CupertinoIcons.forward,
    ),
    infolist(
      notification: Icons.credit_card,
      color: Colors.red,
      title: 'Transaction history',
      trailiangicon: CupertinoIcons.forward,
    ),
    infolist(
        notification: CupertinoIcons.profile_circled,
        color: Colors.red,
        title: 'Edit Profile',
        trailiangicon: CupertinoIcons.forward),
    infolist(
        notification: CupertinoIcons.star,
        color: Colors.red,
        title: 'Rate Us',
        trailiangicon: CupertinoIcons.forward),
  ];
  final List<infolist1> notificationinfo = [
    infolist1(
      notification1: CupertinoIcons.bell,
      color1: Colors.red,
      title1: 'Notification',
      trailingicon1: CupertinoIcons.forward,
    )
  ];
  final List<infolist2> Otherinfo = [
   // infolist2(
    //   notification2: Icons.history,
    //   title2: 'Order History',
    //   trailiangicon2: CupertinoIcons.forward,
    // ),
    infolist2(
      notification2: CupertinoIcons.location,
      title2: 'Privacy Policy',
      trailiangicon2: CupertinoIcons.forward,
    ),
    infolist2(
        notification2: Icons.logout,
        title2: 'Logout',
        trailiangicon2: CupertinoIcons.forward)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff438A5E),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CupertinoColors.white,
        toolbarHeight: 100,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          'MyProfile',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              color: CupertinoColors.black),
        ),
        actions: [
          PopupMenuButton<int>(
              icon: const Icon(
                Icons.menu,
                color: CupertinoColors.black,
              ),
              onSelected: (Item) => OnSelcted(context, Item),
              itemBuilder: (context) => [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: const [
                            Icon(CupertinoIcons.settings,
                                color: CupertinoColors.systemGrey2),
                            SizedBox(width: 10),
                            Text('Settings'),
                          ],
                        )),
                    PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: const [
                            Icon(CupertinoIcons.pen,
                                color: CupertinoColors.systemGrey2),
                            SizedBox(width: 10),
                            Text('Complains'),
                          ],
                        )),
                    const PopupMenuDivider(),
                    PopupMenuItem<int>(
                        value: 2,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.logout,
                              color: CupertinoColors.systemRed,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Log Out',
                              style:
                                  TextStyle(color: CupertinoColors.systemRed),
                            ),
                          ],
                        ))
                  ])
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Column(children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMlMD04BhdInujJMPpKegoDXrO2kqvkCn7Lg&usqp=CAU"),
                    radius: 30,
                  ),
                  title: Text("Nana Akufo-Addo", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                  
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Text(
                        'Account',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ...Accountinfo.map(getaccountdetails).toList(),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Text(
                        'Notification',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ...notificationinfo.map(getnotificationdetails).toList(),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Text(
                        'Other',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ...Otherinfo.map(getotherdetails).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getaccountdetails(infolist Accountinfo) => Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: ListTile(
            leading: Icon(
              Accountinfo.notification,
              color: Colors.red,
            ),
            title: Text(Accountinfo.title),
            trailing: IconButton(
                hoverColor: Colors.green.shade400,
                onPressed: () {},
                icon: Icon(Accountinfo.trailiangicon))),
      );

  getnotificationdetails(infolist1 notificationinfo) => Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                notificationinfo.notification1,
                color: Colors.red,
              ),
            ),
            title: Text(notificationinfo.title1),
            trailing: IconButton(
                splashColor: Colors.green.shade400,
                onPressed: () {},
                icon: Icon(notificationinfo.trailingicon1))),
      );
  getotherdetails(infolist2 Otherinfo) => ListTile(
      leading: TextButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const BuyTicket())),
        child: Icon(
          Otherinfo.notification2,
          color: Colors.red,
        ),
      ),
      title: Text(Otherinfo.title2),
      trailing: IconButton(
          hoverColor: Colors.green.shade400,
          onPressed: () {},
          icon: Icon(Otherinfo.trailiangicon2)));

  PopUpMenuItem<buildmenuItem1>(itemSettings menuItem1) => ListTile(
        leading: Text(menuItem1.text),
        title: Icon(menuItem1.icon),
      );
  buildmenuItem2(itemComplains menuItem2) => ListTile(
        leading: Text(menuItem2.text1),
        title: Icon(menuItem2.icon1),
      );
  buildmenuItem3(itemLogout menuItem3) => ListTile(
        leading: Text(menuItem3.text2),
        title: Icon(menuItem3.icon2),
      );

  void OnSelcted(BuildContext, int Item) {
    switch (Item) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const settingsScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const complainsScreen()));
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BuyTicket()),
            (route) => false);
    }
  }
}

class itemSettings {
  String text;
  IconData icon;
  itemSettings({required this.text, required this.icon});
}

class itemComplains {
  String text1;
  IconData icon1;
  itemComplains({required this.text1, required this.icon1});
}

class itemLogout {
  String text2;
  IconData icon2;
  itemLogout({required this.text2, required this.icon2});
}

class infolist {
  String title;
  dynamic color;
  IconData notification;
  IconData trailiangicon;
  void getAge() {}

  infolist(
      {required this.title,
      required this.notification,
      required this.color,
      this.trailiangicon = Icons.forward});
}

class infolist1 {
  String title1;
  dynamic color1;
  IconData notification1;
  IconData trailingicon1;
  infolist1(
      {required this.title1,
      required this.notification1,
      required this.color1,
      this.trailingicon1 = Icons.forward});
}

class infolist2 {
  String title2;
  IconData notification2;
  IconData trailiangicon2;
  infolist2(
      {required this.title2,
      required this.notification2,
      this.trailiangicon2 = Icons.forward});
}
