import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:linkear/apis/providers/api_provider.dart';
import 'package:linkear/apis/services/auth_service.dart';
import 'package:linkear/constants/strings.dart';
import 'package:linkear/helpers/utility.dart';
import 'package:linkear/modules/profile/controllers/profile_controller.dart';
import 'package:linkear/routes/route_management.dart';

class EditNameController extends GetxController {
  static EditNameController get find => Get.find();

  final _profile = ProfileController.find;
  final _auth = AuthService.find;

  final _apiProvider = ApiProvider(http.Client());

  final fNameTextController = TextEditingController();
  final lNameTextController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    initializeFields();
    super.onInit();
  }

  void initializeFields() async {
    if (_profile.profileDetails!.user != null) {
      var user = _profile.profileDetails!.user!;
      fNameTextController.text = user.fname;
      lNameTextController.text = user.lname;
    }
  }

  Future<void> _updateName(
    String fname,
    String lname,
  ) async {
    if (fname.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterFirstName,
        StringValues.warning,
      );
      return;
    }

    if (lname.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterLastName,
        StringValues.warning,
      );
      return;
    }

    final body = {
      'fname': fname,
      'lname': lname,
    };

    AppUtility.printLog("Update Name Request...");
    AppUtility.showLoadingDialog();
    _isLoading.value = true;
    update();

    try {
      final response = await _apiProvider.updateProfile(_auth.authToken, body);

      final decodedData = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        await _profile.fetchProfileDetails();
        AppUtility.closeDialog();
        _isLoading.value = false;
        update();
        RouteManagement.goToBack();
        AppUtility.showSnackBar(
          StringValues.updateProfileSuccessful,
          StringValues.success,
        );
      } else {
        AppUtility.closeDialog();
        _isLoading.value = false;
        update();
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } on SocketException {
      AppUtility.closeDialog();
      _isLoading.value = false;
      update();
      AppUtility.printLog(StringValues.internetConnError);
      AppUtility.showSnackBar(
          StringValues.internetConnError, StringValues.error);
    } on TimeoutException {
      AppUtility.closeDialog();
      _isLoading.value = false;
      update();
      AppUtility.printLog(StringValues.connTimedOut);
      AppUtility.showSnackBar(StringValues.connTimedOut, StringValues.error);
    } on FormatException catch (e) {
      AppUtility.closeDialog();
      _isLoading.value = false;
      update();
      AppUtility.printLog(StringValues.formatExcError);
      AppUtility.printLog(e);
      AppUtility.showSnackBar(StringValues.errorOccurred, StringValues.error);
    } catch (exc) {
      AppUtility.closeDialog();
      _isLoading.value = false;
      update();
      AppUtility.printLog(StringValues.errorOccurred);
      AppUtility.printLog(exc);
      AppUtility.showSnackBar(StringValues.errorOccurred, StringValues.error);
    }
  }

  Future<void> updateName() async {
    AppUtility.closeFocus();
    if (fNameTextController.text.trim() ==
            _profile.profileDetails!.user!.fname &&
        lNameTextController.text.trim() ==
            _profile.profileDetails!.user!.lname) {
      return;
    }
    await _updateName(
      fNameTextController.text.trim(),
      lNameTextController.text.trim(),
    );
  }
}
