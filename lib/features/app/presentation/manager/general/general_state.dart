part of 'general_bloc.dart';

@immutable
sealed class GeneralState {}

final class GeneralInitial extends GeneralState {}

final class LoadingState extends GeneralState {}

final class ErrorState extends GeneralState {
  ErrorState({required this.message});

  final String message;
}

final class LoadedState extends GeneralState {}

final class ReloadedState extends GeneralState {}

final class CheckState extends GeneralState {}
