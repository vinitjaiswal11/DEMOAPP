import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info/app_fonts.dart';
import 'package:path/path.dart' as path;
import 'app_theme.dart';
import 'helper.dart';
import 'home.dart';


class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Homepage2();



  }
}
class Homepage2 extends StatefulWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  State<Homepage2> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage2> {


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  final _formkey = GlobalKey<FormState>();
  var names =TextEditingController();

  FirebaseStorage storage = FirebaseStorage.instance;
  bool checkvalue = false;



  final CollectionReference _productss =
  FirebaseFirestore.instance.collection('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkText,
      appBar: AppBar(
        backgroundColor: AppTheme.appThemeColor,
        title: Text("INFO",style: TextStyle(color: AppTheme.darkText),),
        centerTitle: true,
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 25,bottom: 5,top: 10),
                child: Material(

                  child: InkWell(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));


                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      height: 50,



                      child: Center(
                        child:
                        Text(

                          "Next",
                          style: TextStyle(color: Colors.blue,
                              fontWeight:FontWeight.bold ,fontSize: AppFonts.hinttextsize),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),




      body:
      SingleChildScrollView(
        child:
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),

              SizedBox(height: 10,),
              Text("Enter Title",style: TextStyle(color: AppTheme.otpcolor,fontSize: AppFonts.buttomtext),),
              Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                      // width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          // color: AppColors.selectedItemColor,
                          style: BorderStyle.solid,
                          width: .5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: names,
                        onChanged: (value) {
                          names = value as TextEditingController;
                        },
                        validator: (value) =>
                            Helpers.validateEmpty(value!, "Title"),
                        decoration: InputDecoration(
                            border: InputBorder.none,

                            hintStyle: TextStyle(color: Colors.grey[400]),
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                            counterText: ""),
                        textCapitalization: TextCapitalization.characters,
                      ),
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(

                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          print("jjj");
                          FirebaseFirestore.instance
                              .collection('data')
                              .add({'text': names.text
                              ,'check':false});
names.text="";
                        }},


child:

                       Text('Submit',style: TextStyle(color: AppTheme.darkText,),)),

                ],
              ),
              SizedBox(height: 30,),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height/1,
                  child:
                  StreamBuilder(
                    stream: _productss.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                            return Card(
                                            margin: const EdgeInsets.symmetric(vertical: 10),
                                            child: ListTile(

                                              leading: documentSnapshot['check']==false? Transform.scale(
                                                  scale: 0.920,
                                                  child: Checkbox(
                                                    activeColor: AppTheme.blackText,
                                                    value: documentSnapshot['check'],
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        checkvalue = value!;
                                                         _productss
                                                            .doc( documentSnapshot.id)
                                                            .update({'text': documentSnapshot['text']
                                                          ,'check':true});

                                                        print(checkvalue);
                                                      });
                                                    },
                                                  )):Transform.scale(
                                                  scale: 0.920,
                                                  child: Checkbox(
                                                    activeColor: AppTheme.blackText,
                                                    value: true,
                                                    onChanged: (bool? value) {
                                                      setState(() {

                                                        print("kkk");

                                                        // print(value);
                                                      });
                                                    },
                                                  )),
                                              title: Text(documentSnapshot['text'],style: TextStyle(fontWeight: FontWeight.bold),),

                                            ));

                          },
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),

                ),
              )],
          ),
        ),

      ),
    );
  }
}

