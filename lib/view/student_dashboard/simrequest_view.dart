import 'package:flutter/material.dart';
import 'package:innerxcrm_student/res/colors/app_color.dart';

import '../../res/components/form_design.dart';
import '../../res/components/round_button.dart';
import '../../res/components/step_list.dart';
import '../../res/fonts/app_fonts.dart';


class SimReq extends StatefulWidget {
  const SimReq({super.key});

  @override
  State<SimReq> createState() => _SimReqState();
}

class _SimReqState extends State<SimReq> {
  final _formKey = GlobalKey<FormState>();
  bool _isSimStatus = false;
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
              'Sim Request',
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
                        BuildDropdown(
                                              title: 'Sim Type',
                                              requiredField: false,
                                              optionsType: 'Select Here',
                                              width: double.infinity,
                                              height: 45,
                                              color: AppColor.lightGreyborder,
                                              selectedValue: 'Prepaid',
                                              textSize: 13,
                                              listItem: ['Prepaid', 'Postpaid'],
                                              onChanged: (String? newValue) {
                                               
                                              },
                                            ),
                                            const SizedBox(height: 20,),
                                           RoundButton(
                                              width: double.infinity,
                                              title: 'Apply',
                                              rounded: 10,
                                              loading: false,
                                              iconEnable: false,
                                              onPress: (){
                                                
                                              },
                                                ),
                                              const SizedBox(height: 40,),
                                              simStatus()
                                                
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
  simStatus(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Sim Request Status', style: ThemeStyles.t14TextStyleLightBlueColorW500,)
              ),
              onTap: (){
               setState(() {
                 _isSimStatus = !_isSimStatus;
               });
              },
          ),
           if(_isSimStatus)
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