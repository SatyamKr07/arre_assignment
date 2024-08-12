import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/media_model.dart';

class MediaState extends Equatable {
  final List<MediaModel> mediaList;
  final bool isLoading;

  const MediaState({
    this.mediaList = const [],
    this.isLoading = false,
  });

  @override
  List<Object> get props => [mediaList, isLoading];

  MediaState copyWith({
    List<MediaModel>? mediaList,
    bool? isLoading,
  }) {
    return MediaState(
      mediaList: mediaList ?? this.mediaList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class MediaCubit extends Cubit<MediaState> {
  MediaCubit() : super(const MediaState());

  void loadMedia() {
    emit(state.copyWith(isLoading: true));

    // Simulated media data
    final listMedia = [
      MediaModel(
        id: '1',
        thumbnailUrl: 'https://picsum.photos/200/300?id=10',
        mediaLink: 'https://example.com/audio1.mp3',
      ),
      MediaModel(
        id: '2',
        thumbnailUrl: 'https://picsum.photos/200/300?id=2',
        mediaLink: 'https://example.com/audio2.mp3',
      ),
      MediaModel(
        id: '3',
        thumbnailUrl: 'https://picsum.photos/200/300?id=3',
        mediaLink: 'https://example.com/audio3.mp3',
      ),
      MediaModel(
        id: '4',
        thumbnailUrl: 'https://picsum.photos/200/300?id=4',
        mediaLink: 'https://example.com/audio4.mp3',
      ),
      MediaModel(
        id: '5',
        thumbnailUrl: 'https://picsum.photos/200/300?id=5',
        mediaLink: 'https://example.com/audio5.mp3',
      ),
      MediaModel(
        id: '6',
        thumbnailUrl: 'https://picsum.photos/200/300?id=6',
        mediaLink: 'https://example.com/audio6.mp3',
      ),
      MediaModel(
        id: '7',
        thumbnailUrl: 'https://picsum.photos/200/300?id=7',
        mediaLink: 'https://example.com/audio7.mp3',
      ),
    ];

    emit(state.copyWith(mediaList: listMedia, isLoading: false));
  }
}
