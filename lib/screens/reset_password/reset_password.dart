import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/route/app_route.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formData = FormData();

  var _isFormLoading = false;

  Future<void> _doLoginAsync({
    required VoidCallback onSuccess,
    required void Function(String message) onError,
  }) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();

      setState(() => _isFormLoading = true);

      Future.delayed(const Duration(seconds: 1), () async {
        if (_formData.email != 'admin@gmail.com') {
          onError.call('Invalid email');
        } else {
          onSuccess.call();
        }

        setState(() => _isFormLoading = false);
      });
    }
  }

  void _onLoginSuccess(BuildContext context) {
    GoRouter.of(context).go(RouteUri.home);
  }

  void _onLoginError(BuildContext context, String message) {
    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      desc: message,
      width: kDialogWidth,
      btnOkText: 'OK',
      btnOkOnPress: () {},
    );

    dialog.show();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);

    return PortalMasterLayout(
      body: EntranceFader(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding:
                              const EdgeInsets.only(bottom: kDefaultPadding),
                          child: Text('Dashify',
                              style: GoogleFonts.pacifico(
                                  fontSize:
                                      kDefaultPadding * 2 - kTextPadding))),
                      Text(lang.appTitle,
                          style: themeData.textTheme.labelLarge),
                      buildSizedBoxH(kDefaultPadding),
                      Text(
                        lang.resetpassTitle,
                        style: themeData.textTheme.labelLarge,
                      ),
                      buildSizedBoxH(kDefaultPadding),
                      FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 1.5),
                              child: FormBuilderTextField(
                                name: 'Email',
                                decoration: InputDecoration(
                                  labelText: lang.email,
                                  hintText: lang.email,
                                  helperText: '* Demo Email: admin@gmail.com',
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                enableSuggestions: false,
                                validator: FormBuilderValidators.required(),
                                onSaved: (value) =>
                                    (_formData.email = value ?? ''),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding),
                              child: SizedBox(
                                height: 40.0,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.primaryColor)),
                                  onPressed: (_isFormLoading
                                      ? null
                                      : () => _doLoginAsync(
                                            onSuccess: () =>
                                                _onLoginSuccess(context),
                                            onError: (message) =>
                                                _onLoginError(context, message),
                                          )),
                                  child: Text(lang.Reset),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                              width: double.infinity,
                              child: OutlinedButton(
                                // style: themeData.extension<AppButtonTheme>()!.secondaryOutlined,
                                onPressed: () =>
                                    GoRouter.of(context).go(RouteUri.login),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(lang.Rememberit),
                                    buildSizedboxW(kTextPadding),
                                    Text(
                                      lang.login,
                                      style: const TextStyle(
                                          color: AppColors
                                              .uiComponentsbuttonColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormData {
  String email = '';
  String password = '';
}
