import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../colors/app_color.dart';
import '../const_variable.dart';
import '../fonts/app_fonts.dart';
import 'custom_dialog.dart';

class BuildMultiDropdown extends StatefulWidget {
  final String optionsType, icon, title;
  final List<String>? selectedValues;
  final double width, height, heightIcon, widthIcon, textSize;
  final List<String> listItem;
  final bool focus;
  final FocusNode? focusNode;
  final Color color;
  final bool requiredField;
  final Function(RxList) selectedData;
  const BuildMultiDropdown({
    Key? key,
    required this.optionsType,
    required this.width,
    required this.height,
    this.icon = '',
    this.heightIcon = 24.00,
    this.widthIcon = 24.0,
    this.selectedValues,
    required this.listItem,
    this.focus = false,
    this.focusNode,
    this.color = AppColor.greyColor,
    this.textSize = 16,
    this.title = '',
    this.requiredField = false,
    required this.selectedData,
  }) : super(key: key);

  @override
  State<BuildMultiDropdown> createState() => _BuildMultiDropdownState();
}

class _BuildMultiDropdownState extends State<BuildMultiDropdown> {
  RxList selectedValues = [].obs;

 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 10),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: ThemeStyles.Size13TextStyleGreyW600,
                ),
                if (widget.requiredField)
                  Text(
                    ' *',
                    style: ThemeStyles.Size14TextStyleRedW600,
                  )
              ],
            ),
          ),
        GestureDetector(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 1, 10),
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.focus ? AppColor.lightYellowColor : widget.color,
              ),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Obx(()=> Text(selectedValues.isEmpty ? 'Select Multiple Items' : '${selectedValues.length} Items Selected', style: TextStyle(
                                            color: AppColor.greyColor,
                                            fontSize: widget.textSize),),
                ),
              ),
              const Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromARGB(255, 89, 89, 89),
                    size: 25.0,
                  ),
              
            ],),
          ),
          onTap: (){
            customPopup(context, widget.title, 
            
             Row(children: [
              Expanded(
                child: ListView.builder(
                                        itemCount: widget.listItem.length,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) => GestureDetector(
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                            ),
                                            child: Obx(()=> Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text( widget.listItem[index].toString(), style: TextStyle(
                                        color: AppColor.greyColor,
                                        fontSize: widget.textSize),),
                                                  !selectedValues.contains(widget.listItem[index].toString()) ? Container() : const Icon(
                                                        Icons.check,
                                                        color: AppColor.lightBlue,
                                                        size: 20.0,
                                                      ),
                                                  
                                                ],
                                              ),
                                            )
                                            
                                          ),
                                          onTap: (){
                                              if(!selectedValues.contains(widget.listItem[index].toString())){
                                                selectedValues.add(widget.listItem[index].toString());
                                              }else{
                                                selectedValues.removeAt(selectedValues.indexOf(widget.listItem[index].toString()));
                                              }
                                              widget.selectedData(selectedValues);
                                            },
                                        ),
                                      ),
              )


              
            ], ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               OutlinedButton(
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 1.0,
                backgroundColor: AppColor.white,
                foregroundColor: AppColor.redColor,
                textStyle: const TextStyle(color: Colors.white)),
            child: const Text('Clear'),
            onPressed: () {
                selectedValues.clear();
            },
          ),
          const SizedBox(
            width: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 1.0,
                backgroundColor: AppColor.lightBlue,
                foregroundColor: AppColor.white,
                textStyle: const TextStyle(color: Colors.white)),
            child: const Text('Submit'),
            onPressed: () {
           
            Get.back();
            },
          ),
            ], ), .8);
          },
        ),
      ],
    );
  }
}

