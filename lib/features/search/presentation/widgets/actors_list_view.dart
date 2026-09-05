import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/search/data/models/actor_model.dart';
import 'package:movie_app/features/search/presentation/widgets/actor_item.dart';

class ActorsListView extends StatelessWidget {
  final List<ActorModel> actors;

  const ActorsListView({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    if (actors.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 95.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: actors.length,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return ActorItem(actor: actors[index]);
        },
      ),
    );
  }
}
