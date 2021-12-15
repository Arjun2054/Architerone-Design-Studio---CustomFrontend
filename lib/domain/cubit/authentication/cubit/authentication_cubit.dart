import 'package:architerone_student/data/repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationCubit({required this.authenticationRepository}) : super(AuthenticationInitial());

  Future signup({
    required String studentEmail,
    required String studentPassword,
  }) async {
    
  }
}
