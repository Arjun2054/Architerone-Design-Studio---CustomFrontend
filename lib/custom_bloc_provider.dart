import 'package:architerone_student/data/network/authentication_network.dart';
import 'package:architerone_student/data/repository/authentication_repository.dart';
import 'package:architerone_student/domain/cubit/authentication/cubit/authentication_cubit.dart';
import 'package:architerone_student/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Core extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthenticationCubit>(
        create: (context) => AuthenticationCubit(
            authenticationRepository: AuthenticationRepository(
              authenticationNetworkServices: AuthenticationNetworkServices()
            ),),
      ),
    ], child: Lava());
  }
}
