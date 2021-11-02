import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  const AppUser({required this.id, this.email, this.name, this.photo});

  final String? email;
  final String? id;
  final String? name;
  final String? photo;

  static const empty = AppUser(id: '');

  //get whether the current user is empty
  bool get isEmpty => this == AppUser.empty;

  //get whether the current user is not empty
  bool get isNoteEmpty => this != AppUser.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
}
