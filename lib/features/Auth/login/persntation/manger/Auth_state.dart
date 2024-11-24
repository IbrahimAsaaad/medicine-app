part of 'Auth_cubit.dart';

@immutable
abstract class AuthState {}

class LoginInitial extends AuthState {}


class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginError extends AuthState {}


class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {}
class DataSuccess extends AuthState {}
class RegisterError extends AuthState {}
