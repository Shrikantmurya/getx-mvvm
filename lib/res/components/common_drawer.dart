import 'package:flutter/material.dart';

import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommonDrawer extends StatefulWidget {
  final List<Map<String, dynamic>> draweList;
  final String text, imgUrl;
  final Color color;
  const CommonDrawer(
      {super.key,
      required this.draweList,
      required this.text,
      required this.imgUrl,
      this.color = Colors.blueAccent});

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  List showSubmenu = [];
  List showSupersubmenu = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSubmenu = List.filled(widget.draweList.length, false);
    int maxSubMenuLength = findMaxSubMenuLength(widget.draweList);
    showSupersubmenu = List.filled(maxSubMenuLength, false);
  }

  int findMaxSubMenuLength(List<Map<String, dynamic>> list) {
    int maxLength = 0;
    for (var item in list) {
      if (item.containsKey("submenuData")) {
        List<dynamic> submenuData = item["submenuData"];
        maxLength =
            maxLength < submenuData.length ? submenuData.length : maxLength;
      }
    }

    return maxLength;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        //drawer start
        DrawerHeader(
            decoration: BoxDecoration(
              color: widget.color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                    height: 85,
                    width: 85,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[500],
                          radius: 70,
                          child: CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.white,
                            child: CachedNetworkImage(
                              imageUrl: widget.imgUrl,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        Positioned(
                            top: -5,
                            right: 3,
                            height: 22,
                            width: 22,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.green,

                              // padding: EdgeInsets.all(1.0),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(widget.text, style: ThemeStyles.t18TextStyleWhite),
                const SizedBox(
                  height: 5,
                ),
              ],
            )),

        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.draweList.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return widget.draweList[index]['subMenu']
                  ? Column(
                      children: [
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 15, 0),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                  width: 1.0,
                                                  color: Color(0xFFB9B6B6)),
                                            ),
                                          ),
                                          child: Icon(
                                            widget.draweList[index]['icon'],
                                            color: widget.color,
                                            size: 20.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          widget.draweList[index]['title'],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      showSubmenu[index]
                                          ? Icons.minimize_outlined
                                          : Icons.add,
                                      color: const Color(0xFFB9B6B6),
                                      size: 24.0,
                                    ),
                                  ],
                                )),
                          ),
                          onTap: () {
                            setState(() {
                              showSubmenu[index] = !showSubmenu[index];
                            });
                          },
                        ),
                        if (showSubmenu[index])
                          Container(
                            color: Color.fromARGB(255, 239, 239, 239),
                            child: Column(
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget
                                        .draweList[index]['submenuData'].length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(10),
                                    itemBuilder: (context, indexsub) {
                                      return widget.draweList[index]
                                                  ['submenuData'][indexsub]
                                              ['supersubmenu']
                                          ? GestureDetector(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20,
                                                            bottom: 20),
                                                    child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                15, 0, 15, 0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Wrap(
                                                              children: [
                                                                Text(
                                                                  widget.draweList[index]
                                                                              [
                                                                              'submenuData']
                                                                          [
                                                                          indexsub]
                                                                      ['title'],
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ],
                                                            ),
                                                            Icon(
                                                              showSupersubmenu[
                                                                      index]
                                                                  ? Icons
                                                                      .minimize_outlined
                                                                  : Icons.add,
                                                              color:
                                                                  widget.color,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  //supersub menu
                                                  if (showSupersubmenu[index])
                                                    Container(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              207,
                                                              205,
                                                              205),
                                                      child: Column(
                                                        children: [
                                                          ListView.builder(
                                                              shrinkWrap: true,
                                                              itemCount: widget
                                                                  .draweList[
                                                                      index]
                                                                      [
                                                                      'submenuData']
                                                                      [
                                                                      indexsub]
                                                                      [
                                                                      'supersubData']
                                                                  .length,
                                                              physics:
                                                                  const NeverScrollableScrollPhysics(),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              itemBuilder: (context,
                                                                  indexsupersub) {
                                                                return ListTile(
                                                                  leading: Icon(
                                                                    Icons
                                                                        .double_arrow,
                                                                    color: widget
                                                                        .color,
                                                                    size: 20.0,
                                                                  ),
                                                                  title: Text(
                                                                    widget.draweList[index]['submenuData'][indexsub]['supersubData']
                                                                            [
                                                                            indexsupersub]
                                                                        [
                                                                        'title'],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                  onTap: widget.draweList[index]['submenuData']
                                                                              [
                                                                              indexsub]
                                                                          [
                                                                          'supersubData']
                                                                      [
                                                                      indexsupersub]['event'],
                                                                );
                                                              }),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  showSupersubmenu[index] =
                                                      !showSupersubmenu[index];
                                                });
                                              },
                                            )
                                          : ListTile(
                                              leading: Icon(
                                                Icons.double_arrow,
                                                color: widget.color,
                                                size: 20.0,
                                              ),
                                              title: Text(
                                                widget.draweList[index]
                                                        ['submenuData']
                                                    [indexsub]['title'],
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              onTap: widget.draweList[index]
                                                      ['submenuData'][indexsub]
                                                  ['event'],
                                            );
                                    }),
                              ],
                            ),
                          ),
                      ],
                    )
                  : ListTile(
                      leading: Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                                width: 1.0, color: Color(0xFFB9B6B6)),
                          ),
                        ),
                        child: Icon(
                          widget.draweList[index]['icon'],
                          color: widget.color,
                          size: 22.0,
                        ),
                      ),
                      title: Text(
                        widget.draweList[index]['title'],
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: widget.draweList[index]['event'],
                    );
            }),
      ],
    );
  }
}
