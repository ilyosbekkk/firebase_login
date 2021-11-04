import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb, visibleForTesting;

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(authenticationRepository.currentUser.isNotEmpty ? AppState.authenticated(authenticationRepository.currentUser) : const AppState.unauthenticated()) {
    _userSubscription = _authenticationRepository.user.listen((user) {
      add(AppUserChanged(user));
    });
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<AppUser> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty ? AppState.authenticated(event.user) : AppState.unauthenticated());
  }

  void _onLogoutRequested(AppUserChanged event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
