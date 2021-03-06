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
  final List<dynamic> predictedConsumptionList;
  final List<dynamic> predictedProductionList;

  const ConsumptionLoaded(
      [this.predictedConsumptionList = const [],
      this.predictedProductionList = const []]);

  @override
  List<Object> get props => [predictedConsumptionList];
}

class ConsumptionNotLoaded extends ConsumptionState {}
