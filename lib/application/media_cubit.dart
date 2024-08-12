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
