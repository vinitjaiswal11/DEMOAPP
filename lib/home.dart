import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info/app_fonts.dart';
import 'package:path/path.dart' as path;
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info/app_fonts.dart';

>>>>>>> 0e9759786f4284064648ccdccc27fd67fbd9879b
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

<<<<<<< HEAD
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    File? pickedImage;
    try {
      final  pickedImage = await picker.getImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': '${names.text}',
              'description': '${des.text}',
              'checkbox':'true',
              'Datetime':'$date'
            }));

        // Refresh the UI
        setState(() {
          names.text="";
          des.text="";
        });
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }
@override
  void initState() {
  getemoiz();
=======

@override
  void initState() {

>>>>>>> 0e9759786f4284064648ccdccc27fd67fbd9879b
    // TODO: implement initState
    super.initState();
  }
  final _formkey = GlobalKey<FormState>();
var names =TextEditingController();
<<<<<<< HEAD
  var des =TextEditingController();
FirebaseStorage storage = FirebaseStorage.instance;
bool checkvalue = false;
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
        fileMeta.customMetadata?['description'] ?? 'No description',
      'checkbox':fileMeta.customMetadata?['checkbox'] ?? 'false',
      'Datetime':fileMeta.customMetadata?['Datetime'] ?? '$date',
      });
    });

    return files;
  }

  var date;
  getemoiz(){
    DateTime now = DateTime.now();
    setState(() {
      date=now;
    });
    print(now.toString() +"vinit");
  }

=======
bool checkvalue = false;
>>>>>>> 0e9759786f4284064648ccdccc27fd67fbd9879b
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkText,
      appBar: AppBar(
        backgroundColor: AppTheme.appThemeColor,
<<<<<<< HEAD
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Image INFO",style: TextStyle(color: AppTheme.darkText),),
=======
        title: Text("Name List"),
>>>>>>> 0e9759786f4284064648ccdccc27fd67fbd9879b
        centerTitle: true,
        elevation: 0,

      ),


      body:
      SingleChildScrollView(
        child:
<<<<<<< HEAD
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
                    Text("Description  ",style: TextStyle(color: AppTheme.otpcolor,fontSize: AppFonts.buttomtext),),
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
                        controller: des,
                        onChanged: (value) {
                          des = value as TextEditingController;
                        },
                        validator: (value) =>
                            Helpers.validateEmpty(value!, "Description"),
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
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(

                      onPressed: () {
    if (_formkey.currentState!.validate()) {
    print("jjj");
    _upload('camera');
    }},


                      icon: const Icon(Icons.camera,color: AppTheme.darkText,),
                      label: const Text('camera',style: TextStyle(color: AppTheme.darkText,),)),
                  ElevatedButton.icon(
                      onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        print("jjj");
      _upload('gallery');
                }},

                      icon: const Icon(Icons.library_add,color: AppTheme.darkText,),
                      label: const Text('Gallery',style: TextStyle(color: AppTheme.darkText,))),
                ],
              ),
              SizedBox(height: 30,),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height/1,
                  child: FutureBuilder(
                    future: _loadImages(),
                    builder: (context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            // bool b = snapshot.data![index]['checkbox'];

                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(

                                leading:
                                Image.network(snapshot.data![index]['url']),
                                title: Text(snapshot.data![index]['uploaded_by']),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data![index]['description']),
                                    Text(snapshot.data![index]['Datetime']),
                                  ],
                                ),

                              ),
                            );
                          },
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),

//         Transform.scale(
//           scale: 1.820,
//           child: Checkbox(
//             activeColor: AppTheme.blackText,
//             value: checkvalue,
//             onChanged: (bool? value) {
//               setState(() {
//
//                 if (_formkey.currentState!.validate()) {
//                   checkvalue = value!;
//                   FirebaseFirestore.instance
//                       .collection('data')
//                       .add({'text': names.text});
//                   names.text="";
//                   checkvalue=false;
//                 }
//
//                 // print(checkvalue);
//               });
//             },
//           )),
//           SizedBox(
//             height: 30,
//           ),
//           Container(
// height: MediaQuery.of(context).size.height/1,
//               child: StreamBuilder(
//                 stream: FirebaseFirestore.instance.collection('data').snapshots(),
//                 builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//
//                   return ListView(
//                     children: snapshot.data!.docs.map((document) {
//                       return Column(
//                         children: [
//                           Container(
//                             child: Center(child: Text(document['text'],
//                         style: TextStyle(
//                                                       fontSize: AppFonts.headertitle,
//
//
//                                                       color: AppTheme.blackText,
//                           fontWeight: FontWeight.bold
//
//                                                     ) )),
//                           ),
//                       Divider(
//                                             color: AppTheme.otpcolor,
//                                           )
//                         ],
//                       );
//                     }).toList(),
//                   );
//                 },
//
//                 //         FutureBuilder(
//                 //         future: users,
//                 //         builder: (context, snapshot) {
//                 // if (snapshot.hasData) {
//                 // var usersList = snapshot.data as List<User>;
//                 // return
//                 //
//                 //         ListView.builder(
//                 //           physics: NeverScrollableScrollPhysics(),
//                 //           shrinkWrap: true,
//                 //           itemCount:usersList.length,
//                 //           // module.getDataFromDb().length,
//                 //           // data.length,
//                 //           itemBuilder: (context, i) {
//                 //             return Container(
//                 //
//                 //               child: Container(
//                 //                 padding: EdgeInsets.only(top: 15,right: 15,bottom: 5,left: 15),
//                 //
//                 //                 child: Column(
//                 //                   children: [
//                 //                     Row(
//                 //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //                       children: [
//                 //                         Container(
//                 //
//                 //
//                 //                           child: Text("${usersList[i].firstName}",style: TextStyle(
//                 //                             fontSize: AppFonts.headertitle,
//                 //
//                 //
//                 //                             color: AppTheme.blackText,
//                 //
//                 //                           ) ,),
//                 //                         ),
//                 //                         InkWell(
//                 //                           onTap: (){
//                 //                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Edit(usersList[i].firstName,usersList[i].id))).then((value) =>
//                 //                             { getuser()});
//                 //                           },
//                 //                           child: Container(
//                 //
//                 //
//                 //                             child: Icon(Icons.chevron_right_rounded,size: AppFonts.iconsize,),
//                 //
//                 //                           ),
//                 //                         ),
//                 //
//                 //                       ],
//                 //                     ),
//                 //                     Divider(
//                 //                       color: AppTheme.otpcolor,
//                 //                     )
//                 //                   ],
//                 //                 ),
//                 //
//                 //               ),
//                 //
//                 //             );
//                 //           },
//                 //         );
//                 // }else {
//                 // return const CircularProgressIndicator();
//                 // }
//                 // }),
//               ),
//             )
            ],
          ),
=======
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
>>>>>>> 0e9759786f4284064648ccdccc27fd67fbd9879b
        ),

      ),
    );
  }
}

