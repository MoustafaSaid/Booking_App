import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/hotels/data/models/hotle_models.dart';
import 'package:dartz/dartz.dart';

class GetAllHotelsUseCase {
  final BaseHotelRepo baseHotelRepo;

  GetAllHotelsUseCase(this.baseHotelRepo);

  Future<Either<Failure,List <HotelDetailsModel>>> call() async {
    return await baseHotelRepo.getAllHotels();
  }
}
