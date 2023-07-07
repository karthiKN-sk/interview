part of 'user_get_data_bloc.dart';

@immutable
abstract class UserGetDataEvent extends Equatable {}

class LoadUserEvent extends UserGetDataEvent {
  final int pageNumber;
  LoadUserEvent(this.pageNumber);
  @override
  List<Object?> get props => [pageNumber];
}
