import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';

class Coursefind extends StatefulWidget {
  const Coursefind({super.key});

  @override
  State<Coursefind> createState() => _CoursefindState();
}

class _CoursefindState extends State<Coursefind> {
  final _formKey = GlobalKey<FormState>();
  double corner = 20;
  TextEditingController typeMsg = TextEditingController();
  @override
   Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 90,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text(
              'Course Find',
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
              Icons.notifications_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
         color: Colors.blueAccent.withOpacity(0.05),
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              decoration: BoxDecoration(
              color: AppColor.white,    
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
                
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                                                          width: width/1.5,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: AppColor.lightGreyborder),
                                                            borderRadius: const BorderRadius.all(
                                                                Radius.circular(10)),
                                                          ),
                                                          child: const TextField(
                                                          //  controller: textSearch,
                                                            decoration: InputDecoration(
                                                              contentPadding: EdgeInsets.only(left: 10),
                                                              border: InputBorder.none,
                                                              hintText: 'Search course here...',
                                                              hintStyle:
                                                                  TextStyle(fontSize: 13, height: 3),
                                                              suffixIcon: Icon(
                                                                Icons.search,
                                                                color: AppColor.lightGreyborder,
                                                                size: 25.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                        width: 30,
                                                        height: 30,
                                                        child: RawMaterialButton(
                                                          onPressed: (){},
                                                          elevation: 1.0,
                                                          fillColor: AppColor.lightBlue,
                                                          padding: const EdgeInsets.all(0),
                                                          shape: const CircleBorder(),
                                                          child: SvgPicture.asset(
                                                            ImageAssets.filter,
                                                          ),
                                                        ),
                                                      )
                         ],
                       ),
            
                                                    const Divider(height: 40, color: Color.fromARGB(255, 226, 226, 226),),
            
                                                    
                     ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}