import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../res/colors/app_color.dart';
import '../../res/components/round_button.dart';
import '../../res/components/textFieldUpload.dart';


class DocUpload extends StatefulWidget {
  const DocUpload({super.key});

  @override
  State<DocUpload> createState() => _DocUploadState();
}

class _DocUploadState extends State<DocUpload> {
  final _formKey = GlobalKey<FormState>();
   dynamic result2;
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
              'Document Upload',
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
                          TexFieldUpload(
                            title: '10th Crertificate',
                                                   requiredField: true,
                                                   sm: true,
                                                   width: .35,
                                                   fileUrl: '',
                                                   delete: () {
                                                       
                                                      
                                                   },
                                                   onTap: () async {
                                                     //pick csv file
                                                      result2 = await FilePicker.platform.pickFiles();
                                                     if (result2 != null) {
                                                       File file = File(result2!.files.single.path!);
                                             
                                                       return result2!.files[0].name.toString();
                                                     } else {
                                                       print('Upload file cancel');
                                                       return '';
                                                     }
                                                   },
                                                 ),
                                                 TexFieldUpload(
                                                  title: '12th Crertificate',
                                                   sm: true,
                                                   width: .35,
                                                   fileUrl: '',
                                                   delete: () {
                                                       
                                                      
                                                   },
                                                   onTap: () async {
                                                     //pick csv file
                                                      result2 = await FilePicker.platform.pickFiles();
                                                     if (result2 != null) {
                                                       File file = File(result2!.files.single.path!);
                                             
                                                       return result2!.files[0].name.toString();
                                                     } else {
                                                       print('Upload file cancel');
                                                       return '';
                                                     }
                                                   },
                                                 ),
                                                 
                        ],
                        ),
                         Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TexFieldUpload(
                            title: 'sample Crertificate',
                                                   requiredField: true,
                                                   sm: true,
                                                   width: .35,
                                                   fileUrl: '',
                                                   delete: () {
                                                       
                                                      
                                                   },
                                                   onTap: () async {
                                                     //pick csv file
                                                      result2 = await FilePicker.platform.pickFiles();
                                                     if (result2 != null) {
                                                       File file = File(result2!.files.single.path!);
                                             
                                                       return result2!.files[0].name.toString();
                                                     } else {
                                                       print('Upload file cancel');
                                                       return '';
                                                     }
                                                   },
                                                 ),
                                                 TexFieldUpload(
                                                  title: 'Sample Crertificate',
                                                   sm: true,
                                                   width: .35,
                                                   fileUrl: '',
                                                   delete: () {
                                                       
                                                      
                                                   },
                                                   onTap: () async {
                                                     //pick csv file
                                                      result2 = await FilePicker.platform.pickFiles();
                                                     if (result2 != null) {
                                                       File file = File(result2!.files.single.path!);
                                             
                                                       return result2!.files[0].name.toString();
                                                     } else {
                                                       print('Upload file cancel');
                                                       return '';
                                                     }
                                                   },
                                                 ),
                                                 
                        ],
                        ),
                         const SizedBox(height: 20,),
                                           RoundButton(
                                              width: double.infinity,
                                              title: 'Upload',
                                              rounded: 10,
                                              loading: false,
                                              iconEnable: false,
                                              onPress: (){
                                                
                                              },
                                                ),
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