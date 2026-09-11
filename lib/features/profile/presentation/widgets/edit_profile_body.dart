import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/constant.dart';
import 'package:movie_app/core/services/shared_pref.dart';
import 'package:movie_app/core/utils/app_styles.dart';
import 'package:movie_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/widgets/custom_edit_image.dart';
import 'package:movie_app/features/profile/presentation/widgets/edit_text_form_field.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  File? selectedImageFile;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 12.h),

              // ويدجت اختيار وتعديل الصورة
              CustomEditImage(
                avatarUrl: widget.userModel.avatarUrl,
                onImagePicked: (file) {
                  selectedImageFile = file;
                },
              ), // CustomEditImage

              SizedBox(height: 12.h),

              ListenableBuilder(
                listenable: nameController,
                builder: (context, _) {
                  return Text(
                    nameController.text.isNotEmpty
                        ? nameController.text
                        : (widget.userModel.name ?? ''),
                    style: TextStyles.bold19,
                  ); // Text
                },
              ), // ListenableBuilder

              ListenableBuilder(
                listenable: emailController,
                builder: (context, _) {
                  return Text(
                    emailController.text.isNotEmpty
                        ? emailController.text
                        : (widget.userModel.email ?? ''),
                    style: TextStyles.regular16.copyWith(color: Colors.grey),
                  ); // Text
                },
              ), // ListenableBuilder

              SizedBox(height: 24.h),

              // حقل الاسم
              EditTextFormField(
                controller: nameController,
                labelText: 'Name',
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final nameRegex = RegExp(
                      r"^[a-zA-Z\u0600-\u06FF\s]{2,50}$",
                    );
                    if (!nameRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid real name';
                    }
                  }
                  return null;
                },
              ), // EditTextFormField

              SizedBox(height: 24.h),

              // حقل البريد الإلكتروني
              EditTextFormField(
                controller: emailController,
                labelText: 'Email',
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final emailRegex = RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                    ); // RegExp
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email address';
                    }
                  }
                  return null;
                },
              ), // EditTextFormField

              SizedBox(height: 24.h),

              // حقل كلمة المرور
              EditTextFormField(
                controller: passwordController,
                labelText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ), // EditTextFormField

              SizedBox(height: 24.h),

              // حقل رقم الهاتف
              EditTextFormField(
                controller: phoneController,
                labelText: 'Phone Number',
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final phoneRegex = RegExp(r"^01[0125][0-9]{8}$");
                    if (!phoneRegex.hasMatch(value.trim())) {
                      return 'Enter a valid Egyptian phone number (e.g. 01012345678)';
                    }
                  }
                  return null;
                },
              ), // EditTextFormField

              SizedBox(height: 48.h),

              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile updated successfully!'),
                      ), // SnackBar
                    );
                    Navigator.pop(context);
                  } else if (state is ProfileFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: 'Save Changes',
                    isLoading: state is UpdateProfileLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final updatedUser = UserModel(
                          id: widget.userModel.id,
                          name: nameController.text.trim().isNotEmpty
                              ? nameController.text.trim()
                              : widget.userModel.name,
                          email: emailController.text.trim().isNotEmpty
                              ? emailController.text.trim()
                              : widget.userModel.email,
                          password: passwordController.text.trim().isNotEmpty
                              ? passwordController.text.trim()
                              : widget.userModel.password,
                          phoneNumber: phoneController.text.trim().isNotEmpty
                              ? phoneController.text.trim()
                              : widget.userModel.phoneNumber,
                          // استخدام مسار الصورة الجديدة إن وُجدت، أو الصورة القديمة
                          avatarUrl: selectedImageFile != null
                              ? selectedImageFile!.path
                              : widget.userModel.avatarUrl,
                          isPremium: widget.userModel.isPremium,
                        ); // UserModel

                        context.read<ProfileCubit>().updateUserProfile(
                          userModel: updatedUser,
                          token: SharedPref.getString(tmdbToken),
                        );
                      }
                    },
                  ); // CustomButton
                },
              ), // BlocConsumer

              SizedBox(height: 24.h),
            ],
          ), // Column
        ), // Form
      ), // Padding
    ); // SingleChildScrollView
  }
}
