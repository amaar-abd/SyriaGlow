part of 'routing_cubit.dart';

sealed class RoutingState {}

final class RoutingInitial extends RoutingState {}

final class NavigateToOnboarding extends RoutingState {}

final class NavigateToLogin extends RoutingState {}

final class NavigateToHome extends RoutingState {}
