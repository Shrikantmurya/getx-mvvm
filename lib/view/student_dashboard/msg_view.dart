import 'package:flutter/material.dart';
import 'package:innerxcrm_student/res/colors/app_color.dart';


class MsgScreen extends StatefulWidget {
  const MsgScreen({super.key});

  @override
  State<MsgScreen> createState() => _MsgScreenState();
}

class _MsgScreenState extends State<MsgScreen> {
  final _formKey = GlobalKey<FormState>();
  double corner = 20;
  TextEditingController typeMsg = TextEditingController();
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 90,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text(
              'Message',
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
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 155, 155, 155)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(corner),
                                  bottomLeft: Radius.circular(corner),
                                  topRight: Radius.circular(corner)),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'my home town bihar!',
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '02/10/2023',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 145, 143, 143),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 155, 155, 155)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(corner),
                                  bottomRight: Radius.circular(corner),
                                  topRight: Radius.circular(corner)),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'hmm',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 10,),
                               Wrap(children: [
                                Text('02/10/2023', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 145, 143, 143),),),
                                SizedBox(width: 10,),
                                Icon(
                                     Icons.done_all,
                                     color: AppColor.lightBlue,
                                     size: 20.0,
                                   ),
                              ]),
                               
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 155, 155, 155)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(corner),
                                  bottomRight: Radius.circular(corner),
                                  topRight: Radius.circular(corner)),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'hmm',
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(height: 10,),
                               Wrap(children: [
                                Text('02/10/2023', style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 145, 143, 143),),),
                                SizedBox(width: 10,),
                                Icon(
                                     Icons.done_all,
                                     color: Color.fromRGBO(141, 141, 141, 1),
                                     size: 20.0,
                                   ),
                              ]),
                               
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 155, 155, 155)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(corner),
                                  bottomLeft: Radius.circular(corner),
                                  topRight: Radius.circular(corner)),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'my home town bihar!',
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '02/10/2023',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 145, 143, 143),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 155, 155, 155)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(corner),
                                  bottomLeft: Radius.circular(corner),
                                  topRight: Radius.circular(corner)),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'my home town bihar!',
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '02/10/2023',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 145, 143, 143),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                   
                   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 155, 155, 155)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(corner),
                                  bottomLeft: Radius.circular(corner),
                                  topRight: Radius.circular(corner)),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'my home town bihar!',
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '02/10/2023',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 145, 143, 143),
                                  ),
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
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 13),
                        controller: typeMsg,
                        textInputAction: TextInputAction.newline,
                        decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: InputBorder.none,
                            labelStyle: TextStyle(fontSize: 13),
                            hintStyle: TextStyle(fontSize: 13)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    onPressed: (() {}),
                    icon: const Icon(Icons.send),
                    color: AppColor.lightBlue,
                    iconSize: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}