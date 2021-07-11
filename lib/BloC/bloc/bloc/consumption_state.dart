part of 'consumption_bloc.dart';

@immutable
abstract class ConsumptionState extends Equatable {
  const ConsumptionState();
  @override
  List<Object> get props => [];
}

class ConsumptionInitial extends ConsumptionState {}

class ConsumptionLoading extends ConsumptionState {}

class ConsumptionLoaded extends ConsumptionState {
  final List predictedConsumption;

  const ConsumptionLoaded([this.predictedConsumption = const []]);

  @override
  List<Object> get props => [predictedConsumption];
}

class ConsumptionNotLoaded extends ConsumptionState {}
