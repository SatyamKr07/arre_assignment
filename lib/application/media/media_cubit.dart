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
        thumbnailUrl: 'https://picsum.photos/200/300',
        mediaLink: 'https://example.com/audio1.mp3',
      ),
      MediaModel(
        id: '2',
        thumbnailUrl: 'https://picsum.photos/200/300',
        mediaLink: 'https://example.com/audio2.mp3',
      ),
      MediaModel(
        id: '3',
        thumbnailUrl: 'https://picsum.photos/200/300',
        mediaLink: 'https://example.com/audio3.mp3',
      ),
    ];

    emit(state.copyWith(mediaList: listMedia, isLoading: false));
  }
}