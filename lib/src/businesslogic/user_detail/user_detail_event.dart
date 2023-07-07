part of 'user_detail_bloc.dart';

abstract class UserDetailEvent extends Equatable {}

class LoadUserDetailEvent extends UserDetailEvent {
  final int userId;
  LoadUserDetailEvent(this.userId);
  @override
  List<Object?> get props => [userId];
}
