import 'package:booking_app/core/services/blocobserver.dart';
import 'package:booking_app/core/services/services_locator.dart';
import 'package:booking_app/hotels/presentation/controller/hotel_cubit.dart';
import 'package:booking_app/hotels/presentation/layout/layout.dart';
import 'package:booking_app/hotels/presentation/screens/details_screen/details_screen.dart';
import 'package:booking_app/hotels/presentation/screens/home_screen/home_screen.dart';
import 'package:booking_app/hotels/presentation/screens/login_screen/login_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_result_screen.dart';
import 'package:booking_app/hotels/presentation/screens/search_screen/search_filtter_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'hotels/presentation/screens/register_screen/register_screen.dart';

void main() async {
  ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();

  // RemoteDataSource remoteDataSource=RemoteDataSource();
  // RegisterRequestModel registerRequestModel=RegisterRequestModel(name: "Leo messi", email: "GOAT@gmail.com", password: "1234567", passwordConfirmation: "1234567", image: "");
  // LoginRequestModel loginRequestModel=LoginRequestModel(email: "mmmmmmmmmmmmmm@gmail.com", password: "1234567");
  // remoteDataSource.getAllHotelsDetails(1);
  //  remoteDataSource.userLogin(loginRequestModel);
  //  remoteDataSource.createBooking(152, 9);
  //  remoteDataSource.getBookings("upcomming", 10);
  //  remoteDataSource.getFacilities();
  //  remoteDataSource.updateBookingStatus(113, "completed");
  //  remoteDataSource.updateUserInfo(registerRequestModel);
  //  remoteDataSource.searchHotels(page: "",count: "10",maxPrice: "5000",minPrice: "100",address: "",name: "",distance: "",latitude: "",longitude: "");
  //  var cubit=HotelCubit.get(context);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HotelCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const RegisterScreen(),
        routes: {
          // WeatherMainScreen.routeName:(context)=>WeatherMainScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          DetailsScreen.routeName: (context) => const DetailsScreen(),
          SearchFiltterScreen.routeName: (context) =>
              const SearchFiltterScreen(),
          SearchResultScreen.routeName: (context) => const SearchResultScreen(),
          LayoutScreen.routeName: (context) => const LayoutScreen(),
        },
      ),
    );
  }
}
