import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/stream_entity.dart';
import '../../domain/usecases/get_streams.dart';
import '../../domain/usecases/toggle_follow_stream.dart';
import '../providers/home_providers.dart';

class HomeState {
  const HomeState({
    this.activePageIndex = 0,
    this.activeTab = 'Stream',
    this.activeCountry = 'Global',
    this.streams = const [],
    this.isLoading = true,
  });

  final int activePageIndex;
  final String activeTab;
  final String activeCountry;
  final List<StreamEntity> streams;
  final bool isLoading;

  HomeState copyWith({
    int? activePageIndex,
    String? activeTab,
    String? activeCountry,
    List<StreamEntity>? streams,
    bool? isLoading,
  }) {
    return HomeState(
      activePageIndex: activePageIndex ?? this.activePageIndex,
      activeTab: activeTab ?? this.activeTab,
      activeCountry: activeCountry ?? this.activeCountry,
      streams: streams ?? this.streams,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(
    ref.watch(getStreamsUseCaseProvider),
    ref.watch(toggleFollowStreamUseCaseProvider),
  );
});

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this._getStreamsUseCase, this._toggleFollowStreamUseCase)
      : super(const HomeState()) {
    loadStreams();
  }

  final GetStreamsUseCase _getStreamsUseCase;
  final ToggleFollowStreamUseCase _toggleFollowStreamUseCase;

  Future<void> loadStreams() async {
    state = state.copyWith(isLoading: true);
    final streams = await _getStreamsUseCase();
    state = state.copyWith(streams: streams, isLoading: false);
  }

  void setActivePageIndex(int index) {
    state = state.copyWith(activePageIndex: index);
  }

  void setActiveTab(String tab) {
    state = state.copyWith(activeTab: tab);
  }

  void setActiveCountry(String country) {
    state = state.copyWith(activeCountry: country);
  }

  Future<void> toggleFollow(String streamId) async {
    final streams = await _toggleFollowStreamUseCase(streamId);
    state = state.copyWith(streams: streams);
  }
}