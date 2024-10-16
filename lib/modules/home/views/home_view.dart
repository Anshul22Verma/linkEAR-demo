import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkear/apis/models/entities/user_avatar.dart';
import 'package:linkear/apis/services/auth_service.dart';
import 'package:linkear/common/asset_image.dart';
import 'package:linkear/common/circular_asset_image.dart';
import 'package:linkear/common/circular_network_image.dart';
import 'package:linkear/common/custom_app_bar.dart';
import 'package:linkear/common/primary_filled_btn.dart';
import 'package:linkear/common/primary_outlined_btn.dart';
import 'package:linkear/constants/colors.dart';
import 'package:linkear/constants/dimens.dart';
import 'package:linkear/constants/strings.dart';
import 'package:linkear/constants/styles.dart';
import 'package:linkear/helpers/utility.dart';
import 'package:linkear/modules/profile/controllers/profile_controller.dart';
import 'package:linkear/routes/route_management.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lastExitTime = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastExitTime) >=
            const Duration(seconds: 2)) {
          AppUtility.showSnackBar(
            'Press the back button again exit',
            '',
            duration: 2,
          );
          lastExitTime = DateTime.now();

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            child: Column(
              children: [
                NxAppBar(
                  leading: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            NxAssetImage(
                              imgAsset: AssetValues.appIcon,
                              fit: BoxFit.cover,
                              height: Dimens.twentyFour,
                            ),
                            Dimens.boxWidth8,
                            Text(
                              StringValues.appName,
                              style: AppStyles.style20Bold.copyWith(
                                color: ColorValues.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        GetBuilder<ProfileController>(
                          builder: (logic) => InkWell(
                            onTap: RouteManagement.goToProfileView,
                            child: _buildProfileImage(
                                logic.profileDetails!.user!.avatar),
                          ),
                        ),
                      ],
                    ),
                  ),
                  showBackBtn: false,
                ),
                Expanded(
                  child: Padding(
                    padding: Dimens.edgeInsets16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Expanded(child: SizedBox()),
                        Text(
                          "Your meeting ID is:",
                          style: AppStyles.style16Normal,
                          textAlign: TextAlign.center,
                        ),
                        Dimens.boxHeight8,
                        Text(
                          AppUtility.formatMeetingId(
                              Get.find<AuthService>().channelId.toString()),
                          style: AppStyles.style24Bold,
                          textAlign: TextAlign.center,
                        ),
                        const Expanded(child: SizedBox()),
                        Dimens.boxHeight16,
                        NxFilledButton(
                          label: StringValues.start.toUpperCase(),
                          onTap: RouteManagement.goToStartView,
                          height: Dimens.fiftySix,
                        ),
                        Dimens.boxHeight16,
                        NxOutlinedButton(
                          label: StringValues.join.toUpperCase(),
                          onTap: RouteManagement.goToJoinView,
                          height: Dimens.fiftySix,
                        ),
                        Dimens.boxHeight16,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(UserAvatar? avatar, {double? size}) {
    if (avatar != null && avatar.url != null) {
      return NxCircleNetworkImage(
        imageUrl: avatar.url!,
        radius: size ?? Dimens.thirtyTwo,
      );
    }
    return NxCircleAssetImage(
      imgAsset: AssetValues.avatar,
      radius: size ?? Dimens.thirtyTwo,
    );
  }
}
