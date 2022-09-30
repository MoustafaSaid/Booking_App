import 'dart:ui';

import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/widgets/big_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/my_button_widget.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_headline_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/components/widgets/static_color_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../booking_screen/booking_screen.dart';

class BackGroundDetailsPage extends StatefulWidget {
  const BackGroundDetailsPage({Key? key}) : super(key: key);

  @override
  State<BackGroundDetailsPage> createState() => _BackGroundDetailsPageState();
}

class _BackGroundDetailsPageState extends State<BackGroundDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var cubit = HotelCubit.get(context);

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              )),
              //background Image
              child: Image(
                image: NetworkImage(
                    "http://api.mahmoudtaha.com/images/${cubit.hotelDetails!.hotelImages![0].image}"),
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //card
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: SizedBox(
                      height: Dimensions.cardDetaialsImageHeight,
                      width: double.infinity,
                      child: ClipRect(
                        child: Card(
                          color: HotelCubit.get(context).isDark
                              ? Colors.grey[200]
                              : Colors.black87,

                          // color: Colors.white70.withOpacity(.2),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width15,
                                right: Dimensions.width15,
                                top: Dimensions.height20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallHeadLineText(
                                  color: Colors.white,
                                  size: Dimensions.font20,
                                  maxLines: 1,
                                  text: cubit.hotelDetails!.name!,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        //address
                                        SmallText(
                                          maxLines: 2,
                                          color: Colors.white70,
                                          text: cubit.hotelDetails!.address!,
                                        ),
                                        SizedBox(
                                          height: Dimensions.height10 / 2,
                                        ),
                                        //rate
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.teal,
                                              size: Dimensions.iconSize16 * 1.5,
                                            ),
                                            SizedBox(
                                              height: Dimensions.height10 / 2,
                                            ),
                                            SmallText(
                                                color: Colors.white70,
                                                text:
                                                    cubit.hotelDetails!.rate!),
                                            SizedBox(
                                              width: Dimensions.width10 / 1.5,
                                            ),
                                            Icon(
                                              Icons.location_pin,
                                              color: Colors.teal,
                                              size: Dimensions.iconSize16 * 1.3,
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10 / 5,
                                            ),
                                            SmallText(
                                              color: Colors.white70,
                                              text: '40.0 Km ',
                                              size: Dimensions.font16 * .9,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Column(
                                      children: [
                                        SmallHeadLineText(
                                          size: Dimensions.font20,
                                          text:
                                              "\$${cubit.hotelDetails!.price!}",
                                        ),
                                        const SmallText(
                                          color: Colors.white70,
                                          text: "/per night,",
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                MyButtonWidget(
                                  text: 'Book now',
                                  isPadding: false,
                                  height: Dimensions.height30 * 1.7,
                                  onTap: () {
                                    cubit.createBookings(cubit.hotelDetails!.id!, cubit.userId);
                                    Navigator.pushNamed(context, BookingScreen.routeName );

                                  },
                                ),
                                SizedBox(
                                  height: Dimensions.height15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //more details
                  SizedBox(
                    height: Dimensions.height10 / 2,
                  ),
                  Center(
                    child: SizedBox(
                      height: Dimensions.cardMoreDetaialsHeight,
                      width: Dimensions.cardMoreDetaialsWidth,
                      child: Card(
                        color: HotelCubit.get(context).isDark
                            ? Colors.grey[200]
                            : Colors.black87,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 2, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SmallHeadLineText(
                              color: Colors.white70,
                              text: 'More Details',
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: HotelCubit.get(context).isDark
                                  ? Colors.black87
                                  : Colors.grey[200],
                              size: Dimensions.iconSize30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
