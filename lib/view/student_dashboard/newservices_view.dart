import 'package:flutter/material.dart';
import 'package:innerxcrm_student/res/colors/app_color.dart';


class Newservices extends StatefulWidget {
  const Newservices({super.key});

  @override
  State<Newservices> createState() => _NewservicesState();
}

class _NewservicesState extends State<Newservices> {
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
              'News Services',
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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                           width: width,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      AppColor.lightBlue.withOpacity(.2)),
                              borderRadius: BorderRadius.all(Radius.circular(corner)),
                            ),
                            child:  const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                     CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor: AppColor.lightGrey,
                                                    child: Icon(
                                                          Icons.wallet,
                                                          color: AppColor.lightBlue,
                                                          size: 30.0,
                                                        ),
                                                    
                                                  ),
                                                  SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'my home town bihar!',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '02/10/2023',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color.fromARGB(255, 145, 143, 143),
                                      ),
                                    ),
                                  ],
                                ),
                                  ],
                                  ),
                                Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.lightBlue,
                                      size: 20.0,
                                    ),
                                
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}