import 'package:booking_app/core/util/constaces/app_colors.dart';
import 'package:booking_app/core/util/constaces/dimensions.dart';
import 'package:booking_app/hotels/presentation/components/components.dart';
import 'package:booking_app/hotels/presentation/components/widgets/hotel_item.dart';
import 'package:booking_app/hotels/presentation/components/widgets/small_text.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_filtter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var searchResultController = TextEditingController();

class SearchResultScreen extends StatelessWidget {
  static const routeName = 'SearchResultScreen';

  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HotelCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: Column(
            children: [
              SizedBox(
                height: Dimensions.height45,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: Dimensions.width30 * 1.8,
                    height: Dimensions.height30 * 1.8,
                    decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, LayoutScreen.routeName);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: Dimensions.iconSize30 * 1.3,
                          color: AppColors.mainColor,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: Row(
                  children: [
                    Expanded(
                        child: myForm(
                            controller: searchResultController,
                            hintText: 'London')),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    Container(
                      width: Dimensions.width30 * 2,
                      height: Dimensions.height30 * 2,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: IconButton(
                          onPressed: () {
                            //Search Methood
                          },
                          icon: Icon(
                            Icons.search,
                            size: Dimensions.iconSize30 * 1.5,
                            color: Colors.black45,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: myDivider(),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              //go to filtter page
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallText(text: '530 Hotel Found'),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SearchFiltterScreen.routeName);
                      },
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SmallText(text: 'Filtter'),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Icon(
                            Icons.filter_list,
                            size: Dimensions.iconSize30 * 1.3,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) => HotelItemWidget(
                      onTap: () {
                        cubit.getDetails(index);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailsScreen(),
                            ));
                      },
                      hotelImage: (cubit.allHotelsData!.hotelData![index]
                              .hotelImages!.isEmpty)
                          ? const Image(
                              image: AssetImage("assets/images/no.png"),
                              fit: BoxFit.cover,
                            )
                          : Image(
                              image: NetworkImage(
                                  "http://api.mahmoudtaha.com/images/${cubit.allHotelsData!.hotelData![index].hotelImages![0].image!}"),
                              fit: BoxFit.cover,
                            ),
                      hotelName: cubit.allHotelsData!.hotelData![index].name!,
                      hotelAddress:
                          cubit.allHotelsData!.hotelData![index].address!,
                      hotelPrice:
                          '\$${cubit.allHotelsData!.hotelData![index].price!}',
                    ),
                    itemCount: cubit.allHotelsData!.hotelData!.length,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
            ],
          ),
        );
      },
    );
  }
}
