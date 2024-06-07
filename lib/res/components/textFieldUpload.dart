import 'dart:io';

import '/utils/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';

class TexFieldUpload extends StatefulWidget {
  final String title, fileUrl;
  final bool requiredField, readOnly, sm;
  final double width;
  final Future<String> Function() onTap;
  final Function() delete;
  const TexFieldUpload({
    super.key,
    this.title = '',
    this.requiredField = false,
    this.readOnly = false,
    this.width = 1.0,
    required this.fileUrl, required  this.onTap, required this.delete, this.sm = false, 
  });

  @override
  State<TexFieldUpload> createState() => _TexFieldUploadState();
}

class _TexFieldUploadState extends State<TexFieldUpload> {
  RxString uploadFileName = ''.obs;
  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width * 1;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                   // width: width/ 2.8,
                    child: Text(
                      widget.title,
                      style:  const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.greyColor,
                          overflow: TextOverflow.ellipsis,
                          
                          ),
                          softWrap: false,
                    ),
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
          widget.fileUrl.isNotEmpty
              ? Stack(
                  children: [
                    
                    GestureDetector(
                      onTap: () async {
                        if (kDebugMode) {
                          print('view launchar');
                        }
                     
                        if (await canLaunch(widget.fileUrl)) {
                              await launch(widget.fileUrl, forceWebView: false,);
                            } 
                        // await launchUrl(Uri.parse(widget.fileUrl), mode: LaunchMode.externalNonBrowserApplication);
                        },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: [8, 0],
                        color: AppColor.lightBlackColor.withOpacity(0.3),
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: SizedBox(
                            width:
                                MediaQuery.of(context).size.width * widget.width,
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Utils.getFileExtension(widget.fileUrl)
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    color: AppColor.lightBlue,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  Utils.getFilenameFromUrl(widget.fileUrl,),
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                    
                      top: -12,
                      right: -12,
                      child: IconButton(
                        onPressed: widget.delete,
                        icon: const Icon(Icons.delete),
                        color: AppColor.redColor,
                        iconSize: 20,
                      ),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: ()  async {
                  //  widget.onTap();
                    uploadFileName.value = await widget.onTap();
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [8, 15],
                    color: AppColor.lightBlackColor.withOpacity(0.3),
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * widget.width,
                        child: widget.sm ?  Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.cloud_upload,
                              size: 40,
                              color: AppColor.greyColor,
                            ),
                            const SizedBox(width: 10,),
                            Obx(()=> Text(uploadFileName.isEmpty ? 'Choose File' : uploadFileName.toString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ) :  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cloud_upload,
                              size: 40,
                              color: AppColor.greyColor,
                            ),
                            Text(uploadFileName.isEmpty ? 'Choose File' : uploadFileName.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ),
        ],
      ),
    );
  }
}
