import 'package:disease_detection/common/constants/colors.dart';
import 'package:disease_detection/common/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNeutralBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 22.w,
            ),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: kNeutral0,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  width: 1.w,
                  color: kPrimary1,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Image.asset(
                          "assets/icons/profile.png",
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yulia Eka Pristia",
                            style: TextStyleTheme.current.subHeading3Light,
                          ),
                          Text(
                            "Jakarta Timur",
                            style:
                                TextStyleTheme.current.bodyText2Light.copyWith(
                              color: kNeutral500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Text(
                    "Information",
                    style: TextStyleTheme.current.subHeading3Light,
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "NPM",
                        style: TextStyleTheme.current.bodyText1Light
                            .copyWith(color: kNeutral500),
                      ),
                      Text(
                        "51421636",
                        style: TextStyleTheme.current.bodyText1Light,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kampus",
                        style: TextStyleTheme.current.bodyText1Light
                            .copyWith(color: kNeutral500),
                      ),
                      Text(
                        "Universitas Gunadarma",
                        style: TextStyleTheme.current.bodyText1Light,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fakultas",
                        style: TextStyleTheme.current.bodyText1Light
                            .copyWith(color: kNeutral500),
                      ),
                      Text(
                        "Teknologi Industri",
                        style: TextStyleTheme.current.bodyText1Light,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jurusan",
                        style: TextStyleTheme.current.bodyText1Light
                            .copyWith(color: kNeutral500),
                      ),
                      Text(
                        "Informatika",
                        style: TextStyleTheme.current.bodyText1Light,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Container(
                    width: 1.sw,
                    height: 120.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/banner_plant.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.w,
            ),
            Text(
              "App Version : 1.0.0",
              textAlign: TextAlign.center,
              style: TextStyleTheme.current.bodyText2Heavy.copyWith(
                color: kNeutral500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
