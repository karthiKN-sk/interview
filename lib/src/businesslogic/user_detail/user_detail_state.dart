part of 'user_detail_bloc.dart';

abstract class UserDetailState extends Equatable {}

class UserDetailInitial extends UserDetailState {
  @override
  List<Object?> get props => [];
}

class UserDetailLoadedState extends UserDetailState {
  final UserDetailModel users;
  UserDetailLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class UserDetailErrorState extends UserDetailState {
  final String error;
  UserDetailErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
