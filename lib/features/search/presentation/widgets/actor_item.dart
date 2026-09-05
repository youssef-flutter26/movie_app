import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/search/data/models/actor_model.dart';

class ActorItem extends StatelessWidget {
  final ActorModel actor;

  const ActorItem({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    final bool hasImage =
        actor.profilePath != null && actor.profilePath!.isNotEmpty;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60.r,
          height: 60.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[800],
            image: hasImage
                ? DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: !hasImage
              ? Icon(Icons.person, color: Colors.grey[400], size: 28.r)
              : null,
        ),
        SizedBox(height: 6.h),
        SizedBox(
          width: 65.w,
          child: Text(
            actor.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