class BuildDropdown extends StatefulWidget {
  final String optionsType, icon, title;
  final String? selectedValue;
  final double width, height, heightIcon, widthIcon, textSize;
  final List<String> listItem;
  final bool focus;
  final FocusNode? focusNode;
  final Color color;
  final bool requiredField;
  final Function(String? newValue) onChanged;
  const BuildDropdown(
      {super.key,
      required this.optionsType,
      required this.width,
      required this.height,
      this.icon = '',
      this.heightIcon = 24.00,
      this.widthIcon = 24.0,
      required this.selectedValue,
      required this.listItem,
      this.focus = false,
      this.focusNode,
      this.color = AppColor.greyColor,
      this.textSize = 16, this.title = '', this.requiredField = false, required this.onChanged, });

  @override
  State<BuildDropdown> createState() => _BuildDropdownState();
}

class _BuildDropdownState extends State<BuildDropdown> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.title.isNotEmpty)
         Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Row(
            
                children: [
                  Text(
                    widget.title,
                    style: ThemeStyles.Size13TextStyleGreyW600,
                  ),
                  if (widget.requiredField)
                    Text(
                      ' *',
                      style: ThemeStyles.Size14TextStyleRedW600,
                    )
                ],
              ),
            ),
        Focus(
            focusNode: widget.focusNode,
            child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 1, 10),
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color:
                          widget.focus ? AppColor.lightYellowColor : widget.color,
                    )),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  widget.icon.isEmpty
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            widget.icon,
                            height: widget.heightIcon,
                            fit: BoxFit.cover,
                          )),
                  widget.icon.isEmpty
                      ? Container()
                      : const VerticalDivider(
                          color: AppColor.lightGrey,
                          thickness: 1,
                        ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          child: DropdownButtonFormField<String>(
                            value: widget.selectedValue,
                            decoration: InputDecoration.collapsed(
                                hintText: widget.optionsType,
                                hintStyle: TextStyle(
                                        color: AppColor.greyColor,
                                        fontSize: widget.textSize),
                                ),
                            items: widget.listItem.map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: AppColor.greyColor,
                                        fontSize: widget.textSize),
                                  ));
                            }).toList(),
                            validator: (value) => value == null
                                ? 'Please Select at least one option from the $widget.optionsType '
                                : null,
                            onChanged: widget.onChanged,
                          )))
                ]))),
      ],
    );
  }
}

class BuildDropdownValue extends StatefulWidget {
  final String optionsType, icon, title;
  final List<Map<String, String>> selectedValue;
  final double width, height, heightIcon, widthIcon, textSize;
  final List<Map<String, String>> listItem;
  final bool focus;
  final FocusNode? focusNode;
  final Color color;
  final bool requiredField;
  final Function(Map<String, String>? value) onChanged;
  const BuildDropdownValue(
      {super.key,
      required this.optionsType,
      required this.width,
      required this.height,
      this.icon = '',
      this.heightIcon = 24.00,
      this.widthIcon = 24.0,
      required this.selectedValue,
      required this.listItem,
      this.focus = false,
      this.focusNode,
      this.color = AppColor.greyColor,
      this.textSize = 16, this.title = '', this.requiredField = false, required this.onChanged, });

  @override
  State<BuildDropdownValue> createState() => _BuildDropdownValueState();
}

class _BuildDropdownValueState extends State<BuildDropdownValue> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.title.isNotEmpty)
         Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: ThemeStyles.Size13TextStyleGreyW600,
                  ),
                  if (widget.requiredField)
                    Text(
                      ' *',
                      style: ThemeStyles.Size14TextStyleRedW600,
                    )
                ],
              ),
            ),
        Focus(
            focusNode: widget.focusNode,
            child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 1, 10),
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color:
                          widget.focus ? AppColor.lightYellowColor : widget.color,
                    )),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  widget.icon.isEmpty
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            widget.icon,
                            height: widget.heightIcon,
                            fit: BoxFit.cover,
                          )),
                  widget.icon.isEmpty
                      ? Container()
                      : const VerticalDivider(
                          color: AppColor.lightGrey,
                          thickness: 1,
                        ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          child: DropdownButtonFormField<Map<String, String>>(
                            value: widget.selectedValue.first,
                            decoration: InputDecoration.collapsed(
                                hintText: 'Select an option $widget.optionsType'),
                            items: widget.listItem.map((Map<String, String> value) {
                                      return DropdownMenuItem<Map<String, String>>(
                                        value: value,
                                        child: Text(value['title']!,
                                        style: TextStyle(
                                        color: AppColor.greyColor,
                                        fontSize: widget.textSize),
                                        ),
                                      );
                                    }).toList(),
                            validator: (value) => value == null
                                ? 'Please Select at least one option from the $widget.optionsType '
                                : null,
                            onChanged: widget.onChanged,
                          )))
                ]))),
      ],
    );
  }
}


