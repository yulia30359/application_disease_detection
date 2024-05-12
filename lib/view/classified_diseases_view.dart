import 'dart:developer' as devtools;
import 'dart:io';

import 'package:disease_detection/common/constants/colors.dart';
import 'package:disease_detection/common/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

class ClassifiedDiseasesView extends StatefulWidget {
  const ClassifiedDiseasesView({super.key});

  @override
  State<ClassifiedDiseasesView> createState() => _ClassifiedDiseasesViewState();
}

class _ClassifiedDiseasesViewState extends State<ClassifiedDiseasesView>
    with AutomaticKeepAliveClientMixin {
  File? filePath;
  String label = '?';
  double confidence = 0.0;

  Future<void> _tfLteInit() async {
    await Tflite.loadModel(
        model: "assets/tensorflow/diseaseDetection.tflite",
        labels: "assets/tensorflow/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(
      () {
        confidence = (recognitions[0]['confidence'] * 100);
        label = recognitions[0]['label'].toString();
      },
    );
  }

  pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
    devtools.log(recognitions.toString());
    setState(
      () {
        confidence = (recognitions[0]['confidence'] * 100);
        label = recognitions[0]['label'].toString();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    _tfLteInit();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 16.w, left: 22.w, right: 22.w, bottom: 12.w),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: kPrimary1,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Container(
                height: 0.7.sw,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    scale: 2,
                    image: AssetImage('assets/images/splash_logo.jpg'),
                  ),
                ),
                child: filePath == null
                    ? const Text('')
                    : DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(
                              filePath ?? File(''),
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Diagnose : ",
                    style: TextStyleTheme.current.bodyText1Light.copyWith(
                      color: kNeutral0,
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyleTheme.current.bodyText1Heavy.copyWith(
                      color: kNeutral0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "The Accuracy is ",
                    style: TextStyleTheme.current.bodyText1Light.copyWith(
                      color: kNeutral0,
                    ),
                  ),
                  Text(
                    "${confidence.toStringAsFixed(0)}%",
                    style: TextStyleTheme.current.bodyText1Heavy.copyWith(
                      color: kNeutral0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                pickImageCamera();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary1,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8).w,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                foregroundColor: kNeutral0,
              ),
              child: Row(
                children: [
                  const Icon(Icons.photo_camera),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Take a Photo",
                    style: TextStyleTheme.current.bodyText2Light,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            ElevatedButton(
              onPressed: () {
                pickImageGallery();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary1,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8).w,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                foregroundColor: kNeutral0,
              ),
              child: Row(
                children: [
                  const Icon(Icons.photo_library),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Pick from gallery",
                    style: TextStyleTheme.current.bodyText2Light,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
