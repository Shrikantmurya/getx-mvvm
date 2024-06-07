import 'package:flutter/material.dart';
import 'package:innerxcrm_student/res/colors/app_color.dart';


class FormReq extends StatefulWidget {
  const FormReq({super.key});

  @override
  State<FormReq> createState() => _FormReqState();
}

class _FormReqState extends State<FormReq> {
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
              'Form Request',
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
                  children: const [
                  Center(
              child: Text(
                              'Form Request',
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
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