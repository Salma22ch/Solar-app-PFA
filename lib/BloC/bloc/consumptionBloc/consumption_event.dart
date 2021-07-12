part of 'consumption_bloc.dart';

@immutable
abstract class ConsumptionEvent extends Equatable {
  const ConsumptionEvent();

  @override
  List<Object> get props => [];
}

class LoadPrevConsumption extends ConsumptionEvent {}

class PrevConsumptionLoaded extends ConsumptionEvent {
  final List<dynamic> predcitionConsumptionList;
  final List<dynamic> predictedProductionList;

  const PrevConsumptionLoaded(
      this.predcitionConsumptionList, this.predictedProductionList);
  @override
  List<Object> get props => [predcitionConsumptionList];
}
