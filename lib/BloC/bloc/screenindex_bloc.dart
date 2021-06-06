import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'screenindex_event.dart';

class ScreenindexBloc extends Bloc<ScreenindexEvent, int> {
  ScreenindexBloc() : super(0);

  @override
  Stream<int> mapEventToState(
    ScreenindexEvent event,
  ) async* {
    if (event is GetIndex) {
      switch (event.index) {
        case 0:
          yield 0;
          break;
        case 1:
          yield 1;
          break;
        case 2:
          yield 2;
          break;
        default:
      }
    }
  }
}
