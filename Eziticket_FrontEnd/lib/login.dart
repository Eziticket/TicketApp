// ignore_for_file: unrelated_type_equality_checks, import_of_legacy_library_into_null_safe, camel_case_types, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, unnecessary_brace_in_string_interps, duplicate_ignore, unused_field, unnecessary_null_comparison, prefer_const_constructors

import 'package:backend/checkout.dart';
import 'passwordreset.dart';
import 'package:backend/class.dart';
import 'package:backend/selectSeat.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: accessscreen()),
  );
}

class accessscreen extends StatefulWidget {
  const accessscreen({Key? key}) : super(key: key);

  @override
  _accessscreenState createState() => _accessscreenState();
}

class _accessscreenState extends State<accessscreen> {
  final emailController = TextEditingController();
  final psswordController = TextEditingController();

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

  // SharedPreferences logindata;
  // bool newuser;

  // isEmailValid(value) {
  //   if (value) {
  //     value > 7;
  //   }
  // }

  bool isPasswordVissible = false;
  bool checki = false;
  static List title = ['Create an account (optional)'];
  final List<checkmarklist> checkmark = [
    checkmarklist(
      title: 'Create an account ',
    )
  ];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xff438A5E),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff438A5E),
            toolbarHeight: 150,
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.back,
                color: Colors.white70,
                size: 20,
              ),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const selectSeat())),
            ),
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(right: 65),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              width: 53,
                              height: 2,
                              color: Colors.lightBlueAccent),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: CircleAvatar(
                              radius: 8, backgroundColor: Colors.red),
                        ),
                        Container(
                            width: 100,
                            height: 2,
                            color: Colors.lightBlueAccent),
                      ],
                    ),
                  ),
                  const Text(
                    'EZiTICKET',
                    style: TextStyle(
                      fontFamily: 'CrimsonPro',
                      textBaseline: TextBaseline.ideographic,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textScaleFactor: 2.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              width: 53,
                              height: 2,
                              color: Colors.lightBlueAccent),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: CircleAvatar(
                              radius: 10, backgroundColor: Colors.red),
                        ),
                        Container(
                            width: 100,
                            height: 2,
                            color: Colors.lightBlueAccent),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            color: CupertinoColors.white,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 23, color: Colors.black54),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Text("Email Address",
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                  ),
                ),
                const SizedBox(height: 10),
                buildemail(),
                const SizedBox(
                  height: 20,
                ),
                buildpasswoerd(),
                Row(children: [
                  buildsignin(),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Icon(CupertinoIcons.play_arrow_solid,
                        color: CupertinoColors.activeBlue),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => passwordScreen()));
                      print('Forgot password');
                    },
                    child:  Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Tooltip(message: 'click here to reset your password',
                      textStyle:TextStyle(fontSize:14,color:CupertinoColors.white),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              fontSize: 14, color: CupertinoColors.activeBlue),
                        ),
                      ),
                    ),
                  )
                ]),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Or Sign In With:',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              print('Sign in with google');
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_1-tZgv2k2mJFrNKhexoHUzZddrfE32A1HQ&usqp=CAU'),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 20),
                  child: Row(
                    children: [
                      const Text('Are you new here?',
                          style:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                      Container(
                          width: 160,
                          height: 40,
                          decoration: (BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.transparent)),
                          child: TextButton(
                            child: Tooltip(message: 'continue to checkout',
                            textStyle:TextStyle(fontSize:14,color:CupertinoColors.white ) ,
                              child: const Text(
                                'Continue As Guest',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.orange),
                              ),
                            ),
                            onPressed: () {
                              print('Continue As Guest');
                              print('Email:${emailController.text}');
                              print('Password:${psswordController}');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const checkoutscreen()));
                            },
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Color(0xff438A5E),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Container(
                                width: 320,
                                height: 45,
                                decoration: (BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orange.shade700)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    onPressed: () async {
                                      // await showInformationDialog(context);
                                      return showDialog(
                                          context: context,
                                          builder: (context) => StatefulBuilder(
                                              builder:
                                                  (context, setState) => Dialog(
                                                          child: ListView(
                                                              children: [
                                                            const Center(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: Text(
                                                                    'Create your Account',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Color(
                                                                            0xff438A5E))),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Form(
                                                                key: _formkey,
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child: TextFormField(
                                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                          controller: FirstnameController,
                                                                          decoration: InputDecoration(suffixIcon: Fnamecheckbox(setState), hintText: 'first name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                          keyboardType: TextInputType.name,
                                                                          textCapitalization: TextCapitalization.characters,
                                                                          textInputAction: TextInputAction.next,
                                                                          validator: (ifEmpty ) {
                                                                            if (ifEmpty != null &&
                                                                                ifEmpty.length < 3) {
                                                                              return 'Please enter correct name';
                                                                            } 
                                                                            else {
                                                                              return null;
                                                                            } 
                                                                            
                                                                          }
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child: TextFormField(
                                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                          controller: LastnameController,
                                                                          decoration: InputDecoration(suffixIcon: Lnamecheckbox(setState), hintText: 'last name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                          keyboardType: TextInputType.name,
                                                                          textCapitalization: TextCapitalization.characters,
                                                                          textInputAction: TextInputAction.next,
                                                                          validator: (iflastname) {
                                                                            if (iflastname != null &&
                                                                                iflastname.length < 3) {
                                                                              return 'Please enter correct name';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          }),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child: TextFormField(
                                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                          controller: DobController,
                                                                          decoration: InputDecoration(
                                                                            suffixIcon:
                                                                                DOBcheckbox(setState),
                                                                            hintText:
                                                                                'dd/mm/year',
                                                                            border:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                            counterText:
                                                                                '',
                                                                          ),
                                                                          keyboardType: TextInputType.datetime,
                                                                          textCapitalization: TextCapitalization.characters,
                                                                          inputFormatters: [
                                                                            FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                                                                            LengthLimitingTextInputFormatter(10),
                                                                          ],
                                                                          textInputAction: TextInputAction.next,
                                                                          validator: (ifdob) {
                                                                            if (ifdob != null &&
                                                                                ifdob.length < 10) {
                                                                              return 'Enter a correct date';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          }),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child: TextFormField(
                                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                          controller: CityController,
                                                                          decoration: InputDecoration(suffixIcon: citycheckbox(setState), hintText: 'City name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                          keyboardType: TextInputType.name,
                                                                          textCapitalization: TextCapitalization.characters,
                                                                          textInputAction: TextInputAction.next,
                                                                          validator: (ifCity) {
                                                                            if (ifCity != null &&
                                                                                ifCity.length < 3) {
                                                                              return 'Please enter correct city name';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          }),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child: TextFormField(
                                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                          controller: RegionController,
                                                                          decoration: InputDecoration(suffixIcon: regioncheckbox(setState), hintText: 'Region', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                          keyboardType: TextInputType.name,
                                                                          textCapitalization: TextCapitalization.characters,
                                                                          textInputAction: TextInputAction.next,
                                                                          validator: (ifRegion) {
                                                                            if (ifRegion != null &&
                                                                                ifRegion.length < 3) {
                                                                              return 'Please enter correct Region';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          }),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child: TextFormField(
                                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                          controller: NumberController,
                                                                          maxLength: 10,
                                                                          decoration: InputDecoration(suffixIcon: phonenumbercheckbox(setState), hintText: 'phone number', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                          keyboardType: TextInputType.number,
                                                                          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                                                          validator: (ifphone) {
                                                                            if (ifphone != null &&
                                                                                ifphone.length < 10) {
                                                                              return 'Please enter correct Phone number';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          }),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child:
                                                                          TextFormField(
                                                                        autovalidateMode:
                                                                            AutovalidateMode.onUserInteraction,
                                                                        controller:
                                                                            EmailController,
                                                                        decoration: InputDecoration(
                                                                            suffixIcon: Emailcheckbox(
                                                                                setState),
                                                                            hintText:
                                                                                'Email Address',
                                                                            border:
                                                                                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                        keyboardType:
                                                                            TextInputType.emailAddress,
                                                                        textCapitalization:
                                                                            TextCapitalization.characters,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        validator: (ifemail) => !EmailValidator.validate(ifemail!)
                                                                            ? 'Enter a valid email'
                                                                            : null,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              10),
                                                                      child: TextFormField(
                                                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                          controller: PasswordController,
                                                                          maxLength: 12,
                                                                          decoration: InputDecoration(suffixIcon: passwordcheckbox(setState), hintText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                          keyboardType: TextInputType.name,
                                                                          textCapitalization: TextCapitalization.characters,
                                                                          textInputAction: TextInputAction.next,
                                                                          validator: (password) {
                                                                            if (password != null &&
                                                                                password.length < 6) {
                                                                              return 'Please enter correct password ';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          }),
                                                                    ),
                                                                    Center(
                                                                      child: ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(primary: CupertinoColors.systemOrange),
                                                                          onPressed: () {
                                                                            debugPrint('Email:${EmailController.text}');
                                                                            debugPrint('Password:${PasswordController.text}');
                                                                            debugPrint('Firstname:${FirstnameController.text}');
                                                                            debugPrint('Lastname:${LastnameController.text}');
                                                                            debugPrint('DOB:${DobController.text}');
                                                                            debugPrint('City:${CityController.text}');
                                                                            debugPrint('Region:${RegionController.text}');
                                                                            debugPrint('Phone:${NumberController.text}');

                                                                            final Form =
                                                                                _formkey.currentState!;
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
                                                                          child: const Text('save')),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ]))));
                                    },
                                    child: const Text(
                                      'Create  Account',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
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

  buildpasswoerd() => Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: psswordController,
          validator: (pssword) {
            if (pssword!.isNotEmpty && pssword.length < 6) {
              return 'Please enter a correct password';
            } else {
              return null;
            }
          },
          maxLength: 12,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'password',
            prefixIcon: const Icon(CupertinoIcons.lock),
            suffixIcon: IconButton(
              hoverColor: Colors.transparent,
              icon: Tooltip(message:'hide characters',
              textStyle:TextStyle(fontSize:14,color:CupertinoColors.white),
                child: isPasswordVissible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              onPressed: () =>
                  setState(() => isPasswordVissible = !isPasswordVissible),
            ),
          ),
          obscureText: isPasswordVissible,
        ),
      );

  buildemail() => Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: emailController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Email',
          // errorText: 'enter a correct Email Address',
          prefixIcon: Icon(Icons.email, color: Colors.amber.shade400),
          prefixIconColor: Colors.brown,
          suffixIcon: emailController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () => emailController.clear(),
                  icon: const Icon(Icons.clear),
                ),
        ),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        validator: (ifemail) =>
            !EmailValidator.validate(ifemail!) ? 'Enter a valid email' : null,
      ));

  buildsignin() => Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 10, 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 100,
            height: 40,
            decoration: (BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.orange.shade700)),
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  print('Email:${emailController.text}');
                  print('Password:${psswordController.text}');
                  final Form = Formkey.currentState!;
                  if (Form.validate()) {
                    setState(() {});
                  }
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      );

  BuildCheckboxListTile(checkmarklist checkmark) => Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: (CheckboxListTile(
            value: checkmark.value,
            tristate: true,
            onChanged: (value) =>
                setState(() => checkmark.value = !checkmark.value),
            activeColor: CupertinoColors.white,
            checkColor: CupertinoColors.destructiveRed,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              checkmark.title,
            ))),
      );
}
