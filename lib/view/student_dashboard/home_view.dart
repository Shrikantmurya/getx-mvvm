import 'package:flutter/widgets.dart';
import 'package:innerxcrm_student/res/fonts/app_fonts.dart';

import '../../res/components/blinkwidget.dart';
import '../../res/components/step_list.dart';
import '/res/colors/app_color.dart';
import '/res/const_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../res/app_url/app_url.dart';
import '../../res/assets/image_assets.dart';
import '../../res/components/common_drawer.dart';
import '../../res/components/menu_grid.dart';
import '../../res/drawers.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

import '../../view_models/admin/admindashboard_view_models.dart';
import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';
import '../../view_models/logout_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AdmindashboardController finaladmindashboard =
      Get.put(AdmindashboardController());
  final logoutController = Get.put(LogoutViewModel());

  //drawer list auto generator
  String username = '';
  String logo = '';
  UserPreference userPreference = UserPreference();
  DateTime? firstDayOfMonth, lastDayOfMonth;
   ScrollController? _scrollController;
  bool _isAppBarExpanded = false;
  bool _isApplicationStatus = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    callDashboardApi();
    getLogo();
    userPreference.getUser().then((value) {
      setState(() {
        username = value.username!;
      });
    });
     _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _isAppBarExpanded =
              _scrollController!.hasClients && _scrollController!.offset > 90;
        });
      });
  }
  getLogo() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      setState(() {
        logo = sp.getString('logo')!;
      });
   }
  callDashboardApi() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String loca = prefs.getString('branchLocation') ?? "";
    finaladmindashboard
        .admindashboardListApi({"location": loca.isNotEmpty ? loca : ""}, AppUrl.admindashboardListApi);
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
        home: Scaffold(
               key: _scaffoldKey,
              // backgroundColor: Colors.white,
             
              drawer: Drawer(
                  child: Obx(() => CommonDrawer(
                      draweList: admindrawerMenus,
                      text: username,
                      imgUrl: profileImageUrl.value,
                      color: AppColor.lightBlue))),
            body: CustomScrollView(
              
        controller: _scrollController,
        
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  margin: const EdgeInsets.only(right: 60.0), // Adjust the negative left margin as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.network(
                      'https://img.innerxcrm.com/logo/${logo}',
                      height: 30,
                       
                    ),
                   
                    ],
                  ),
                ),
                background: Image.asset(ImageAssets.dashbg,
                  fit: BoxFit.contain,
                  
                ),
              ),

            expandedHeight: 150,
            backgroundColor:  _isAppBarExpanded ?  AppColor.white :  AppColor.lightBlue,
            leading: IconButton(
              icon: SvgPicture.asset(
                ImageAssets.menuVector,
                 // ignore: deprecated_member_use
                 color: _isAppBarExpanded ? AppColor.greyColor : AppColor.white,
                height: 130,
              ),
              tooltip: 'Menu',
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset(
                  ImageAssets.messageNoti,
                  width: 25,
                  height: 25,
                   // ignore: deprecated_member_use
                   color: _isAppBarExpanded ? AppColor.greyColor : AppColor.white,
                ),
                iconSize: 50,
                onPressed: () {
                  Get.offAllNamed(RouteName.layoutView, arguments: 2);
                },
              )
            ],
          ),
         SliverList(

              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  color: _isAppBarExpanded ? Colors.transparent: AppColor.lightBlue,
                  child: Container(
                      height: 700,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          border: Border.all(color:  Colors.transparent),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        ),
                    child: ListTile(
                      tileColor: AppColor.white ,
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 50,),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                  radius: 21,
                                  child: Image(
                                    image: AssetImage(ImageAssets.userplaceholder),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Utils.getGreetingMessage(),
                                    style: ThemeStyles.Size13TextStyleGreyW600),
                                Text('Mr. Lorem Ipsum', style: ThemeStyles.Size18TextStyledarkBlueW600),
                              ],
                            ),
                          ],
      ),  
                        const SizedBox(height: 30,),
                         userStatus(),
                         menuGridWidget()
                        ],
                      ),
                    ),
                  ),
                ),
                childCount: 1,
              ),
            ),

        ],
      ),
            ),  
    );
  }


  menuGridWidget() {
    return MenuGrid(GridMenus: [
      {
        "image": ImageAssets.dob,
        "label": 'Doc Upload',
        'width': 25.00,
        "event": () {
          Get.toNamed(
        RouteName.docUpload,
      );
        }
      },
      {
        "image": ImageAssets.notappliedIcon,
        "label": 'Notification',
        'width': 25.00,
        "event": () {
         Get.offAllNamed(RouteName.layoutView, arguments: 1);
        }
      },
    
      {
        "image": ImageAssets.simIcon,
        "label": 'SIM Req',
        'width': 18.00,
        "event": () {
             Get.toNamed( RouteName.simReq );
        }
      },
      {
        "image": ImageAssets.institutefee,
        "label": 'Message',
        'width': 25.00,
        "event": () {
           Get.offAllNamed(RouteName.layoutView, arguments: 2);
          }
      },
      {
        "image": ImageAssets.searchIcn,
        "label": 'Course Find',
        'width': 25.00,
        "event": () {
           Get.toNamed( RouteName.coursefind );
         }
      },
      {
        "image": ImageAssets.intersetIcon,
        "label": 'Add Interset',
        'width': 25.00,
        "event": () {
           Get.toNamed( RouteName.addinterest );
            }
      },

      {
        "image": ImageAssets.formIcon,
        "label": 'Form Request',
        'width': 25.00,
        "event": () {
           Get.toNamed( RouteName.formReq );
         }
      },

     {
        "image": ImageAssets.accountnumber,
        "label": 'AI Agent',
        'width': 25.00,
        "event": () {
           Get.toNamed( RouteName.aiAgent );
         }
      },

      {
        "image": ImageAssets.appliedIcon,
        "label": 'New Services',
        'width': 25.00,
        "event": () {
         Get.toNamed( RouteName.newservices );
         }
      },
       {
        "image": ImageAssets.more,
        "label": 'Upcomming',
        'width': 25.00,
        "event": () {
           Get.toNamed( RouteName.upcomming );
        }
      },

    ]);
  }
  userStatus(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text('Application Status', style: ThemeStyles.t14TextStyleLightBlueColorW500,),
                  const BlinkingWidget(
                    widgetData: Icon(
                          Icons.keyboard_double_arrow_right,
                          color: AppColor.lightBlue,
                          size: 15.0,
                        ),
                  ),
                  
                ],
              )
              ),
              onTap: (){
               setState(() {
                 _isApplicationStatus = !_isApplicationStatus;
               });
              },
          ),
           if(_isApplicationStatus)
             Column(
            children: [
                const SizedBox(height: 20,),
                StepList(
                      title:  'Persional Details',
                      data: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem ipsum',
                                style: ThemeStyles.t13TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Agent :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem ipsum',
                                style: ThemeStyles.t13TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Counselor :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem ipsum',
                                style: ThemeStyles.t14TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Branch :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem Ipsum',
                                style: ThemeStyles.t14TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Source :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem Ipsum',
                                style: ThemeStyles.t14TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                        ],
                      )
                      ),
                StepList(
                      title:  'Payment',
                      data: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem ipsum',
                                style: ThemeStyles.t13TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                         
                        ],
                      )
                      ),
                StepList(
                      title:  'Documents',
                      data: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem ipsum',
                                style: ThemeStyles.t13TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                         
                        ],
                      )
                      ),
                StepList(
                      title:  'Admission',
                      data: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem ipsum',
                                style: ThemeStyles.t13TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                         
                        ],
                      )
                      ),
                      StepList(
                      title:  'TT Recipt',
                      data: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name :',
                                style: ThemeStyles.size13TextStyleBlackW600,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text('Lorem ipsum',
                                style: ThemeStyles.t13TextStyleGreyColorW500,
                              ),
                            ],
                          ),
                         
                        ],
                      )
                      ),
          ],
          )
        ],
      ),
    );
  }
  
}
