import '/res/const_variable.dart';
import 'package:flutter/material.dart';
import '../../res/colors/app_color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';
import 'nothavedata.dart';

class ListBuilderNoPage extends StatefulWidget {
  final dynamic data;
  final Table Function(dynamic e) headerWidget;
  final Table Function(dynamic e) bodyWidget;
  const ListBuilderNoPage(
      {super.key,
      required this.data,
      required this.headerWidget,
      required this.bodyWidget});
  @override
  State<ListBuilderNoPage> createState() => _ListBuilderNoPageState();
}

class _ListBuilderNoPageState extends State<ListBuilderNoPage> {
  List cardExpand = [];
  List slideList = [];
  UserPreference userPreference = UserPreference();

  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (widget.data.length != 0) {
      if (isInitialized == false) {
        cardExpand = List.filled(widget.data.length, false);
        slideList = List.filled(widget.data.length, false);
        isInitialized = true;
      }
    }

    final width = MediaQuery.of(context).size.width * 1;
    return Expanded(
      child: (widget.data?.isEmpty ?? true)
        ? const NotData()
        :  ListView.builder(
          //   shrinkWrap: false,
          //  physics:NeverScrollableScrollPhysics(),
          itemCount: widget.data.length + 1,
          itemBuilder: (context, index) {
            if (index < widget.data.length) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    cardExpand[index] = !cardExpand[index];
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: (index % 2) == 0
                                    ? const Color.fromRGBO(231, 250, 232, 1)
                                    : const Color.fromRGBO(255, 249, 241, 1),
                                border: Border.all(
                                    width: 1, color: Colors.transparent),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    child: widget.headerWidget(index),
                                    onLongPress: () {
                                      print('long Press');
                                    },
                                  ),
                                  if (cardExpand[index])
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: widget.bodyWidget(index),
                                    ),
                                ],
                              )),
                          SizedBox(
                            height: cardExpand[index] ? 140 : 90,
                          ),
                          Positioned(
                            left: width / 2.3,
                            bottom: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 90,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cardExpand[index] = !cardExpand[index];
                                  });
                                },
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: cardExpand[index]
                                        ? AppColor.lightYellowColor
                                        : AppColor.blueLight,
                                    child: Icon(
                                      cardExpand[index]
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                      size: 15.0,
                                    )),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return null;
          }),
    );
  }
}

//top colunm and bottom colunm should be equal
class ListBuilder extends StatefulWidget {
  final dynamic data;
  final Null Function(dynamic e) eventEdit;
  final Null Function(dynamic e) eventDelete;
  final Table Function(dynamic e) headerWidget;
  final Table Function(dynamic e) bodyWidget;
  final bool hasMore, slidable;
  final ScrollController controller;
  final List cardexpand, slideList;
  final List<bool> buttonsDisable;
  const ListBuilder(
      {super.key,
      required this.data,
      required this.eventEdit,
      required this.eventDelete,
      required this.hasMore,
      required this.controller,
      required this.headerWidget,
      required this.bodyWidget,
      this.slidable = false,
      required this.cardexpand,
      required this.slideList,
      required this.buttonsDisable});
  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  List cardExpand = [];
  List slideList = [];
  UserPreference userPreference = UserPreference();

  //fetch infinite variables

  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    cardExpand = widget.cardexpand;
    slideList = widget.slideList;

    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Expanded(
      child: (widget.data?.isEmpty ?? true)
        ? const NotData()
        : ListView.builder(
          //   shrinkWrap: false,
          //  physics:NeverScrollableScrollPhysics(),
          controller: widget.controller,
          itemCount: widget.data.length + 1,
          itemBuilder: (context, index) {
            if (index < widget.data.length) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    cardExpand[index] = !cardExpand[index];
                  });
                },
                child: Slidable(
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      if (widget.buttonsDisable[0])
                        SlidableAction(
                          onPressed: (_) {
                            widget.eventEdit(index);
                          },
                          backgroundColor: AppColor.blueDark,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                      if (widget.buttonsDisable[1])
                        SlidableAction(
                          onPressed: (_) {
                            widget.eventDelete(index);
                          },
                          backgroundColor: AppColor.redColor,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: (index % 2) == 0
                                      ? const Color.fromRGBO(231, 250, 232, 1)
                                      : const Color.fromRGBO(255, 249, 241, 1),
                                  border: Border.all(
                                      width: 1, color: Colors.transparent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child: widget.headerWidget(index),
                                      onLongPress: () {
                                        print('long Press');
                                      },
                                    ),
                                    if (cardExpand[index])
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: widget.bodyWidget(index),
                                      ),
                                  ],
                                )),
                            SizedBox(
                              height: cardExpand[index] ? 140 : 90,
                            ),
                            Positioned(
                              left: width / 2.3,
                              bottom: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 90,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cardExpand[index] = !cardExpand[index];
                                    });
                                  },
                                  child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: cardExpand[index]
                                          ? AppColor.lightYellowColor
                                          : AppColor.blueLight,
                                      child: Icon(
                                        cardExpand[index]
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 15.0,
                                      )),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}

