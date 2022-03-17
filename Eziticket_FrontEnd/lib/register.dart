// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:backend/passwordreset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: false, home: RegisterScreen()),
  );
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Formkey = GlobalKey<FormState>();
  final PasswordController = TextEditingController();
  final CityController = TextEditingController();
  final DobController = TextEditingController();
  final EmailController = TextEditingController();
  final FirstnameController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final LastnameController = TextEditingController();
  final NumberController = TextEditingController();
  final RegionController = TextEditingController();
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
        const Color(0xff438A5E),
        
        body:Column(children: [
         Container( 
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff438A5E),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: TextButton(onPressed: () => 
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const passwordScreen())),
                      child: const Icon(CupertinoIcons.back,color: Colors.grey,),),
                    ),
                      buidinglogolid(),
                      buildcontainer1(),
                      buidinglogobottom(),
                    ]),
              ),
            ),
            
        Expanded(
          child: Container(
            color: CupertinoColors.white,
             
            
            child: ListView(
              children: [
                (
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Registeration',
                          style: TextStyle(fontSize: 23, color: Color(0xff438A5E))),
                    ),
                  )),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: FirstnameController,
                                    decoration: InputDecoration(
                                        suffixIcon: Fnamecheckbox(setState),
                                        hintText: 'first name',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    keyboardType: TextInputType.name,
                                    textCapitalization: TextCapitalization.characters,
                                    textInputAction: TextInputAction.next,
                                    validator: (ifEmpty) {
                                      if (ifEmpty != null && ifEmpty.length < 3) {
                                        return 'Please enter correct name';
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: LastnameController,
                                    decoration: InputDecoration(
                                        suffixIcon: Lnamecheckbox(setState),
                                        hintText: 'last name',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    keyboardType: TextInputType.name,
                                    textCapitalization: TextCapitalization.characters,
                                    textInputAction: TextInputAction.next,
                                    validator: (iflastname) {
                                      if (iflastname != null && iflastname.length < 3) {
                                        return 'Please enter correct name';
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: DobController,
                                    decoration: InputDecoration(
                                      suffixIcon: DOBcheckbox(setState),
                                      hintText: 'dd/mm/year',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      counterText: '',
                                    ),
                                    keyboardType: TextInputType.datetime,
                                    textCapitalization: TextCapitalization.characters,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9/]")),
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    textInputAction: TextInputAction.next,
                                    validator: (ifdob) {
                                      if (ifdob != null && ifdob.length < 10) {
                                        return 'Enter A Correct Date';
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: CityController,
                                    decoration: InputDecoration(
                                        suffixIcon: citycheckbox(setState),
                                        hintText: 'City name',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    keyboardType: TextInputType.name,
                                    textCapitalization: TextCapitalization.characters,
                                    textInputAction: TextInputAction.next,
                                    validator: (ifCity) {
                                      if (ifCity != null && ifCity.length < 3) {
                                        return 'Please enter correct city name';
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: RegionController,
                                    decoration: InputDecoration(
                                        suffixIcon: regioncheckbox(setState),
                                        hintText: 'Region',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    keyboardType: TextInputType.name,
                                    textCapitalization: TextCapitalization.characters,
                                    textInputAction: TextInputAction.next,
                                    validator: (ifRegion) {
                                      if (ifRegion != null && ifRegion.length < 3) {
                                        return 'Please enter correct Region';
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: NumberController,
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                        suffixIcon: phonenumbercheckbox(setState),
                                        hintText: 'phone number',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (ifphone) {
                                      if (ifphone != null && ifphone.length < 10) {
                                        return 'Please enter correct Phone number';
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: EmailController,
                                  decoration: InputDecoration(
                                      suffixIcon: Emailcheckbox(setState),
                                      hintText: 'Email Address',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  keyboardType: TextInputType.emailAddress,
                                  textCapitalization: TextCapitalization.characters,
                                  textInputAction: TextInputAction.next,
                                  validator: (ifemail) =>
                                      !EmailValidator.validate(ifemail!)
                                          ? 'Enter a valid email'
                                          : null,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: PasswordController,
                                    maxLength: 12,
                                    decoration: InputDecoration(
                                        suffixIcon: passwordcheckbox(setState),
                                        hintText: 'Password',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                    keyboardType: TextInputType.name,
                                    textCapitalization: TextCapitalization.characters,
                                    textInputAction: TextInputAction.next,
                                    validator: (password) {
                                      if (password != null && password.length < 6) {
                                        return 'Please enter correct password ';
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              SizedBox(
                                width: 200,
                                height: 40,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: CupertinoColors.systemOrange),
                                    onPressed: () {
                                      debugPrint('Email:${EmailController.text}');
                                      debugPrint('Password:${PasswordController.text}');
                                      debugPrint('Firstname:${FirstnameController.text}');
                                      debugPrint('Lastname:${LastnameController.text}');
                                      debugPrint('DOB:${DobController.text}');
                                      debugPrint('City:${CityController.text}');
                                      debugPrint('Region:${RegionController.text}');
                                      debugPrint('Phone:${NumberController.text}');
          
                                      final Form = _formkey.currentState!;
                                      if (Form.validate()) {
                                        setState(() {
                                          isChecked = true;
                                          isChecked1 = true;
                                          isChecked2 = true;
                                          isChecked3 = true;
                                          isChecked4 = true;
                                          isChecked5 = true;
                                          isChecked6 = true;
                                          isChecked7 = true;
                                        });
                                      }
                                    },
                                    child: const Text(
                                      'save',
                                      style: TextStyle(
                                          fontSize: 20, color: CupertinoColors.white),
                                    )),
                              ),
                            
                ]))),
              ],
            )),
        )]));
  }

  phonenumbercheckbox(StateSetter setState) => Checkbox(
      value: isChecked7,
      // ignore: non_constant_identifier_names
      onChanged: (Checked) => setState(() {
            isChecked7 = !isChecked7;
          }),
      checkColor: CupertinoColors.white,
      activeColor: CupertinoColors.activeGreen);

  citycheckbox(StateSetter setState) => Checkbox(
      value: isChecked6,
      // ignore: non_constant_identifier_names
      onChanged: (Checked) => setState(() {
            isChecked6 = !isChecked6;
          }),
      checkColor: CupertinoColors.white,
      activeColor: CupertinoColors.activeGreen);

  regioncheckbox(StateSetter setState) => Checkbox(
      value: isChecked5,
      // ignore: non_constant_identifier_names
      onChanged: (Checked) => setState(() {
            isChecked5 = !isChecked5;
          }),
      checkColor: CupertinoColors.white,
      activeColor: CupertinoColors.activeGreen);

  passwordcheckbox(StateSetter setState) => Checkbox(
      value: isChecked4,
      onChanged: (Checked) => setState(() {
            isChecked4 = !isChecked4;
          }),
      checkColor: CupertinoColors.white,
      activeColor: CupertinoColors.activeGreen);

  Emailcheckbox(StateSetter setState) => Checkbox(
      value: isChecked3,
      onChanged: (Checked) => setState(() {
            isChecked3 = !isChecked3;
          }),
      checkColor: CupertinoColors.white,
      activeColor: CupertinoColors.activeGreen);

  DOBcheckbox(StateSetter setState) => Checkbox(
      value: isChecked2,
      onChanged: (Checked) => setState(() {
            isChecked2 = !isChecked2;
          }),
      checkColor: CupertinoColors.white,
      activeColor: CupertinoColors.activeGreen);
  Lnamecheckbox(setState) => Checkbox(
      value: isChecked1,
      onChanged: (Checked) => setState(() {
            isChecked1 = !isChecked1;
          }),
      checkColor: CupertinoColors.white,
      activeColor: CupertinoColors.activeGreen);

  Fnamecheckbox(setState) => Checkbox(
      value: isChecked,
      onChanged: (Checked) => setState(() {
            isChecked = !isChecked;
          }),
      checkColor: CupertinoColors.white,
      activeColor: CupertinoColors.activeGreen);

  buildcontainer1() => const Padding(
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 25),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'EZiTICKET',
            style: TextStyle(
              fontFamily: 'CrimsonPro',
              textBaseline: TextBaseline.ideographic,
              color: CupertinoColors.white,
              fontWeight: FontWeight.w500,
            ),
            textScaleFactor: 4.0,
          ),
        ),
      );

  buidinglogobottom() => Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10, left: 35),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 70, height: 2, color: Colors.lightBlueAccent),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 0),
                child: CircleAvatar(radius: 10, backgroundColor: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                    width: 100, height: 2, color: Colors.lightBlueAccent),
              ),
            ],
          ),
        ),
      );

  buidinglogolid() => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                      width: 58, height: 2, color: Colors.lightBlueAccent),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 3, right: 10),
                child: CircleAvatar(
                    radius: 7, backgroundColor: CupertinoColors.destructiveRed),
              ),
              Container(width: 100, height: 2, color: Colors.lightBlueAccent),
            ],
          ),
        ),
      );
}
