import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/generated/l10n.dart';
import 'package:flutter_web_dashboard/route/app_route.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _passwordTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  final _formData = FormData();

  var _isFormLoading = false;

  Future<void> _doRegisterAsync({
    required void Function(String message) onSuccess,
    required void Function(String message) onError,
  }) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();

      setState(() => _isFormLoading = true);

      Future.delayed(const Duration(seconds: 1), () async {
        if (_formData.username == 'admin') {
          onError.call('This username is already taken.');
        } else {
          onSuccess.call('Your account has been successfully created.');
        }

        setState(() => _isFormLoading = false);
      });
    }
  }

  void _onRegisterSuccess(BuildContext context, String message) {
    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      desc: message,
      width: kDialogWidth,
      btnOkText: Lang.of(context).loginNow,
      btnOkOnPress: () => GoRouter.of(context).go(RouteUri.home),
    );

    dialog.show();
  }

  void _onRegisterError(BuildContext context, String message) {
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
  void dispose() {
    _passwordTextEditingController.dispose();

    super.dispose();
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
                      Text(
                        lang.appTitle,
                        style: themeData.textTheme.labelLarge,
                      ),
                      buildSizedBoxH(kDefaultPadding),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: kDefaultPadding * 2.0),
                        child: Text(
                          lang.registerANewAccount,
                          style: themeData.textTheme.titleMedium,
                        ),
                      ),
                      FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 1.5),
                              child: FormBuilderTextField(
                                name: 'username',
                                decoration: InputDecoration(
                                  labelText: lang.username,
                                  hintText: lang.username,
                                  helperText:
                                      '* To test registration fail: admin',
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                enableSuggestions: false,
                                validator: FormBuilderValidators.required(),
                                onSaved: (value) =>
                                    (_formData.username = value ?? ''),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 1.5),
                              child: FormBuilderTextField(
                                name: 'email',
                                decoration: InputDecoration(
                                  labelText: lang.email,
                                  hintText: lang.email,
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: FormBuilderValidators.required(),
                                onSaved: (value) =>
                                    (_formData.email = value ?? ''),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 1.5),
                              child: FormBuilderTextField(
                                name: 'password',
                                decoration: InputDecoration(
                                  labelText: lang.password,
                                  hintText: lang.password,
                                  helperText: lang.passwordHelperText,
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                enableSuggestions: false,
                                obscureText: true,
                                controller: _passwordTextEditingController,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(6),
                                  FormBuilderValidators.maxLength(18),
                                ]),
                                onSaved: (value) =>
                                    (_formData.password = value ?? ''),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderTextField(
                                name: 'retypePassword',
                                decoration: InputDecoration(
                                  labelText: lang.retypePassword,
                                  hintText: lang.retypePassword,
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                enableSuggestions: false,
                                obscureText: true,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  (value) {
                                    if (_formKey.currentState
                                            ?.fields['password']?.value !=
                                        value) {
                                      return lang.passwordNotMatch;
                                    }

                                    return null;
                                  },
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding),
                              child: SizedBox(
                                height: 40.0,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: (_isFormLoading
                                      ? null
                                      : () => _doRegisterAsync(
                                            onSuccess: (message) =>
                                                _onRegisterSuccess(
                                                    context, message),
                                            onError: (message) =>
                                                _onRegisterError(
                                                    context, message),
                                          )),
                                  child: Text(lang.register),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () =>
                                    GoRouter.of(context).go(RouteUri.login),
                                child: Text(lang.backToLogin),
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
  String username = '';
  String email = '';
  String password = '';
  String firstname = '';
  String lastname = '';
  String address = '';
  String city = '';
  String country = '';
  String postalCode = '';
}
