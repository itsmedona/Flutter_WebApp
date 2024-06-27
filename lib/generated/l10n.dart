// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(_current != null,
        'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(instance != null,
        'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?');
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Admin Portal Login`
  String get adminPortalLogin {
    return Intl.message(
      'Admin Portal Login',
      name: 'adminPortalLogin',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Web Dashboard`
  String get appTitle {
    return Intl.message(
      'Flutter Web Dashboard',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Button Emphasis`
  String get buttonEmphasis {
    return Intl.message(
      'Button Emphasis',
      name: 'buttonEmphasis',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Button} other{Buttons}}`
  String buttons(num count) {
    return Intl.plural(
      count,
      one: 'Button',
      other: 'Buttons',
      name: 'buttons',
      desc: '',
      args: [count],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Close Navigation Menu`
  String get closeNavigationMenu {
    return Intl.message(
      'Close Navigation Menu',
      name: 'closeNavigationMenu',
      desc: '',
      args: [],
    );
  }

  /// `COLORS`
  String get colors {
    return Intl.message(
      'COLORS',
      name: 'colors',
      desc: '',
      args: [],
    );
  }

  /// `Color Palette`
  String get colorPalette {
    return Intl.message(
      'Color Palette',
      name: 'colorPalette',
      desc: '',
      args: [],
    );
  }

  /// `Color Scheme`
  String get colorScheme {
    return Intl.message(
      'Color Scheme',
      name: 'colorScheme',
      desc: '',
      args: [],
    );
  }

  /// `Confirm delete this record?`
  String get confirmDeleteRecord {
    return Intl.message(
      'Confirm delete this record?',
      name: 'confirmDeleteRecord',
      desc: '',
      args: [],
    );
  }

  /// `Confirm submit this record?`
  String get confirmSubmitRecord {
    return Intl.message(
      'Confirm submit this record?',
      name: 'confirmSubmitRecord',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid credit card number.`
  String get creditCardErrorText {
    return Intl.message(
      'This field requires a valid credit card number.',
      name: 'creditCardErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get crudBack {
    return Intl.message(
      'Back',
      name: 'crudBack',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get crudDelete {
    return Intl.message(
      'Delete',
      name: 'crudDelete',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get crudDetail {
    return Intl.message(
      'Detail',
      name: 'crudDetail',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get crudNew {
    return Intl.message(
      'New',
      name: 'crudNew',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid date string.`
  String get dateStringErrorText {
    return Intl.message(
      'This field requires a valid date string.',
      name: 'dateStringErrorText',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Dialog} other{Dialogs}}`
  String dialogs(num count) {
    return Intl.plural(
      count,
      one: 'Dialog',
      other: 'Dialogs',
      name: 'dialogs',
      desc: '',
      args: [count],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid email address.`
  String get emailErrorText {
    return Intl.message(
      'This field requires a valid email address.',
      name: 'emailErrorText',
      desc: '',
      args: [],
    );
  }

  /// `This field value must be equal to {value}.`
  String equalErrorText(Object value) {
    return Intl.message(
      'This field value must be equal to $value.',
      name: 'equalErrorText',
      desc: '',
      args: [value],
    );
  }

  /// `Error404`
  String get error404 {
    return Intl.message(
      'Error404',
      name: 'error404',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, the page you are looking for has been removed or not exists.`
  String get error404Message {
    return Intl.message(
      'Sorry, the page you are looking for has been removed or not exists.',
      name: 'error404Message',
      desc: '',
      args: [],
    );
  }

  /// `Page not found`
  String get error404Title {
    return Intl.message(
      'Page not found',
      name: 'error404Title',
      desc: '',
      args: [],
    );
  }

  /// `Example`
  String get example {
    return Intl.message(
      'Example',
      name: 'example',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Extension} other{Extensions}}`
  String extensions(num count) {
    return Intl.plural(
      count,
      one: 'Extension',
      other: 'Extensions',
      name: 'extensions',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{Form} other{Forms}}`
  String forms(num count) {
    return Intl.plural(
      count,
      one: 'Form',
      other: 'Forms',
      name: 'forms',
      desc: '',
      args: [count],
    );
  }

  /// `General UI`
  String get generalUi {
    return Intl.message(
      'General UI',
      name: 'generalUi',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homePage {
    return Intl.message(
      'Home',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `IFrame Demo`
  String get iframeDemo {
    return Intl.message(
      'IFrame Demo',
      name: 'iframeDemo',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid integer.`
  String get integerErrorText {
    return Intl.message(
      'This field requires a valid integer.',
      name: 'integerErrorText',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid IP.`
  String get ipErrorText {
    return Intl.message(
      'This field requires a valid IP.',
      name: 'ipErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightTheme {
    return Intl.message(
      'Light Theme',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login now!`
  String get loginNow {
    return Intl.message(
      'Login now!',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit`
  String get loremIpsum {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      name: 'loremIpsum',
      desc: '',
      args: [],
    );
  }

  /// `Value does not match pattern.`
  String get matchErrorText {
    return Intl.message(
      'Value does not match pattern.',
      name: 'matchErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Value must be less than or equal to {max}`
  String maxErrorText(Object max) {
    return Intl.message(
      'Value must be less than or equal to $max',
      name: 'maxErrorText',
      desc: '',
      args: [max],
    );
  }

  /// `Value must have a length less than or equal to {maxLength}`
  String maxLengthErrorText(Object maxLength) {
    return Intl.message(
      'Value must have a length less than or equal to $maxLength',
      name: 'maxLengthErrorText',
      desc: '',
      args: [maxLength],
    );
  }

  /// `Value must be greater than or equal to {min}.`
  String minErrorText(Object min) {
    return Intl.message(
      'Value must be greater than or equal to $min.',
      name: 'minErrorText',
      desc: '',
      args: [min],
    );
  }

  /// `Value must have a length greater than or equal to {minLength}`
  String minLengthErrorText(Object minLength) {
    return Intl.message(
      'Value must have a length greater than or equal to $minLength',
      name: 'minLengthErrorText',
      desc: '',
      args: [minLength],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{New Order} other{New Orders}}`
  String newOrders(num count) {
    return Intl.plural(
      count,
      one: 'New Order',
      other: 'New Orders',
      name: 'newOrders',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{New User} other{New Users}}`
  String newUsers(num count) {
    return Intl.plural(
      count,
      one: 'New User',
      other: 'New Users',
      name: 'newUsers',
      desc: '',
      args: [count],
    );
  }

  /// `This field value must not be equal to {value}.`
  String notEqualErrorText(Object value) {
    return Intl.message(
      'This field value must not be equal to $value.',
      name: 'notEqualErrorText',
      desc: '',
      args: [value],
    );
  }

  /// `Value must be numeric.`
  String get numericErrorText {
    return Intl.message(
      'Value must be numeric.',
      name: 'numericErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Open in new tab`
  String get openInNewTab {
    return Intl.message(
      'Open in new tab',
      name: 'openInNewTab',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Pages} other{pages}}`
  String pages(num count) {
    return Intl.plural(
      count,
      one: 'Pages',
      other: 'pages',
      name: 'pages',
      desc: '',
      args: [count],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `* 6 - 18 characters`
  String get passwordHelperText {
    return Intl.message(
      '* 6 - 18 characters',
      name: 'passwordHelperText',
      desc: '',
      args: [],
    );
  }

  /// `Password not match.`
  String get passwordNotMatch {
    return Intl.message(
      'Password not match.',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Pending Issue} other{Pending Issues}}`
  String pendingIssues(num count) {
    return Intl.plural(
      count,
      one: 'Pending Issue',
      other: 'Pending Issues',
      name: 'pendingIssues',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{Recent Order} other{Recent Orders}}`
  String recentOrders(num count) {
    return Intl.plural(
      count,
      one: 'Recent Order',
      other: 'Recent Orders',
      name: 'recentOrders',
      desc: '',
      args: [count],
    );
  }

  /// `Record deleted successfully.`
  String get recordDeletedSuccessfully {
    return Intl.message(
      'Record deleted successfully.',
      name: 'recordDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Record saved successfully.`
  String get recordSavedSuccessfully {
    return Intl.message(
      'Record saved successfully.',
      name: 'recordSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Record submitted successfully.`
  String get recordSubmittedSuccessfully {
    return Intl.message(
      'Record submitted successfully.',
      name: 'recordSubmittedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Register a new account`
  String get registerANewAccount {
    return Intl.message(
      'Register a new account',
      name: 'registerANewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register now!`
  String get registerNow {
    return Intl.message(
      'Register now!',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty.`
  String get requiredErrorText {
    return Intl.message(
      'This field cannot be empty.',
      name: 'requiredErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Retype Password`
  String get retypePassword {
    return Intl.message(
      'Retype Password',
      name: 'retypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Text Emphasis`
  String get textEmphasis {
    return Intl.message(
      'Text Emphasis',
      name: 'textEmphasis',
      desc: '',
      args: [],
    );
  }

  /// `Text Theme`
  String get textTheme {
    return Intl.message(
      'Text Theme',
      name: 'textTheme',
      desc: '',
      args: [],
    );
  }

  /// `Today Sales`
  String get todaySales {
    return Intl.message(
      'Today Sales',
      name: 'todaySales',
      desc: '',
      args: [],
    );
  }

  /// `Typography`
  String get typography {
    return Intl.message(
      'Typography',
      name: 'typography',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{UI Element} other{UI Elements}}`
  String uiElements(num count) {
    return Intl.plural(
      count,
      one: 'UI Element',
      other: 'UI Elements',
      name: 'uiElements',
      desc: '',
      args: [count],
    );
  }

  /// `This field requires a valid URL address.`
  String get urlErrorText {
    return Intl.message(
      'This field requires a valid URL address.',
      name: 'urlErrorText',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `BANDWIDTH REPORTS`
  String get brandwidthreport {
    return Intl.message(
      'BANDWIDTH REPORTS',
      name: 'brandwidthreport',
      desc: '',
      args: [],
    );
  }

  /// `Tab 1`
  String get tabone {
    return Intl.message(
      'Tab 1',
      name: 'tabone',
      desc: '',
      args: [],
    );
  }

  /// `Tab 2`
  String get tabtwo {
    return Intl.message(
      'Tab 2',
      name: 'tabtwo',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Component} other{Components}}`
  String components(num count) {
    return Intl.plural(
      count,
      one: 'Component',
      other: 'Components',
      name: 'components',
      desc: '',
      args: [count],
    );
  }

  /// `Tabs`
  String get tabs {
    return Intl.message(
      'Tabs',
      name: 'tabs',
      desc: '',
      args: [],
    );
  }

  /// `Basic Dashboard`
  String get dashboardtitle {
    return Intl.message(
      'Basic Dashboard',
      name: 'dashboardtitle',
      desc: '',
      args: [],
    );
  }

  /// `This is an example dashboard created using build-in elements and components.`
  String get dashboardsubtitle {
    return Intl.message(
      'This is an example dashboard created using build-in elements and components.',
      name: 'dashboardsubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tabs are used to split content between multiple sections. Wide variety available.`
  String get tabsubtitle {
    return Intl.message(
      'Tabs are used to split content between multiple sections. Wide variety available.',
      name: 'tabsubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Standard Buttons`
  String get standardButton {
    return Intl.message(
      'Standard Buttons',
      name: 'standardButton',
      desc: '',
      args: [],
    );
  }

  /// `Wide selection of buttons that feature different styles for backgrounds, borders and hover options!`
  String get standardButtonSubtitle {
    return Intl.message(
      'Wide selection of buttons that feature different styles for backgrounds, borders and hover options!',
      name: 'standardButtonSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Solid`
  String get solid {
    return Intl.message(
      'Solid',
      name: 'solid',
      desc: '',
      args: [],
    );
  }

  /// `Dropdowns`
  String get dropdowns {
    return Intl.message(
      'Dropdowns',
      name: 'dropdowns',
      desc: '',
      args: [],
    );
  }

  /// `Multiple styles, actions and effects are available for the Archited Framework dropdown buttons.`
  String get dropdownSubtitle {
    return Intl.message(
      'Multiple styles, actions and effects are available for the Archited Framework dropdown buttons.',
      name: 'dropdownSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Regular Dropdowns`
  String get regularDropdowns {
    return Intl.message(
      'Regular Dropdowns',
      name: 'regularDropdowns',
      desc: '',
      args: [],
    );
  }

  /// `Icons`
  String get icons {
    return Intl.message(
      'Icons',
      name: 'icons',
      desc: '',
      args: [],
    );
  }

  /// `Wide icons selection including from flag icons to FontAwesome and other icons libraries.`
  String get iconsSubtitle {
    return Intl.message(
      'Wide icons selection including from flag icons to FontAwesome and other icons libraries.',
      name: 'iconsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Pe7 Icons`
  String get pe7Icons {
    return Intl.message(
      'Pe7 Icons',
      name: 'pe7Icons',
      desc: '',
      args: [],
    );
  }

  /// `FontAwesome`
  String get fontAwesome {
    return Intl.message(
      'FontAwesome',
      name: 'fontAwesome',
      desc: '',
      args: [],
    );
  }

  /// `Linear Icons`
  String get linearIcons {
    return Intl.message(
      'Linear Icons',
      name: 'linearIcons',
      desc: '',
      args: [],
    );
  }

  /// `GRADIENT ICONS`
  String get gradientIcon {
    return Intl.message(
      'GRADIENT ICONS',
      name: 'gradientIcon',
      desc: '',
      args: [],
    );
  }

  /// `Badges & Labels`
  String get badgesAndLabels {
    return Intl.message(
      'Badges & Labels',
      name: 'badgesAndLabels',
      desc: '',
      args: [],
    );
  }

  /// `Badges`
  String get badges {
    return Intl.message(
      'Badges',
      name: 'badges',
      desc: '',
      args: [],
    );
  }

  /// `Labels`
  String get labels {
    return Intl.message(
      'Labels',
      name: 'labels',
      desc: '',
      args: [],
    );
  }

  /// `Badges and labels are used to offer extra small pieces of info for your content.`
  String get badgesAndLabelsSubtitle {
    return Intl.message(
      'Badges and labels are used to offer extra small pieces of info for your content.',
      name: 'badgesAndLabelsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `PILLS`
  String get pills {
    return Intl.message(
      'PILLS',
      name: 'pills',
      desc: '',
      args: [],
    );
  }

  /// `LINKS`
  String get links {
    return Intl.message(
      'LINKS',
      name: 'links',
      desc: '',
      args: [],
    );
  }

  /// `WITH BUTTONS`
  String get withButtons {
    return Intl.message(
      'WITH BUTTONS',
      name: 'withButtons',
      desc: '',
      args: [],
    );
  }

  /// `BADGE DOTS BUTTONS`
  String get badgeDotButtons {
    return Intl.message(
      'BADGE DOTS BUTTONS',
      name: 'badgeDotButtons',
      desc: '',
      args: [],
    );
  }

  /// `BADGE DOTS`
  String get badgeDots {
    return Intl.message(
      'BADGE DOTS',
      name: 'badgeDots',
      desc: '',
      args: [],
    );
  }

  /// `ICON BUTTONS WITH BADGES`
  String get iconButtonsWith {
    return Intl.message(
      'ICON BUTTONS WITH BADGES',
      name: 'iconButtonsWith',
      desc: '',
      args: [],
    );
  }

  /// `Product card`
  String get productcard {
    return Intl.message(
      'Product card',
      name: 'productcard',
      desc: '',
      args: [],
    );
  }

  /// `Cards`
  String get cards {
    return Intl.message(
      'Cards',
      name: 'cards',
      desc: '',
      args: [],
    );
  }

  /// `Wide selection of cards with multiple styles, borders, actions and hover effects.`
  String get cardsubtitle {
    return Intl.message(
      'Wide selection of cards with multiple styles, borders, actions and hover effects.',
      name: 'cardsubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Basic`
  String get basic {
    return Intl.message(
      'Basic',
      name: 'basic',
      desc: '',
      args: [],
    );
  }

  /// `Color States`
  String get colorStates {
    return Intl.message(
      'Color States',
      name: 'colorStates',
      desc: '',
      args: [],
    );
  }

  /// `It provides additional information related to the product or highlights specific details about it.`
  String get productsubTitle {
    return Intl.message(
      'It provides additional information related to the product or highlights specific details about it.',
      name: 'productsubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get form {
    return Intl.message(
      'Form',
      name: 'form',
      desc: '',
      args: [],
    );
  }

  /// `It provides additional information related to the Form or highlights specific details about it.`
  String get formsubTitle {
    return Intl.message(
      'It provides additional information related to the Form or highlights specific details about it.',
      name: 'formsubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dailogs`
  String get dailogs {
    return Intl.message(
      'Dailogs',
      name: 'dailogs',
      desc: '',
      args: [],
    );
  }

  /// `It provides additional information related to the Dailogs or highlights specific details about it.`
  String get dailogTitle {
    return Intl.message(
      'It provides additional information related to the Dailogs or highlights specific details about it.',
      name: 'dailogTitle',
      desc: '',
      args: [],
    );
  }

  /// `List Groups`
  String get listGroup {
    return Intl.message(
      'List Groups',
      name: 'listGroup',
      desc: '',
      args: [],
    );
  }

  /// `These can be used with other components and elements to create stunning and unique new elements for your UIs.`
  String get listGroupSubtitle {
    return Intl.message(
      'These can be used with other components and elements to create stunning and unique new elements for your UIs.',
      name: 'listGroupSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Navigation Menus`
  String get navigationMenus {
    return Intl.message(
      'Navigation Menus',
      name: 'navigationMenus',
      desc: '',
      args: [],
    );
  }

  /// `Navigation menus are one of the basic building blocks for any web or mobile app.`
  String get navigationMenuSubtitle {
    return Intl.message(
      'Navigation menus are one of the basic building blocks for any web or mobile app.',
      name: 'navigationMenuSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Vertical Menus`
  String get verticalMenus {
    return Intl.message(
      'Vertical Menus',
      name: 'verticalMenus',
      desc: '',
      args: [],
    );
  }

  /// `Horizontal Menus`
  String get horizontalMenus {
    return Intl.message(
      'Horizontal Menus',
      name: 'horizontalMenus',
      desc: '',
      args: [],
    );
  }

  /// `Pogress Bar`
  String get pogressbar {
    return Intl.message(
      'Pogress Bar',
      name: 'pogressbar',
      desc: '',
      args: [],
    );
  }

  /// `It provides additional information related to the Pogress bar or highlights specific details about it.`
  String get pogressbarTitle {
    return Intl.message(
      'It provides additional information related to the Pogress bar or highlights specific details about it.',
      name: 'pogressbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Notifications represent one of the best ways to give feedback for various users actions.`
  String get notificationsTitle {
    return Intl.message(
      'Notifications represent one of the best ways to give feedback for various users actions.',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Utilities`
  String get utilities {
    return Intl.message(
      'Utilities',
      name: 'utilities',
      desc: '',
      args: [],
    );
  }

  /// `These are helpers that speed up the dev time for various components and effects.`
  String get UtilitiesSubtitle {
    return Intl.message(
      'These are helpers that speed up the dev time for various components and effects.',
      name: 'UtilitiesSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Validation`
  String get validation {
    return Intl.message(
      'Validation',
      name: 'validation',
      desc: '',
      args: [],
    );
  }

  /// `Form Validation`
  String get formValidation {
    return Intl.message(
      'Form Validation',
      name: 'formValidation',
      desc: '',
      args: [],
    );
  }

  /// `Inline validation is very easy to implement using the ArchitectUI.`
  String get formValidationSubtitle {
    return Intl.message(
      'Inline validation is very easy to implement using the ArchitectUI.',
      name: 'formValidationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Regular Tables`
  String get regularTables {
    return Intl.message(
      'Regular Tables',
      name: 'regularTables',
      desc: '',
      args: [],
    );
  }

  /// `Tables are the backbone of almost all web applications.`
  String get regularTableSubtitle {
    return Intl.message(
      'Tables are the backbone of almost all web applications.',
      name: 'regularTableSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tooltips & Popovers`
  String get tooltip {
    return Intl.message(
      'Tooltips & Popovers',
      name: 'tooltip',
      desc: '',
      args: [],
    );
  }

  /// `These Flutter components are used to add interaction or extra information for your app's content.`
  String get tooltipSubtitle {
    return Intl.message(
      'These Flutter components are used to add interaction or extra information for your app\'s content.',
      name: 'tooltipSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Chart`
  String get chartJS {
    return Intl.message(
      'Chart',
      name: 'chartJS',
      desc: '',
      args: [],
    );
  }

  /// `Huge selection of charts created with the Flutter Chart Plugin`
  String get chartJSSubtitle {
    return Intl.message(
      'Huge selection of charts created with the Flutter Chart Plugin',
      name: 'chartJSSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Circular Charts`
  String get circularCharts {
    return Intl.message(
      'Circular Charts',
      name: 'circularCharts',
      desc: '',
      args: [],
    );
  }

  /// `Lines & Bars Charts`
  String get linesAndBarsCharts {
    return Intl.message(
      'Lines & Bars Charts',
      name: 'linesAndBarsCharts',
      desc: '',
      args: [],
    );
  }

  /// `Carousels & Slideshows`
  String get carousels {
    return Intl.message(
      'Carousels & Slideshows',
      name: 'carousels',
      desc: '',
      args: [],
    );
  }

  /// `Create easy and beautiful slideshows with these Flutter components.`
  String get carouselsSubtitle {
    return Intl.message(
      'Create easy and beautiful slideshows with these Flutter components.',
      name: 'carouselsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Maps`
  String get map {
    return Intl.message(
      'Maps',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Sorry Page Not Found`
  String get sorrypagenotfound {
    return Intl.message(
      'Sorry Page Not Found',
      name: 'sorrypagenotfound',
      desc: '',
      args: [],
    );
  }

  /// `It will be as simple as Occidental in fact, it will be Occidental`
  String get itwillbetext {
    return Intl.message(
      'It will be as simple as Occidental in fact, it will be Occidental',
      name: 'itwillbetext',
      desc: '',
      args: [],
    );
  }

  /// `Back To DashBoard`
  String get backtodashboard {
    return Intl.message(
      'Back To DashBoard',
      name: 'backtodashboard',
      desc: '',
      args: [],
    );
  }

  /// `INTERNAL SERVER ERROR`
  String get error500 {
    return Intl.message(
      'INTERNAL SERVER ERROR',
      name: 'error500',
      desc: '',
      args: [],
    );
  }

  /// `Site is Under Maintenance`
  String get siteundermaintenence {
    return Intl.message(
      'Site is Under Maintenance',
      name: 'siteundermaintenence',
      desc: '',
      args: [],
    );
  }

  /// `Please check back in sometime.`
  String get pleasecheckbackinsometime {
    return Intl.message(
      'Please check back in sometime.',
      name: 'pleasecheckbackinsometime',
      desc: '',
      args: [],
    );
  }

  /// `Error500`
  String get error500title {
    return Intl.message(
      'Error500',
      name: 'error500title',
      desc: '',
      args: [],
    );
  }

  /// `Implement in your applications Google or vector maps.`
  String get mapsubtitle {
    return Intl.message(
      'Implement in your applications Google or vector maps.',
      name: 'mapsubtitle',
      desc: '',
      args: [],
    );
  }

  /// `WHY IS THE SITE DOWN?`
  String get whyisthissitedown {
    return Intl.message(
      'WHY IS THE SITE DOWN?',
      name: 'whyisthissitedown',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard Boxes`
  String get DashboardBox {
    return Intl.message(
      'Dashboard Boxes',
      name: 'DashboardBox',
      desc: '',
      args: [],
    );
  }

  /// `These boxes can be used to show numbers and data in a breautiful user friendly way.`
  String get Dashboardboxestitle {
    return Intl.message(
      'These boxes can be used to show numbers and data in a breautiful user friendly way.',
      name: 'Dashboardboxestitle',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{Authentication} other{Authentication}}`
  String authentication(num count) {
    return Intl.plural(
      count,
      one: 'Authentication',
      other: 'Authentication',
      name: 'authentication',
      desc: '',
      args: [count],
    );
  }

  /// `Recover Password`
  String get resetpassword {
    return Intl.message(
      'Recover Password',
      name: 'resetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password With Dashify`
  String get resetpassTitle {
    return Intl.message(
      'Reset Password With Dashify',
      name: 'resetpassTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remember It ?`
  String get Rememberit {
    return Intl.message(
      'Remember It ?',
      name: 'Rememberit',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get Reset {
    return Intl.message(
      'Reset',
      name: 'Reset',
      desc: '',
      args: [],
    );
  }

  /// `Maintenence`
  String get maintanence {
    return Intl.message(
      'Maintenence',
      name: 'maintanence',
      desc: '',
      args: [],
    );
  }

  /// `WHAT IS THE DOWNTIME?`
  String get whatisthedowntime {
    return Intl.message(
      'WHAT IS THE DOWNTIME?',
      name: 'whatisthedowntime',
      desc: '',
      args: [],
    );
  }

  /// `DO YOU NEED SUPPORT?`
  String get doyouneedsupport {
    return Intl.message(
      'DO YOU NEED SUPPORT?',
      name: 'doyouneedsupport',
      desc: '',
      args: [],
    );
  }

  /// `Let's get started with Dashify`
  String get letsgetstart {
    return Intl.message(
      'Let\'s get started with Dashify',
      name: 'letsgetstart',
      desc: '',
      args: [],
    );
  }

  /// `It will be as simple as Occidental in fact it will be Occidental.`
  String get itwillbesimple {
    return Intl.message(
      'It will be as simple as Occidental in fact it will be Occidental.',
      name: 'itwillbesimple',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email Address...`
  String get enteremailaddress {
    return Intl.message(
      'Enter Email Address...',
      name: 'enteremailaddress',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Comming Soon`
  String get commingsoon {
    return Intl.message(
      'Comming Soon',
      name: 'commingsoon',
      desc: '',
      args: [],
    );
  }

  /// `Can't find what you are looking for?`
  String get cantfinde {
    return Intl.message(
      'Can\'t find what you are looking for?',
      name: 'cantfinde',
      desc: '',
      args: [],
    );
  }

  /// `If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual`
  String get ifservallanguage {
    return Intl.message(
      'If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual',
      name: 'ifservallanguage',
      desc: '',
      args: [],
    );
  }

  /// `Email Us`
  String get emailus {
    return Intl.message(
      'Email Us',
      name: 'emailus',
      desc: '',
      args: [],
    );
  }

  /// `Send us a tweet`
  String get sendusatweet {
    return Intl.message(
      'Send us a tweet',
      name: 'sendusatweet',
      desc: '',
      args: [],
    );
  }

  /// `FAQ's`
  String get faq {
    return Intl.message(
      'FAQ\'s',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Genral Question`
  String get genralquestion {
    return Intl.message(
      'Genral Question',
      name: 'genralquestion',
      desc: '',
      args: [],
    );
  }

  /// `privacy Policy`
  String get privacypolicy {
    return Intl.message(
      'privacy Policy',
      name: 'privacypolicy',
      desc: '',
      args: [],
    );
  }

  /// `Pricing & Planse`
  String get pricingplanse {
    return Intl.message(
      'Pricing & Planse',
      name: 'pricingplanse',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'gu'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
