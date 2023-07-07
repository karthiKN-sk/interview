import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/userdetail_model.dart';
import '../../repo/repo.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final DioClient _dio;
  UserDetailBloc(this._dio) : super(UserDetailInitial()) {
    on<LoadUserDetailEvent>((event, emit) async {
      emit(UserDetailInitial());
      try {
        var users = await _dio.getUserDetail(userId: event.userId);
        print("users");
        print(users);
        emit(UserDetailLoadedState(users));
      } catch (e) {
        emit(UserDetailErrorState(e.toString()));
      }
    });
  }
}
