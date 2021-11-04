part of 'app_bloc.dart';

enum AppStatus { AUTHENTICATED, UNAUTHENTICATED }

class AppState extends Equatable {
  const AppState._({required this.status, this.user = AppUser.empty});

  const AppState.authenticated(AppUser appUser) : this._(status: AppStatus.AUTHENTICATED, user: appUser);

  const AppState.unauthenticated() : this._(status: AppStatus.UNAUTHENTICATED);

  final AppStatus status;
  final AppUser user;

  @override
  List<Object?> get props => [status, user];
}
