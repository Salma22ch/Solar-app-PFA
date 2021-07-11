import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'consumption_event.dart';
part 'consumption_state.dart';

class ConsumptionBloc extends Bloc<ConsumptionEvent, ConsumptionState> {
  ConsumptionBloc() : super(ConsumptionInitial());

  // final UserRepository _userRepository;
  // StreamSubscription? _wuserRepositorySubscription;

  @override
  Stream<ConsumptionState> mapEventToState(
    ConsumptionEvent event,
  ) async* {
    if (event is LoadPrevConsumption) {
      yield* _mapLoadPrevConsumptionToState();
    } else if (event is PrevConsumptionLoaded) {
      yield* _mapPrevConsumptionLoadedToState(event);
    }
  }

  Stream<ConsumptionState> _mapLoadPrevConsumptionToState() async* {
    // _wuserRepositorySubscription?.cancel();
    // _wuserRepositorySubscription =
    //     _userRepository.user().listen((event) => add(UserUpdated(event)));
    yield ConsumptionLoading();
  }

  Stream<ConsumptionState> _mapPrevConsumptionLoadedToState(
      PrevConsumptionLoaded event) async* {
    yield ConsumptionLoaded(event.predcitionConsumptionList);
  }

  @override
  Future<void> close() {
    //_wuserRepositorySubscription?.cancel();
    return super.close();
  }
}
