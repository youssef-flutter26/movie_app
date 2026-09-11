import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/build_appbar.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  static const String routeName = 'notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, tittle: 'Notification'),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) => current is NotificationToggleState,
        builder: (context, state) {
          final cubit = BlocProvider.of<ProfileCubit>(context);
          return NotificationViewBody(
            isNotificationEnabled: cubit.isNotificationEnabled,
          );
        },
      ),
    );
  }
}
