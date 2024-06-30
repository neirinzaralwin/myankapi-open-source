part of 'visa_cubit.dart';

sealed class VisaState extends Equatable {
  const VisaState();

  @override
  List<Object> get props => [];
}

final class VisaInitial extends VisaState {}

final class HomeVisaLoading extends VisaState {}

final class HomeVisaSuccess extends VisaState {
  final List<ServiceEntity> services;
  const HomeVisaSuccess({required this.services});
  @override
  List<Object> get props => [services];
}

final class HomeVisaFailure extends VisaState {
  final String message;
  const HomeVisaFailure(this.message);
  @override
  List<Object> get props => [message];
}
