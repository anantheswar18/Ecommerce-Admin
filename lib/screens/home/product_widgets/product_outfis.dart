import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/screens/update_products/update_outfits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../const/constants.dart';

class ProductOutfitsView extends StatelessWidget {
  ProductOutfitsView({super.key});

  final CollectionReference outfits =
      FirebaseFirestore.instance.collection("Outfits");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: outfits.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot outfitSnapshot =
                      snapshot.data.docs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UpdateOutfitsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 70.w, bottom: 50.w, right: 70.w, top: 20.w),
                      height: 250.h,
                      width: 1000.w,
                      decoration: BoxDecoration(
                        color: greyShade,
                        borderRadius: BorderRadius.circular(36.r),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          SizedBox(
                            width: 200.w,
                            child: ClipRRect(
                              child: Image.network(
                                outfitSnapshot['Image'][0],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          SizedBox(
                              height: 100.h,
                              width: 500.w,
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: TextScroll(
                                  outfitSnapshot['Product Name'],
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500),
                                  velocity:
                                      Velocity(pixelsPerSecond: Offset(30, 0)),
                                  pauseBetween: Duration(milliseconds: 500),
                                  mode: TextScrollMode.bouncing,
                                ),
                              )),
                          Text(outfitSnapshot['Quantity']),
                        ],
                      ),
                    ),
                  );
                });
          }
          return Container();
        });
  }
}