class PlanTexField extends StatefulWidget {
  final TextEditingController controller;
  final String title, hint, errorText;
  final bool requiredField, readOnly;
  final TextInputType keyboard;
  final int maxLength;
  final IconData? sufix;
  final int maxChar;
  final  Function(dynamic e)? onChange;
  const PlanTexField(
      {super.key,
      required this.controller,
      this.title = '',
      this.hint = '',
      this.requiredField = false, this.keyboard = TextInputType.name,  this.maxLength = 1, this.sufix, this.errorText = '', this.readOnly = false, this.maxChar = 1,  this.onChange});

  @override
  State<PlanTexField> createState() => _PlanTexFieldState();
}

class _PlanTexFieldState extends State<PlanTexField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: ThemeStyles.Size13TextStyleGreyW600,
                  ),
                  if (widget.requiredField)
                    Text(
                      ' *',
                      style: ThemeStyles.Size14TextStyleRedW600,
                    )
                ],
              ),
            ),
          if (widget.title.isNotEmpty)
            const SizedBox(
              height: 5,
            ),
          Container(
            height: widget.maxLength == 1 ? 45.00 : 25.00 * widget.maxLength as double,
            decoration: BoxDecoration(
              color:  widget.readOnly ? AppColor.lightGrey : Colors.transparent,
              border: Border.all(width: 1, color: AppColor.lightGreyborder),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: TextField(
                onChanged: (e){
                  widget.onChange!(e);
                },
                style: TextStyle(fontSize: 13),
                readOnly: widget.readOnly,
                controller: widget.controller,
                keyboardType: widget.keyboard,
                maxLines: widget.maxLength, 
                maxLength: widget.maxChar == 1 ? null : widget.maxChar,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  border: InputBorder.none,
                  labelStyle: const TextStyle(fontSize: 12),
                   hintText: widget.hint,
                  errorText: widget.errorText.isNotEmpty ? widget.errorText : null,
                  hintStyle: const TextStyle(fontSize: 12,),
                  suffixIcon: widget.sufix != null ? Icon(widget.sufix) : null,
                  suffixIconColor: AppColor.greyColor,
                  semanticCounterText: '',
                  counterText: ''
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class DateTimeWidget extends StatefulWidget {
  final  Null Function(dynamic e) reciveData;
  final String title;
  final bool requiredField;
  const DateTimeWidget({super.key, required this.reciveData, this.title = '', this.requiredField = false});

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  String hintTimeDate = 'Select Date Time';
  Future<void> _selectDateTime(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1970),
    lastDate: DateTime(2099),
  );
  if (pickedDate != null) {
    // ignore: use_build_context_synchronously
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      final formattedTime = DateFormat('hh:mm a').format(DateTime(
          pickedDate.year, pickedDate.month, pickedDate.day,
          pickedTime.hour, pickedTime.minute));  
          setState(() {
            hintTimeDate = '$formattedDate $formattedTime';
          });
        widget.reciveData('$formattedDate $formattedTime');
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: ThemeStyles.Size13TextStyleGreyW600,
                  ),
                  if (widget.requiredField)
                    Text(
                      ' *',
                      style: ThemeStyles.Size14TextStyleRedW600,
                    )
                ],
              ),
            ),
          if (widget.title.isNotEmpty)
            const SizedBox(
              height: 5,
            ),

             Container(
                         height: 45.00,
                         decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.lightGreyborder),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
                         ),
                         child:   Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: TextField(
                onTap: (){
                   _selectDateTime(context);
                },
                readOnly:true,
                decoration:  InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  border: InputBorder.none,
                  labelStyle: const TextStyle(fontSize: 12),
                  hintText: hintTimeDate,
                  hintStyle: const TextStyle(fontSize: 12,),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(top:8),
                    child: Icon(Icons.access_time),
                  ),
                  suffixIconColor: AppColor.greyColor
                ),
              ),
                         ),
                       ),
         
           
          ],
        ),
      );
  }
}



