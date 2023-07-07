import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:interview/src/repo/repo.dart';
import 'package:equatable/equatable.dart';

import '../../models/userlist_model.dart';

part 'user_get_data_event.dart';
part 'user_get_data_state.dart';

class UserGetDataBloc extends Bloc<UserGetDataEvent, UserGetDataState> {
  final DioClient _dio;
  UserGetDataBloc(this._dio) : super(UserGetDataInitial()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserGetDataInitial());
      try {
        var users = await _dio.getUserList(pageNumber: event.pageNumber);
        print("users");
        print(users);
        emit(UserGetLoadedState(users));
      } catch (e) {
        emit(UserGetErrorState(e.toString()));
      }
    });
  }
}
