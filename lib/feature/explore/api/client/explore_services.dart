import 'package:elearning/feature/explore/api/models/subject_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/end_point_constants.dart';
part 'explore_services.g.dart';

@RestApi(
  baseUrl: EndPointsConstants.baseUrl
)
@injectable
abstract class ExploreServices{
  @factoryMethod
  factory ExploreServices(Dio dio)=_ExploreServices;
  @GET(EndPointsConstants.subjectsEndPoint)
  Future<SubjectModel>getAllSubjects();

}