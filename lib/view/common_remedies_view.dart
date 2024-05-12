import 'package:disease_detection/common/constants/colors.dart';
import 'package:disease_detection/common/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonRemediesView extends StatelessWidget {
  const CommonRemediesView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kPrimary1,
      ),
    );
    return Scaffold(
      backgroundColor: kNeutralBackground,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
          shrinkWrap: true,
          children: [
            Text(
              "Pencegahan umum penyakit tanaman anggur",
              style: TextStyleTheme.current.bodyText1Heavy,
            ),
            SizedBox(
              height: 12.w,
            ),
            Text(
              "A. Daun Anggur Esca",
              style: TextStyleTheme.current.bodyText2Heavy,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "1. Gunakan metode pemangkasan alternatif, seperti penundaan pemangkasan atau pemangkasan dua kali.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "2. Hindari pemangkasan selama periode hujan lebat ketika spora penyakit cenderung tersebar.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "3. Pantau kebun anggur pada musim semi, dan cari daun-daun taji yang mati atau pucuk-pucuk yang kerdil.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
              "B. Daun Anggur Busuk",
              style: TextStyleTheme.current.bodyText2Heavy,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "1. Lakukan pemupukan berimbang antara nitrogen dan kalium.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "2. Gunakan pupuk organik atau hasil fermentasi untuk memperkaya berbagai jenis bakteri menguntungkan.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "3. Lakukan pembersihan lingkungan dari gulma inang dan sisa tanaman anggur yang dapat menjadi tempat perlindungan bakteri penyebab penyakit ini.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
              "C. Daun Anggur Hawar",
              style: TextStyleTheme.current.bodyText2Heavy,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "1. Jaga kebersihan kebun untuk mencegah munculnya larva, belatung, dan ulat grayak.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "2. Lakukan pemangkasan daun dan cabang pohon agar tanaman tidak terlalu rimbun.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 4.w,
            ),
            Text(
              "3. Semprotkan insektisida jenis regen untuk mengendalikan ulat grayak.",
              style: TextStyleTheme.current.bodyText2Light,
            ),
            SizedBox(
              height: 8.w,
            ),
          ],
        ),
      ),
    );
  }
}
