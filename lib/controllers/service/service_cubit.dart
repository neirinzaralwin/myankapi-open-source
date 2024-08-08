import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myankapi/data/service/adapter/service_adapter.dart';
import 'package:myankapi/data/service/entity/service_entity.dart';
import 'package:myankapi/data/service/model/service_model.dart';
import 'package:myankapi/repositories/api_singleton.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());

  Future<void> getHomeServices() async {
    emit(ServiceLoading());
    try {
      final response = await ApiSingleton.service.getServices(showInHome: true);
      final model = GetServices.fromJson(response);
      final entity = GetServicesAdapter(model).toEntity();
      emit(ServiceSuccess(services: entity.data));
    } catch (e) {
      if (e is DioException) {
        emit(ServiceFailure(e.message ?? "Something went wrong"));
      } else {
        emit(const ServiceFailure('Something went wrong in getting services'));
      }
    }
  }
}
