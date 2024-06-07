import '../../res/components/tiles.dart';
import '/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets/image_assets.dart';
import '../../res/const_variable.dart';
import '../../view_models/logout_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

   final logoutController = Get.put(LogoutViewModel());
  @override
  void initState() {
    super.initState();
    focusNodeFullName.addListener(_onFocusChange);
    focusNodeEmail.addListener(_onFocusChange);
    focusNodePass.addListener(_onFocusChange);
    focusNodeMobile.addListener(_onFocusChange);
    focusNodeCity.addListener(_onFocusChange);
    focusNodeAddress.addListener(_onFocusChange);

  }
  void _onFocusChange() {
    setState(() {

      hasFocusFullName= focusNodeFullName.hasFocus;
      hasFocusEmail = focusNodeEmail.hasFocus;
      hasFocusPass = focusNodePass.hasFocus;
      hasFocusMobile = focusNodeMobile.hasFocus;
      hasFocusCity = focusNodeCity.hasFocus;
      hasFocusAddress = focusNodeAddress.hasFocus;
    });
  }
  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width * 1;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60,
          foregroundColor: Colors.white,
          backgroundColor: AppColor.lightBlue,
          title: const Text(
            'Profile',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {}, 
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 1,
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: AppColor.lightBlue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          bottomRight: Radius.circular(150)),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(ImageAssets.userplaceholder),
                                ),
                        ),
                        Positioned(
                            top: -5,
                            right: width * .28,
                            height: 182,
                            width: 40,
                            child: RawMaterialButton(
                              onPressed: () {
                                
                              },
                              elevation: 2.0,
                              fillColor: Colors.white,
                              padding: const EdgeInsets.all(10),

                              // padding: EdgeInsets.all(1.0),
                              shape: const CircleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 2)),

                              child: const Icon(
                                Icons.camera_alt,
                                color: AppColor.lightBlue,
                                size: 20.0,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'lorem',
                style: TextStyle(
                  color: AppColor.lightBlue,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                         Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Icon(
                                                        Icons.person,
                                                        color: Colors.black,
                                                        size: 25.0,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'About Me',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: (){},
                                                    icon:
                                                        const Icon(Icons.edit),
                                                    color: AppColor.lightBlue,
                                                    iconSize: 20,
                                                  ),
                                                ],
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text('Lorem ',
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                              const TilesWidget(
                                                title: 'Managed By',
                                                titleValue: 'Parents',
                                              ),
                                              const TilesWidget(
                                                title: 'Disabiltity',
                                                titleValue: 'None'
                                                    ,
                                              ),
                                             
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Icon(
                                                        Icons.school,
                                                        color: Colors.black,
                                                        size: 25.0,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Education',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                     
                                                    },
                                                    icon:
                                                        const Icon(Icons.edit),
                                                    color: AppColor.lightBlue,
                                                    iconSize: 20,
                                                  ),
                                                ],
                                              ),
                                              const TilesWidget(
                                                title: 'Post Graduation',
                                                titleValue: '',
                                              ),
                                              
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              
                                            ],
                                          ),
                                         
                                       
                        ])),
              ),
            ],
          )
        ))
  
    );
  }


   
}
