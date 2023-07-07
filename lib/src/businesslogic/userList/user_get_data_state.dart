part of 'user_get_data_bloc.dart';

@immutable
abstract class UserGetDataState extends Equatable {}

class UserGetDataInitial extends UserGetDataState {
  @override
  List<Object?> get props => [];
}

class UserGetLoadedState extends UserGetDataState {
  final UserDataModel users;
  UserGetLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class UserGetErrorState extends UserGetDataState {
  final String error;
  UserGetErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
