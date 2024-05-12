import 'package:disease_detection/common/constants/colors.dart';
import 'package:disease_detection/common/style/text_style.dart';
import 'package:disease_detection/view/classified_diseases_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNeutralBackground,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            vertical: 16.w,
          ),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Grape Leaf Disease Detection",
                style: TextStyleTheme.current.subHeading3Heavy.copyWith(
                  color: kPrimary1,
                ),
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            const ClassifiedDiseasesView(),
            SizedBox(
              height: 24.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Jenis penyakit tanaman anggur",
                style: TextStyleTheme.current.bodyText2Heavy,
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            SizedBox(
              height: 112.w,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardLeafType(
                    context: context,
                    image: "assets/images/busuk.jpg",
                    title: "Grape Black Rot",
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  cardLeafType(
                    context: context,
                    image: "assets/images/esca.jpg",
                    title: "Grape Esca",
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  cardLeafType(
                    context: context,
                    image: "assets/images/hawar.jpg",
                    title: "Grape Hawar",
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  cardLeafType(
                    context: context,
                    image: "assets/images/sehat.jpg",
                    title: "Grape Healty",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget cardLeafType({
    required BuildContext context,
    required String image,
    required String title,
  }) {
    return Container(
      // height: 120.w,
      width: 120.w,
      padding: EdgeInsets.only(top: 6.w, left: 6.w, right: 6.w),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: kPrimary1),
        borderRadius: BorderRadius.circular(6.r),
        color: kNeutral0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw,
            height: 74.w,
            decoration: BoxDecoration(
              color: kNeutral50,
              borderRadius: BorderRadius.circular(
                4.r,
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image),
              ),
            ),
          ),
          SizedBox(
            height: 4.w,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyleTheme.current.bodyText3Light.copyWith(
              color: kNeutral500,
            ),
          )
        ],
      ),
    );
  }
}
