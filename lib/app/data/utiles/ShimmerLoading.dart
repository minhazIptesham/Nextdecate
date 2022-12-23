import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

double _containerHeight = 20;
double _spaceHeight = 10;
Color _shimmerColor = Colors.grey;
Color _shimmerColorDark = Colors.grey.shade200;

class ShimmerLoading {
  /// to do list
  Widget buildShimmerHomeContent() {
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 19.9, 0),
                child: Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor!,
                  period: Duration(milliseconds: 1000),
                  child:  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.white,
                            ),
                            child: Container(
                              width: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                height: _spaceHeight,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                height: _spaceHeight,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                width: 100,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  color: _shimmerColor,
                  height: 1),
            ],
          );
        },
      ),
    );
  }

  Widget buildShimmerContent() {
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 19.9, 0),
                child: Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.white,
                            ),
                            child: Container(
                              width: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                height: _spaceHeight,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                height: _spaceHeight,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: _shimmerColor,
                                ),
                                height: _containerHeight,
                                width: 100,
                                child: Container(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  period: Duration(milliseconds: 1000),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  color: _shimmerColor,
                  height: 1),
            ],
          );
        },
      ),
    );
  }

  Widget buildShimmerImageHorizontal(boxImageSize) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        padding: EdgeInsets.only(right: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Container(
                    width: boxImageSize,
                    height: boxImageSize,
                    color: _shimmerColor,
                  ),
                ),
              ),
              period: Duration(milliseconds: 1000),
            ),
          );
        },
      ),
    );
  }

  Widget buildShimmerRelatedProduct(boxImageSize) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 8,
        padding: EdgeInsets.only(left: 12, right: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              color: Colors.white,
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: _shimmerColor,
                period: Duration(milliseconds: 1000),
                child: Container(
                  width: boxImageSize,
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                          width: boxImageSize,
                          height: boxImageSize,
                          color: _shimmerColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                              width: 50,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Row(
                              children: [
                                for (int i = 1; i <= 5; i++)
                                  Icon(Icons.star,
                                      color: _shimmerColor, size: 12),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildShimmerProductDetails(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[


          Shimmer.fromColors(
            highlightColor: Colors.grey.shade200,
            baseColor: _shimmerColor,
            period: const Duration(milliseconds: 3000),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: Container(
                 margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                width: double.infinity,
                height: 300 ,
                color: _shimmerColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      color: _shimmerColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: double.infinity,
                      height: 15,
                      color: _shimmerColor,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: double.infinity,
                      height: 15,
                      color: _shimmerColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: double.infinity,
                      height: 15,
                      color: _shimmerColor,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      color: _shimmerColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: double.infinity,
                      height: 15,
                      color: _shimmerColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: double.infinity,
                      height: 15,
                      color: _shimmerColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: double.infinity,
                      height: 15,
                      color: _shimmerColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShimmerHomeFlashsale(boxImageSize) {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.only(left: 12, right: 12),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0.1,
            color: Colors.white,
            child: Container(
              width: boxImageSize,
              height: boxImageSize + 100,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: _shimmerColor,
                        period: Duration(milliseconds: 1000),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Container(
                            width: boxImageSize + 40,
                            height: boxImageSize,
                            color: _shimmerColor,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 10,
                        child: Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: _shimmerColorDark,
                          period: Duration(milliseconds: 1000),
                          child: Container(
                            decoration: BoxDecoration(
                                color: _shimmerColorDark,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    bottomLeft: Radius.circular(6))),
                            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                            child: Container(
                              width: 20,
                              height: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: _shimmerColor,
                    period: Duration(milliseconds: 1000),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerHorizontalProduct(boxImageSize) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      padding: EdgeInsets.only(left: 12, right: 12),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              period: Duration(milliseconds: 1000),
              child: Container(
                width: boxImageSize,
                height: boxImageSize,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                          width: boxImageSize,
                          height: boxImageSize,
                          color: _shimmerColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                              width: 50,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Row(
                              children: [
                                for (int i = 1; i <= 5; i++)
                                  Icon(Icons.star,
                                      color: _shimmerColor, size: 12),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerHomeBanner(homeBannerWidth, homeBannerHeight) {
    return Column(
      children: [
        Container(
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: _shimmerColor,
            child: Container(
              child: Container(
                width: homeBannerWidth,
                height: homeBannerHeight,
                color: _shimmerColor,
              ),
            ),
            period: Duration(milliseconds: 1000),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _shimmerColor,
                ),
              );
            })),
      ],
    );
  }

  Widget buildShimmerCategoryBanner(homeBannerWidth, homeBannerHeight) {
    return Container(
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        child: Container(
          child: Container(
            width: homeBannerWidth,
            height: homeBannerHeight,
            color: _shimmerColor,
          ),
        ),
        period: Duration(milliseconds: 1000),
      ),
    );
  }

  Widget buildShimmerFlashsale(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      primary: false,
      childAspectRatio: 4 / 6.7,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: _shimmerColor,
                      period: Duration(milliseconds: 1000),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                          width: boxImageSize,
                          height: boxImageSize,
                          color: _shimmerColor,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 10,
                      child: Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: _shimmerColorDark,
                        period: Duration(milliseconds: 1000),
                        child: Container(
                          decoration: BoxDecoration(
                              color: _shimmerColorDark,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6))),
                          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: Container(
                            width: 20,
                            height: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildShimmerProduct(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      primary: false,
      childAspectRatio: 5 / 8,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              period: Duration(milliseconds: 1000),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Container(
                        width: boxImageSize,
                        height: boxImageSize,
                        color: _shimmerColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: 12,
                            width: 50,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Row(
                            children: [
                              for (int i = 1; i <= 5; i++)
                                Icon(Icons.star,
                                    color: _shimmerColor, size: 12),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildShimmerTrending(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      primary: false,
      childAspectRatio: 4 / 1.6,
      shrinkWrap: true,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return Container(
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              color: Colors.white,
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: _shimmerColor,
                period: Duration(milliseconds: 1000),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: Container(
                          width: (boxImageSize) * (1.6 / 4) - 12 - 1,
                          height: (boxImageSize) * (1.6 / 4) - 12 - 1,
                          color: _shimmerColor,
                        )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      }),
    );
  }

  /// Home Slider done
  Widget buildShimmerHomeSlider() {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.green.withOpacity(0.2),
      period: Duration(milliseconds: 1000),
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10)),
            color: Colors.green,
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        /*  SizedBox(
          height: _spaceHeight,
        ),
        Container(
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: _shimmerColor,
          ),
          height: 12,
        ),*/
      ]),
    );
  }

  /// Category Done
  Widget buildShimmerCategory() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.green.withOpacity(0.2),
          period: Duration(milliseconds: 1000),
          child: Column(children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.green,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(
              height: _spaceHeight,
            ),
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _shimmerColor,
              ),
              height: 12,
            ),
          ]),
        );
      },
    );
  }

  /// Product Card Item
  Widget buildShimmerProductCardItemHZ() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.green.withOpacity(0.2),
          period: Duration(milliseconds: 1000),
          child: Column(children: [
            Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.green,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(
              height: _spaceHeight,
            ),
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _shimmerColor,
              ),
              height: 12,
            ),
            SizedBox(
              height: _spaceHeight,
            ),
            Container(
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _shimmerColor,
              ),
              height: 12,
            ),
          ]),
        );
      },
    );
  }

  Widget buildShimmerReviewProduct() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: _shimmerColor,
          period: Duration(milliseconds: 1000),
          child: Container(
            child: Column(
              children: [
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerReview() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            margin: EdgeInsets.only(top: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: _shimmerColor,
              period: Duration(milliseconds: 1000),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: _containerHeight,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: _containerHeight,
                          ),
                          SizedBox(
                            height: _spaceHeight,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _shimmerColor,
                            ),
                            height: _containerHeight,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmerCategoryForYou(homeBannerWidth, homeBannerHeight) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        child: Container(
          child: Container(
            width: homeBannerWidth,
            height: homeBannerHeight,
            color: _shimmerColor,
          ),
        ),
        period: Duration(milliseconds: 1000),
      ),
    );
  }

  Widget buildShimmerSearch() {
    return Container(
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        period: Duration(milliseconds: 1000),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildBasicShimmer(
      {double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: _shimmerColor,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }
}
