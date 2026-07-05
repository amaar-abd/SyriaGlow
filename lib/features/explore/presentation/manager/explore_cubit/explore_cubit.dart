import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/explore/domain/repo/explore_repository.dart';
import 'package:syria_glow/features/explore/presentation/manager/explore_cubit/explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this.repository) : super(ExploreState());
  final ExploreRepository repository;

  Future<void> search({required String query}) async {
    emit(state.copyWith(searchStatus: SearchStatus.loading));
    final results = await repository.searchByNmae(query: query);
    results.fold(
      (failure) {
        emit(
          state.copyWith(
            searchStatus: SearchStatus.failure,
            searchErrorMessage: failure.message,
          ),
        );
      },
      (landmarks) {
        if (landmarks.isEmpty) {
          emit(state.copyWith(searchStatus: SearchStatus.noResults));
        } else {
          emit(
            state.copyWith(
              searchStatus: SearchStatus.success,
              searchResults: landmarks,
            ),
          );
        }
      },
    );
  }

  Future<void> events() async {
    emit(state.copyWith(eventsStatus: EventsStatus.loading));
    final results = await repository.getEvents();
    results.fold(
      (failure) => emit(
        state.copyWith(
        eventsStatus: EventsStatus.failure,
        eventsErrorMessage: failure.message,
      ),
      ),
      (events) => emit(
       state.copyWith(
        eventsStatus: EventsStatus.success,
        events: events,
      ),
      ),
    );
  }

  void resetSearch() {
    emit(
      state.copyWith(
        searchStatus: SearchStatus.initial,
        searchResults: const [],
      ),
    );
  }
}
