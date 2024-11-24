import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine/features/home_page/persntation/view/screen/nearby/custom.dart';

List<String> customName = [
  "EL Ezaby Pharmacy",
  "Al-Tarshoubi",
  "Egypt Pharmacy",
  "Al-Rashidi",
  "Alexandria pharmacies",
  "Nour Pharmacy",
];
List<String> customImage = [
  'assets/images/ma.jpg',
  'assets/images/22.jpg',
  'assets/images/ma2.png',
  'assets/images/ma3.png',
  'assets/images/ma4.png',
  'assets/images/ma5.png',

];
List<String> customdes = [
  "Mansoura,El Mashaya El Sofliah",
  "Belqas, Industry Street",
  "Mansoura,El Mashaya El upper",
  "Mansoura, Ahmed Maher Street",
  "Mansoura, Cihan Street",
  "Cairo, Tahrir Street",
];

class NearbyPharmacies extends StatelessWidget {
  const NearbyPharmacies({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(child: Text("NearbyPharmacies!",style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25.sp,
            ),)),
            SizedBox(height: 25.sp),

            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: customName.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                      child: Custom
                        (
                        dec: customdes[index],
                          label: customName[index],
                          image: customImage[index],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

