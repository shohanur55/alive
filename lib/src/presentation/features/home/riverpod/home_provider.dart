import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/base/result.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../domain/entities/stream_entity.dart';

part 'home_provider.g.dart';

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

@riverpod
class Home extends _$Home {
  @override
  HomeState build() {
    _loadStreams();
    return const HomeState();
  }

  Future<void> _loadStreams() async {
    final result = await ref.read(getStreamsUseCaseProvider).call();
    switch (result) {
      case Success(:final data):
        state = state.copyWith(streams: data, isLoading: false);
      case Error():
        state = state.copyWith(isLoading: false);
      default:
        state = state.copyWith(isLoading: false);
    }
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
    final result =
        await ref.read(toggleFollowStreamUseCaseProvider).call(streamId);
    if (result is Success<List<StreamEntity>, String>) {
      state = state.copyWith(streams: result.data);
    }
  }
}
