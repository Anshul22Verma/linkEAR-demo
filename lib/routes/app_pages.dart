import 'package:get/get.dart';
import 'package:linkear/modules/app_update/app_update_view.dart';
import 'package:linkear/modules/auth/bindings/account_verification_binding.dart';
import 'package:linkear/modules/auth/bindings/change_password_binding.dart';
import 'package:linkear/modules/auth/bindings/login_binding.dart';
import 'package:linkear/modules/auth/bindings/password_binding.dart';
import 'package:linkear/modules/auth/bindings/register_binding.dart';
import 'package:linkear/modules/auth/views/change_password_view.dart';
import 'package:linkear/modules/auth/views/forgot_password_view.dart';
import 'package:linkear/modules/auth/views/login_view.dart';
import 'package:linkear/modules/auth/views/register_view.dart';
import 'package:linkear/modules/auth/views/reset_password_view.dart';
import 'package:linkear/modules/auth/views/send_account_verification_otp_view.dart';
import 'package:linkear/modules/auth/views/verify_account_view.dart';
import 'package:linkear/modules/calling/bindings/calling_binding.dart';
import 'package:linkear/modules/calling/bindings/join_binding.dart';
import 'package:linkear/modules/calling/bindings/start_binding.dart';
import 'package:linkear/modules/calling/views/calling_view.dart';
import 'package:linkear/modules/calling/views/join_view.dart';
import 'package:linkear/modules/calling/views/start_view.dart';
import 'package:linkear/modules/home/bindings/home_binding.dart';
import 'package:linkear/modules/home/views/home_view.dart';
import 'package:linkear/modules/maintenance/server_maintenance_view.dart';
import 'package:linkear/modules/profile/bindings/edit_name_binding.dart';
import 'package:linkear/modules/profile/bindings/edit_username_binding.dart';
import 'package:linkear/modules/profile/bindings/profile_binding.dart';
import 'package:linkear/modules/profile/views/edit_name_view.dart';
import 'package:linkear/modules/profile/views/edit_username_view.dart';
import 'package:linkear/modules/profile/views/profile_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  static var transitionDuration = const Duration(milliseconds: 200);

  static final pages = [
    GetPage(
      name: _Routes.maintenance,
      page: ServerMaintenanceView.new,
      transitionDuration: transitionDuration,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.login,
      page: LoginView.new,
      transitionDuration: transitionDuration,
      binding: LoginBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.register,
      page: RegisterView.new,
      transitionDuration: transitionDuration,
      binding: RegisterBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.home,
      page: HomeView.new,
      transitionDuration: transitionDuration,
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.forgotPassword,
      page: ForgotPasswordView.new,
      transitionDuration: transitionDuration,
      binding: PasswordBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.resetPassword,
      page: ResetPasswordView.new,
      transitionDuration: transitionDuration,
      binding: PasswordBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.changePassword,
      page: ChangePasswordView.new,
      transitionDuration: transitionDuration,
      binding: ChangePasswordBinding(),
      transition: Transition.downToUp,
    ),

    /// Send Verify Account Otp
    GetPage(
      name: _Routes.sendVerifyAccountOtp,
      page: SendAccountVerificationOtpView.new,
      transitionDuration: transitionDuration,
      binding: AccountVerificationBinding(),
      transition: Transition.downToUp,
    ),

    /// Verify Account
    GetPage(
      name: _Routes.verifyAccount,
      page: VerifyAccountView.new,
      transitionDuration: transitionDuration,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.calling,
      page: CallingView.new,
      transitionDuration: transitionDuration,
      binding: CallingBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.start,
      page: StartView.new,
      binding: StartBinding(),
      transitionDuration: transitionDuration,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.join,
      page: JoinView.new,
      binding: JoinBinding(),
      transitionDuration: transitionDuration,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.profile,
      page: ProfileView.new,
      binding: ProfileBinding(),
      transitionDuration: transitionDuration,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.editName,
      page: EditNameView.new,
      binding: EditNameBinding(),
      transitionDuration: transitionDuration,
      transition: Transition.downToUp,
    ),

    GetPage(
      name: _Routes.editUsername,
      page: EditUsernameView.new,
      binding: EditUsernameBinding(),
      transitionDuration: transitionDuration,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Routes.appUpdate,
      page: AppUpdateView.new,
      transitionDuration: transitionDuration,
      transition: Transition.downToUp,
    ),
  ];
}
