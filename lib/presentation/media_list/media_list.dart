import 'package:arre_assignment_sk/presentation/media_list/widgets/media_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/media_cubit.dart';

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
            return VideoItem(video: state.mediaList[index]);
          },
        );
      },
    );
  }
}