class ListBuilderSelectable extends StatefulWidget {
  final dynamic data;
  final Null Function(dynamic e) eventEdit;
  final Null Function(dynamic e) eventDelete;
  final Table Function(dynamic e) headerWidget;
  final Table Function(dynamic e) bodyWidget;
  final Null Function(dynamic e) selectable;
  final bool hasMore, slidable;
  final ScrollController controller;
  final List slideList, cardexpand;
  final List<bool> buttonsDisable;
  const ListBuilderSelectable(
      {super.key,
      required this.data,
      required this.eventEdit,
      required this.eventDelete,
      required this.hasMore,
      required this.controller,
      required this.headerWidget,
      required this.bodyWidget,
      this.slidable = false,
      required this.selectable,
      required this.cardexpand,
      required this.slideList, required this.buttonsDisable});
  @override
  State<ListBuilderSelectable> createState() => _ListBuilderSelectableState();
}

class _ListBuilderSelectableState extends State<ListBuilderSelectable> {
  List cardExpand = [];
  List slideList = [];
  UserPreference userPreference = UserPreference();
  //fetch infinite variables

  bool isInitialized = false;
  bool isdataUpdate = false;
  @override
  Widget build(BuildContext context) {
    cardExpand = widget.cardexpand;
    slideList = widget.slideList;

    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Expanded(
      child: (widget.data?.isEmpty ?? true)
        ? const NotData()
        :  ListView.builder(
          //   shrinkWrap: false,
          //  physics:NeverScrollableScrollPhysics(),
          controller: widget.controller,
          itemCount: widget.data.length + 1,
          itemBuilder: (context, index) {
            if (index < widget.data.length) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    cardExpand[index] = !cardExpand[index];
                  });
                },
                onLongPress: () {
                  setState(() {
                    print('selectable');
                    selectedList[index] = !selectedList[index];
                    widget.selectable(index);
                  });
                },
                child: Slidable(
                  enabled: widget.slidable,
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                        if (widget.buttonsDisable[0])
                        SlidableAction(
                          onPressed: (_) {
                            widget.eventEdit(index);
                          },
                          backgroundColor: AppColor.blueDark,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                      if (widget.buttonsDisable[1])
                        SlidableAction(
                          onPressed: (_) {
                            widget.eventDelete(index);
                          },
                          backgroundColor: AppColor.redColor,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: (index % 2) == 0
                                      ? const Color.fromRGBO(231, 250, 232, 1)
                                      : const Color.fromRGBO(255, 249, 241, 1),
                                  border: Border.all(
                                      width: 1,
                                      color: selectedList[index]
                                          ? AppColor.greenColor
                                          : Colors.transparent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child: widget.headerWidget(index),
                                    ),
                                    if (cardExpand[index])
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: widget.bodyWidget(index),
                                      ),
                                  ],
                                )),
                            SizedBox(
                              height: cardExpand[index] ? 140 : 90,
                            ),
                            Positioned(
                              left: width / 2.3,
                              bottom: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 90,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cardExpand[index] = !cardExpand[index];
                                    });
                                  },
                                  child: selectedList[index]
                                      ? const CircleAvatar(
                                          radius: 10,
                                          backgroundColor: AppColor.greenColor,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 15.0,
                                          ))
                                      : CircleAvatar(
                                          radius: 10,
                                          backgroundColor: cardExpand[index]
                                              ? AppColor.lightYellowColor
                                              : AppColor.blueLight,
                                          child: Icon(
                                            cardExpand[index]
                                                ? Icons.keyboard_arrow_up
                                                : Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                            size: 15.0,
                                          )),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
