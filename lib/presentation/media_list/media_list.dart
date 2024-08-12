import 'package:arre_assignment_sk/presentation/media_list/widgets/media_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/media/media_cubit.dart';
import '../../application/my_app/my_app_cubit.dart';
import '../../domain/media_model.dart';

class MediaList extends StatelessWidget {
  const MediaList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.mediaList.length,
          itemBuilder: (context, index) {
            return MediaItem(
              mediaModel: state.mediaList[index],
              onTap: (media) => context.read<MyAppCubit>().toggleMediaPlayer(),
            );
          },
        );
      },
    );
  }
}
