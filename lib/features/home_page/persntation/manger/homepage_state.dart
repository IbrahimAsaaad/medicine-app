part of 'homepage_cubit.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}


class CategoryLoading extends HomepageState {}
class CategoryError extends HomepageState {}
class CategorySuccess extends HomepageState {}


class ItemLoading extends HomepageState {}
class ItemError extends HomepageState {}
class ItemSuccess extends HomepageState {}


class GetFavouriteLoading extends HomepageState {}
class GetFavouriteError extends HomepageState {}
class GetFavouriteSuccess extends HomepageState {}
