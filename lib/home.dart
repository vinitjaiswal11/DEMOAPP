import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info/app_fonts.dart';

import 'app_theme.dart';
import 'helper.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Homepage();



  }
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


@override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  final _formkey = GlobalKey<FormState>();
var names =TextEditingController();
bool checkvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkText,
      appBar: AppBar(
        backgroundColor: AppTheme.appThemeColor,
        title: Text("Name List"),
        centerTitle: true,
        elevation: 0,

      ),


      body:
      SingleChildScrollView(
        child:
        Column(
          children: [
            SizedBox(height: 10,),
            Text("Add Name",style: TextStyle(color: AppTheme.blackText,fontSize: AppFonts.headertitle)),
            SizedBox(height: 10,),
            Text("Enter new name",style: TextStyle(color: AppTheme.otpcolor,fontSize: AppFonts.buttomtext),),
            Container(
              margin: EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 10),
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
              child: Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.disabled,
                child: TextFormField(
                  controller: names,
                  onChanged: (value) {
                    names = value as TextEditingController;
                  },
                  validator: (value) =>
                      Helpers.validateEmpty(value!, "Name"),
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
            ),

        Transform.scale(
          scale: 1.820,
          child: Checkbox(
            activeColor: AppTheme.blackText,
            value: checkvalue,
            onChanged: (bool? value) {
              setState(() {

                if (_formkey.currentState!.validate()) {
                  checkvalue = value!;
                  FirebaseFirestore.instance
                      .collection('data')
                      .add({'text': names.text});
                  names.text="";
                  checkvalue=false;
                }

                // print(checkvalue);
              });
            },
          )),
          SizedBox(
            height: 30,
          ),
          Container(
height: MediaQuery.of(context).size.height/1,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('data').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView(
                    children: snapshot.data!.docs.map((document) {
                      return Column(
                        children: [
                          Container(
                            child: Center(child: Text(document['text'],
                        style: TextStyle(
                                                      fontSize: AppFonts.headertitle,


                                                      color: AppTheme.blackText,
                          fontWeight: FontWeight.bold

                                                    ) )),
                          ),
                      Divider(
                                            color: AppTheme.otpcolor,
                                          )
                        ],
                      );
                    }).toList(),
                  );
                },

                //         FutureBuilder(
                //         future: users,
                //         builder: (context, snapshot) {
                // if (snapshot.hasData) {
                // var usersList = snapshot.data as List<User>;
                // return
                //
                //         ListView.builder(
                //           physics: NeverScrollableScrollPhysics(),
                //           shrinkWrap: true,
                //           itemCount:usersList.length,
                //           // module.getDataFromDb().length,
                //           // data.length,
                //           itemBuilder: (context, i) {
                //             return Container(
                //
                //               child: Container(
                //                 padding: EdgeInsets.only(top: 15,right: 15,bottom: 5,left: 15),
                //
                //                 child: Column(
                //                   children: [
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Container(
                //
                //
                //                           child: Text("${usersList[i].firstName}",style: TextStyle(
                //                             fontSize: AppFonts.headertitle,
                //
                //
                //                             color: AppTheme.blackText,
                //
                //                           ) ,),
                //                         ),
                //                         InkWell(
                //                           onTap: (){
                //                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Edit(usersList[i].firstName,usersList[i].id))).then((value) =>
                //                             { getuser()});
                //                           },
                //                           child: Container(
                //
                //
                //                             child: Icon(Icons.chevron_right_rounded,size: AppFonts.iconsize,),
                //
                //                           ),
                //                         ),
                //
                //                       ],
                //                     ),
                //                     Divider(
                //                       color: AppTheme.otpcolor,
                //                     )
                //                   ],
                //                 ),
                //
                //               ),
                //
                //             );
                //           },
                //         );
                // }else {
                // return const CircularProgressIndicator();
                // }
                // }),
              ),
            )
          ],
        ),

      ),
    );
  }
}

