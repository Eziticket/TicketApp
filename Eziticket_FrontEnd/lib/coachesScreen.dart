// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_unnecessary_containers, avoid_print, avoid_types_as_parameter_names, unused_field, file_names

import 'dart:html';

import 'package:backend/sortingItems.dart/date.dart';
import 'package:backend/sortingItems.dart/price.dart';
import 'package:backend/sortingItems.dart/sortsettings.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'selectSeat.dart';
// import 'package:menu_button/menu_button.dart';

class coachesScreen extends StatefulWidget {
  const coachesScreen({Key? key}) : super(key: key);

  @override
  _coachesScreenState createState() => _coachesScreenState();
}

class _coachesScreenState extends State<coachesScreen> {
  // static const laction = ['Accra', 'Kumasi', 'Takoradi', 'WaleWale'];
  // static const destination = ['Accra','Kumasi','Takoradi','WaleWale'
  // ];
  final List<busdetailmodal> busdetail = [
    busdetailmodal(location: 'Accra', title: '2MEXPRESS', destination: 'Kumasi')
  ];
  final List<busdetailmodal1> busdetail1 = [
    busdetailmodal1(location1: '8:30 AM', destination1: 'GT 185 12')
  ];
  final List<busdetailmodal2> busdetail2 = [
    busdetailmodal2(
        title2: 'Ticket price',
        subtitle2: 'GHS 60',
        destination2: 'Select Seat')
  ];
  //FOR 2ND container
  final List<SCNDbusdetails> SCNDbusdetail = [
    SCNDbusdetails(location4: 'Accra', title4: 'VIP', destination4: 'Kumasi')
  ];
  final List<SCNDbusdetails1> SCNDbusdetail1 = [
    SCNDbusdetails1(
        location5: '12:30 PM', destination5: 'WR 125 21', title5: '')
  ];
  final List<SCNDbusdetails2> SCNDbusdetail2 = [
    SCNDbusdetails2(
        subtitle6: 'GHS 40',
        title6: 'Ticket price',
        destination6: 'Select Seat')
  ];
  //FOR 3RD Container

