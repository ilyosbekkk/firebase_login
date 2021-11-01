import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.id, this.email, this.name, this.photo});

  final String? email;
  final String? id;
  final String? name;
  final String? photo;

  static const empty = User(id: '');

  //get whether the current user is empty
  bool get isEmpty => this == User.empty;

  //get whether the current user is not empty
  bool get isNoteEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
}
