part of 'screenindex_bloc.dart';

@immutable
abstract class ScreenindexEvent {}

class GetIndex extends ScreenindexEvent {
  final int index;
  GetIndex(this.index);
}