  final List<THRDbusdetails> THRDbusdetail = [
    THRDbusdetails(location7: 'Accra', title7: 'STC', destination7: 'Kumasi')
  ];
  final List<THRDbusdetails1> THRDbusdetail1 = [
    THRDbusdetails1(location8: '1:00pm', destination8: 'KS 2212 20')
  ];
  final List<THRDbusdetails2> THRDbusdetail2 = [
    THRDbusdetails2(
        subtitle9: 'GHS 50',
        title9: 'Ticket price',
        destination9: 'Select Seat')
  ];
  final _datecontroller = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  @override
  void initState() {
    super.initState();
  }
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Coaches',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: CupertinoColors.white,
          toolbarHeight: 50,
        ),
        backgroundColor: const Color(0xff438A5E),
        body: ListView(children: [
          Container(
            color: CupertinoColors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: DatePicker(
                      DateTime.now(),
                      width: 60,
                      height: 85,
                      controller: _datecontroller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: const Color(0xff438A5E),
                      selectedTextColor: CupertinoColors.white,
                      monthTextStyle:
                          const TextStyle(color: CupertinoColors.systemRed),
                      daysCount: 356,
                      dayTextStyle: const TextStyle(color: Color(0xff91C483)),
                      inactiveDates: [
                        DateTime.now().add(const Duration(days: 3)),
                        DateTime.now().add(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 7))
                      ],
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color(0xff438A5E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: ListView(children: [
                    ListTile(
                      leading: const Text('Sort by:',
                          style: TextStyle(
                            fontSize: 18,
                            color: CupertinoColors.white,
                          )),
                      title: Align(
                        alignment: Alignment.topLeft,
                        child: PopupMenuButton<int>(
                            icon: const Padding(
                              padding: EdgeInsets.only(bottom: 1),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: CupertinoColors.white,
                                size: 30,
                              ),
                            ),
                            onSelected: (Item) => OnSelected(context, Item),
                            itemBuilder: (context) => [
                                  PopupMenuItem<int>(
                                    value: 0,
                                    child: Row(children: const [
                                      Icon(
                                        CupertinoIcons.money_dollar_circle,
                                        color: CupertinoColors.systemGrey2,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Price')
                                    ]),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Row(children: const [
                                      Icon(
                                        CupertinoIcons.calendar,
                                        color: CupertinoColors.systemGrey2,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Date')
                                    ]),
                                  ),
                                ]),
                      ),
                      trailing: IconButton(
                        icon: const Icon(CupertinoIcons.settings_solid,
                            color: CupertinoColors.white),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const sortingSettingsScreen())),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 10),
                      child: Text('12 Buses Available Accra to Kumasi',
                          style: TextStyle(
                            fontSize: 18,
                            color: CupertinoColors.white,
                          )),
                    ),

                    //FIRST CONTAINER
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        height: 335,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            color: CupertinoColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Expanded(
                          child: ListView(
                            children: [
                              ...busdetail.map(buildCoaches).toList(),
                              const ListTile(
                                leading: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Text(
                                    'Depart',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: CupertinoColors.systemGrey3),
                                  ),
                                ),
                                trailing: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Text('Bus No',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: CupertinoColors.systemGrey3)),
                                ),
                              ),
                              ...busdetail1.map(buildCoaches1).toList(),
                              buildingrow(),
                              ...busdetail2.map(buildCoaches2).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //SECOND CONTAINER
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        height: 335,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            color: CupertinoColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: ListView(
                          children: [
                            ...SCNDbusdetail.map(build2NDCoaches).toList(),
                            const ListTile(
                              leading: Text(
                                'Depart',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: CupertinoColors.systemGrey3),
                              ),
                              trailing: Text('Bus No',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: CupertinoColors.systemGrey3)),
                            ),
                            ...SCNDbusdetail1.map(build2NDCoaches1).toList(),
                            buildingrow(),
                            ...SCNDbusdetail2.map(build2NDCoaches2).toList(),
                          ],
                        ),
                      ),
                    ),
                    //Third CONTAINER

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        height: 340,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            color: CupertinoColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: ListView(
                          children: [
                             ...THRDbusdetail.map(build3RDCoaches).toList(),
                            const ListTile(
                              leading: Text(
                                'Depart',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: CupertinoColors.systemGrey3),
                              ),
                              trailing: Text('Bus No',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: CupertinoColors.systemGrey3)),
                            ),
                             ...THRDbusdetail1.map(build3RDCoaches1).toList(),
                            buildingrow(),
                             ...THRDbusdetail2.map(build3RDCoaches2).toList(),
                          ],
                        ),
                      ),
                    ),
                  ])))
        ]));
  }

  buildCoaches(busdetailmodal busdetails) => ListTile(
        leading: Text(
          busdetails.location,
          style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
        ),
        title: Center(
            child: Text(busdetails.title,
                style: const TextStyle(
                    color: CupertinoColors.systemRed, fontSize: 16))),
        trailing: Text(
          busdetails.destination,
          style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
        ),
      );
  buildCoaches1(busdetailmodal1 busdetails1) => ListTile(
        leading: Text(
          busdetails1.location1,
          style: const TextStyle(color: CupertinoColors.black, fontSize: 16),
        ),
        trailing: Text(
          busdetails1.destination1,
          style: const TextStyle(color: CupertinoColors.black, fontSize: 16),
        ),
      );
  buildCoaches2(busdetailmodal2 busdetails2) => ListTile(
        title: Text(busdetails2.title2,
            style: const TextStyle(
                color: CupertinoColors.systemGrey3, fontSize: 16)),
        subtitle: Text(
          busdetails2.subtitle2,
          style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
        ),
        trailing: TextButton(
            child: Text(
              busdetails2.destination2,
              style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
            ),
            onPressed: () {
//          enter a select seat funtion for 2MEXPRESS here

              print('view details for 2MEXPRESS');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const selectSeat()));
            }),
      );

