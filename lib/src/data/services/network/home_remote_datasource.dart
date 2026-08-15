import '../../models/stream_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<StreamModel>> fetchStreams();
  Future<List<StreamModel>> toggleFollow(String streamId);
}

class FakeHomeRemoteDataSource implements HomeRemoteDataSource {
  final List<StreamModel> _streams = [
    const StreamModel(
      id: '1',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
    const StreamModel(
      id: '2',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: true,
    ),
    const StreamModel(
      id: '3',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
    const StreamModel(
      id: '4',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
    const StreamModel(
      id: '5',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: true,
    ),
    const StreamModel(
      id: '6',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
    const StreamModel(
      id: '7',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: true,
    ),
    const StreamModel(
      id: '8',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
  ];

  @override
  Future<List<StreamModel>> fetchStreams() async {
    return List<StreamModel>.unmodifiable(_streams);
  }

  @override
  Future<List<StreamModel>> toggleFollow(String streamId) async {
    final index = _streams.indexWhere((stream) => stream.id == streamId);
    if (index == -1) {
      return fetchStreams();
    }

    _streams[index] = StreamModel.fromEntity(
      _streams[index].copyWith(
        isFollowing: !_streams[index].isFollowing,
      ),
    );
    return fetchStreams();
  }
}