class DateWidget extends StatefulWidget {
  final  Null Function(dynamic e) reciveData;
  final String title, initial;
  final bool requiredField;
  const DateWidget({super.key, required this.reciveData, this.title = '', this.requiredField = false, this.initial = ''});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  String hintTimeDate = 'Select Date';
  Future<void> _selectDateTime(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1970),
    lastDate: DateTime(2099),
  );
  if (pickedDate != null) {
    final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
     setState(() {
            hintTimeDate = formattedDate;
          });
        widget.reciveData(formattedDate);
    
  }
}
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: ThemeStyles.Size13TextStyleGreyW600,
                  ),
                  if (widget.requiredField)
                    Text(
                      ' *',
                      style: ThemeStyles.Size14TextStyleRedW600,
                    )
                ],
              ),
            ),
          if (widget.title.isNotEmpty)
            const SizedBox(
              height: 5,
            ),

             Container(
                         height: 45.00,
                         decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.lightGreyborder),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
                         ),
                         child:   Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: TextField(
                onTap: (){
                   _selectDateTime(context);
                },
                readOnly:true,
                decoration:  InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  border: InputBorder.none,
                  labelStyle: const TextStyle(fontSize: 12),
                  hintText: widget.initial.isEmpty ? hintTimeDate : widget.initial,
                  hintStyle: const TextStyle(fontSize: 12,),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(top:8),
                    child: Icon(Icons.access_time),
                  ),
                  suffixIconColor: AppColor.greyColor
                ),
              ),
                         ),
                       ),
         
           
          ],
        ),
      );
  }
}


class YearWidget extends StatefulWidget {
  final  Null Function(dynamic e) reciveData;
  final String title, initial;
  final bool requiredField;
  const YearWidget({super.key, required this.reciveData, this.title = '', this.requiredField = false, this.initial = ''});

  @override
  State<YearWidget> createState() => _YearWidgetState();
}

class _YearWidgetState extends State<YearWidget> {
 RxInt selectedYear = 0.obs;
  Future<void> _selectDateTime(BuildContext context) async {

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Year', style: TextStyle(fontSize: 13),),
        content: SingleChildScrollView(
          child: Obx(()=>SizedBox(
              width: 200,
              height: 200,
              child: YearPicker(
                firstDate: DateTime(1970),
                lastDate: DateTime.now(),
                selectedDate: DateTime(selectedYear.value) ,
                onChanged: (DateTime newDate) {
                 selectedYear.value = int.parse(newDate.year.toString());
                 widget.reciveData(selectedYear.value);
                },
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: ThemeStyles.Size13TextStyleGreyW600,
                  ),
                  if (widget.requiredField)
                    Text(
                      ' *',
                      style: ThemeStyles.Size14TextStyleRedW600,
                    )
                ],
              ),
            ),
          if (widget.title.isNotEmpty)
            const SizedBox(
              height: 5,
            ),

             Container(
                         height: 45.00,
                         decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.lightGreyborder),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
                         ),
                         child:   Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Obx(()=> TextField(
                  onTap: (){
                     _selectDateTime(context);
                  },
                  readOnly:true,
                  decoration:  InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    border: InputBorder.none,
                    labelStyle: const TextStyle(fontSize: 12),
                    hintText: widget.initial.isEmpty ? (selectedYear.value == 0 ? 'Select Year' : selectedYear.value.toString() ): widget.initial,
                    hintStyle: const TextStyle(fontSize: 12,),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(top:8),
                      child: Icon(Icons.access_time),
                    ),
                    suffixIconColor: AppColor.greyColor
                  ),
                ),
              ),
                         ),
                       ),
         
           
          ],
        ),
      );
  }
}

