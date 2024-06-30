import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myankapi/data/service/adapter/service_adapter.dart';
import 'package:myankapi/data/service/entity/service_entity.dart';
import 'package:myankapi/data/service/model/service_model.dart';
import 'package:myankapi/repositories/api_singleton.dart';

part 'visa_state.dart';

class VisaCubit extends Cubit<VisaState> {
  VisaCubit() : super(VisaInitial());

  Future<void> getHomeServices() async {
    emit(HomeVisaLoading());
    try {
      final response = await ApiSingleton.service.getServices(showInHome: true);
      final model = GetServices.fromJson(response);
      final entity = GetServicesAdapter(model).toEntity();
      emit(HomeVisaSuccess(services: entity.data));
    } catch (e) {
      if (e is DioException) {
        emit(HomeVisaFailure(e.message ?? "Something went wrong"));
      } else {
        emit(const HomeVisaFailure('Something went wrong in getting services'));
      }
    }
  }
}
