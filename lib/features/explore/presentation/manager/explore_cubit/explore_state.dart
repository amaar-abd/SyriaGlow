import 'package:equatable/equatable.dart';
import 'package:syria_glow/features/home/data/models/landmark_model.dart';

enum EventsStatus { initial, loading, success, failure }

enum SearchStatus { initial, loading, success, failure, noResults }

class ExploreState extends Equatable{
  final EventsStatus eventsStatus;
  final List<Landmark> events;
  final String eventsErrorMessage;

  final SearchStatus searchStatus;
  final List<Landmark> searchResults;
  final String searchErrorMessage;

  const ExploreState({
    this.eventsStatus = EventsStatus.initial,
    this.events = const [],
    this.eventsErrorMessage = '',
    this.searchStatus = SearchStatus.initial,
    this.searchResults = const [],
    this.searchErrorMessage = '',
  });

  ExploreState copyWith({
    EventsStatus? eventsStatus,
    List<Landmark>? events,
    String? eventsErrorMessage,
    SearchStatus? searchStatus,
    List<Landmark>? searchResults,
    String? searchErrorMessage,
  }) {
    return ExploreState(
      eventsStatus: eventsStatus ?? this.eventsStatus,
      events: events ?? this.events,
      eventsErrorMessage: eventsErrorMessage ?? this.eventsErrorMessage,
      searchStatus: searchStatus ?? this.searchStatus,
      searchResults: searchResults ?? this.searchResults,
      searchErrorMessage: searchErrorMessage ?? this.searchErrorMessage,
    );
  }
  @override
  List<Object?> get props => [
        eventsStatus,
        events,
        eventsErrorMessage,
        searchStatus,
        searchResults,
        searchErrorMessage,
      ];
}