//Building for 2nd CONTAINER

  build2NDCoaches(SCNDbusdetails SCNDbusdetail) => ListTile(
        leading: Text(
          SCNDbusdetail.location4,
          style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
        ),
        title: Center(
            child: Text(SCNDbusdetail.title4,
                style: const TextStyle(
                    color: CupertinoColors.systemRed, fontSize: 16))),
        //enter a view details funtion for VIP here
        trailing: Text(SCNDbusdetail.destination4,
            style: const TextStyle(color: Color(0xff91C483), fontSize: 16)),
      );
  build2NDCoaches1(SCNDbusdetails1 SCNDbusdetails1) => ListTile(
        leading: Text(
          SCNDbusdetails1.location5,
          style: const TextStyle(color: CupertinoColors.black, fontSize: 16),
        ),
        trailing: Text(
          SCNDbusdetails1.destination5,
          style: const TextStyle(color: CupertinoColors.black, fontSize: 16),
        ),
      );
  build2NDCoaches2(SCNDbusdetails2 SCNDbusdetail2) => Padding(
        padding: const EdgeInsets.only(bottom: 0, top: 0),
        child: ListTile(
          subtitle: Text(
            SCNDbusdetail2.subtitle6,
            style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
          ),
          title: Text(SCNDbusdetail2.title6,
              style: const TextStyle(
                  color: CupertinoColors.systemGrey3, fontSize: 16)),
          trailing: TextButton(
              child: Text(
                SCNDbusdetail2.destination6,
                style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
              ),
              onPressed: () {
                print('Download Ticket');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const selectSeat()));
              }),
        ),
      );

      //Building for 3rd CONTAINER

  build3RDCoaches(THRDbusdetails THRDbusdetail) => Padding(
        padding: const EdgeInsets.only(bottom: 0, top: 0),
        child: ListTile(
          leading: Text(
            THRDbusdetail.location7,
            style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
          ),
          title: Center(
            child: Text(THRDbusdetail.title7,
                style: const TextStyle(
                    color: CupertinoColors.systemRed, fontSize: 16)),
          ),
          trailing: Text(
            THRDbusdetail.destination7,
            style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
          ),
        ),
      );

build3RDCoaches1(THRDbusdetails1 THRDbusdetail1) => Padding(
        padding: const EdgeInsets.only(bottom: 0, top: 0),
        child: ListTile(
          leading: Text(
            THRDbusdetail1.location8,
            style: const TextStyle( fontSize: 16),
          ),
          trailing: Text(
            THRDbusdetail1.destination8,
            style: const TextStyle( fontSize: 16),
          ),
        ),
      );

build3RDCoaches2(THRDbusdetails2 THRDbusdetail2) => Padding(
        padding: const EdgeInsets.only(bottom: 0, top: 0),
        child: ListTile(
          title:Text( THRDbusdetail2.title9 ),
          subtitle: Text(
            THRDbusdetail2.subtitle9,
            style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
          ),
          trailing: TextButton(
            child: Text(
              THRDbusdetail2.destination9,
              style: const TextStyle(color: Color(0xff438A5E), fontSize: 16),
            ), onPressed: () {
                print('Download Ticket');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const selectSeat()));
              },
          ),
        ),
      );






  buildingrow() => Container(
        child: Row(children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 0, top: 5),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: CupertinoColors.destructiveRed,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
              child: Container(
                  width: 100, height: 2, color: CupertinoColors.systemGrey3),
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 40),
              child: Icon(CupertinoIcons.bus, size: 50, color: Colors.black45)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
              child: Container(
                  width: 100, height: 2, color: CupertinoColors.systemGrey3),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15, bottom: 0, top: 5, left: 5),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: CupertinoColors.systemGreen,
            ),
          ),
        ]),
      );
  

  void OnSelected(BuildContext, int Item) {
    switch (Item) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const priceScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const dateScreen()));
        break;
    }
  }
}

class busdetailmodal {
  String location, destination;
  String title;

  busdetailmodal(
      {required this.location,
      required this.destination,
      this.title = '2AMEXPRESS'});
}

class busdetailmodal1 {
  String location1, destination1;

  busdetailmodal1({
    required this.location1,
    required this.destination1,
  });
}

class busdetailmodal2 {
  String subtitle2, destination2;
  String title2;

  busdetailmodal2(
      {required this.subtitle2,
      required this.destination2,
      required this.title2});
}

class SCNDbusdetails {
  String location4, destination4;
  String title4;
  SCNDbusdetails(
      {required this.location4,
      required this.destination4,
      required this.title4});
}

class SCNDbusdetails1 {
  String location5, destination5;
  String title5;
  SCNDbusdetails1(
      {required this.location5,
      required this.destination5,
      required this.title5});
}

class SCNDbusdetails2 {
  String subtitle6, destination6;
  String title6;
  SCNDbusdetails2(
      {required this.subtitle6,
      required this.destination6,
      required this.title6});
}

class THRDbusdetails {
  String location7, destination7;
  String title7;
  THRDbusdetails(
      {required this.title7,
      required this.destination7,
      required this.location7});
}

class THRDbusdetails1 {
  String location8, destination8;
  THRDbusdetails1(
      {
      required this.destination8,
      required this.location8});
}

class THRDbusdetails2 {
  String subtitle9, destination9,title9;
  THRDbusdetails2(
      {
      required this.destination9,required this.title9,
      required this.subtitle9});
}








// Class for settings
// class MenuItems {
//   MenuItems({required this.text, required this.icon});
// }
// Text(SCNDbusdetail1.destination2,