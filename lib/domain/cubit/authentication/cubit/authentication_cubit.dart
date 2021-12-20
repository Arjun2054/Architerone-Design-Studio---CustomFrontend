import 'package:architerone_student/data/repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationCubit({required this.authenticationRepository})
      : super(AuthenticationInitial());

  //! create a wrapper method around function

  Future signup({
      required BuildContext context,
    required String studentEmail,
    required String studentPassword,
  }) async {
    //! first to create authenctication intial

    try {
      emit(AuthenticationLoading());
      if (studentEmail.isNotEmpty && studentPassword.isNotEmpty) {
        var _response = await authenticationRepository.signUp(
            studentEmail: studentEmail, studentPassword: studentPassword);
        print(_response);
        if (_response != null) {
            bool isSigned = _response['signed'];
          String jwt = _response['message'];
          emit(AuthenticationCompleted(response: jwt));
          if (isSigned) {
            Navigator.of(context).pushNamed("/home");
          } 
        }
      } else {
        emit(AuthenticationError(error: "Fill the Credentials"));
      }
    } catch (e) {
      emit(AuthenticationError(error: e.toString()));
    }
  }

  Future login({
    required BuildContext context,
    required String studentEmail,
    required String studentPassword,
  }) async {
    //! first to create authenctication intial

    try {
      emit(AuthenticationLoading());
      if (studentEmail.isNotEmpty && studentPassword.isNotEmpty) {
        var _response = await authenticationRepository.login(
            studentEmail: studentEmail, studentPassword: studentPassword);
        print(_response);
        if (_response != null) {
          bool isSigned = _response['signed'];
          String jwt = _response['message'];
          emit(AuthenticationCompleted(response: jwt));
         
         if(isSigned){
            Navigator.of(context).pushNamed("/home");
         } 
        }
      } else {
        emit(AuthenticationError(error: "Fill the Credentials"));
      }
    } catch (e) {
      emit(AuthenticationError(error: e.toString()));
    }
  }
}
