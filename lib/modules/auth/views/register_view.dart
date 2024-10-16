import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkear/common/asset_image.dart';
import 'package:linkear/common/primary_filled_btn.dart';
import 'package:linkear/common/primary_text_btn.dart';
import 'package:linkear/constants/colors.dart';
import 'package:linkear/constants/dimens.dart';
import 'package:linkear/constants/strings.dart';
import 'package:linkear/constants/styles.dart';
import 'package:linkear/modules/auth/controllers/register_controller.dart';
import 'package:linkear/routes/route_management.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimens.boxHeight16,
                _buildImageHeader(),
                Dimens.boxHeight16,
                _buildRegistrationFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          NxAssetImage(
            imgAsset: AssetValues.appIcon,
            maxHeight: Dimens.eighty,
          ),
          Text(
            StringValues.appName,
            textAlign: TextAlign.center,
            style: AppStyles.style24Bold.copyWith(
              color: ColorValues.primaryColor,
            ),
          ),
        ],
      );

  Widget _buildRegistrationFields() => GetBuilder<RegisterController>(
        builder: (logic) => Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: Dimens.edgeInsets0_16,
                  child: FocusScope(
                    node: logic.focusNode,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          StringValues.register,
                          style: AppStyles.style24Bold,
                        ),
                        Dimens.boxHeight32,
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                    color: ColorValues.grayColor,
                                  ),
                                  hintText: StringValues.firstName,
                                ),
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                style: AppStyles.style14Normal.copyWith(
                                  color: Theme.of(Get.context!)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                                controller: logic.fNameTextController,
                                onEditingComplete: logic.focusNode.nextFocus,
                              ),
                            ),
                            Dimens.boxWidth16,
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(
                                    color: ColorValues.grayColor,
                                  ),
                                  hintText: StringValues.lastName,
                                ),
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                style: AppStyles.style14Normal.copyWith(
                                  color: Theme.of(Get.context!)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                                controller: logic.lNameTextController,
                                onEditingComplete: logic.focusNode.nextFocus,
                              ),
                            ),
                          ],
                        ),
                        Dimens.boxHeight16,
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: StringValues.email,
                            hintStyle: TextStyle(
                              color: ColorValues.grayColor,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          style: AppStyles.style14Normal.copyWith(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .bodyText1!
                                .color,
                          ),
                          controller: logic.emailTextController,
                          onEditingComplete: logic.focusNode.nextFocus,
                        ),
                        Dimens.boxHeight16,
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                              color: ColorValues.grayColor,
                            ),
                            hintText: StringValues.username,
                          ),
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          style: AppStyles.style14Normal.copyWith(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .bodyText1!
                                .color,
                          ),
                          controller: logic.unameTextController,
                          onEditingComplete: logic.focusNode.nextFocus,
                        ),
                        Dimens.boxHeight16,
                        TextFormField(
                          obscureText: logic.showPassword,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintStyle: const TextStyle(
                              color: ColorValues.grayColor,
                            ),
                            hintText: StringValues.password,
                            suffixIcon: InkWell(
                              onTap: logic.toggleViewPassword,
                              child: Icon(
                                logic.showPassword
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                          style: AppStyles.style14Normal.copyWith(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .bodyText1!
                                .color,
                          ),
                          controller: logic.passwordTextController,
                          onEditingComplete: logic.focusNode.nextFocus,
                        ),
                        Dimens.boxHeight16,
                        TextFormField(
                          obscureText: logic.showPassword,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintStyle: const TextStyle(
                              color: ColorValues.grayColor,
                            ),
                            hintText: StringValues.confirmPassword,
                            suffixIcon: InkWell(
                              onTap: logic.toggleViewPassword,
                              child: Icon(
                                logic.showPassword
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                          style: AppStyles.style14Normal.copyWith(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .bodyText1!
                                .color,
                          ),
                          controller: logic.confirmPasswordTextController,
                          onEditingComplete: logic.focusNode.unfocus,
                        ),
                        Dimens.boxHeight32,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              StringValues.alreadyHaveAccount,
                              style: AppStyles.style16Normal,
                            ),
                            Dimens.boxWidth4,
                            const NxTextButton(
                              label: StringValues.login,
                              onTap: RouteManagement.goToLoginView,
                            ),
                          ],
                        ),
                        Dimens.boxHeight16,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: NxFilledButton(
                  onTap: () => logic.register(),
                  label: StringValues.register.toUpperCase(),
                  fontSize: Dimens.sixTeen,
                  borderRadius: 0.0,
                ),
              ),
            ],
          ),
        ),
      );
}
