import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/theme/app_sidebar_theme.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    final appSidebarTheme = AppSidebarTheme(
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.whiteColor,
      sidebarWidth: 304.0,
      sidebarLeftPadding: kDefaultPadding,
      sidebarTopPadding: kDefaultPadding,
      sidebarRightPadding: kDefaultPadding,
      sidebarBottomPadding: kDefaultPadding,
      headerUserProfileRadius: 20.0,
      headerUsernameFontSize: 14.0,
      headerTextButtonFontSize: 14.0,
      menuFontSize: 14.0,
      menuBorderRadius: 5.0,
      menuLeftPadding: 0.0,
      menuTopPadding: 2.0,
      menuRightPadding: 0.0,
      menuBottomPadding: 2.0,
      menuHoverColor: Colors.white.withOpacity(0.3),
      menuSelectedFontColor: Colors.white.withOpacity(0.3),
      menuSelectedBackgroundColor: kScreenBackgroundColor.withOpacity(0.3),
      menuExpandedBackgroundColor: Colors.white.withOpacity(0.3),
      menuExpandedHoverColor: Colors.white.withOpacity(0.3),
      menuExpandedChildLeftPadding: 4.0,
      menuExpandedChildTopPadding: 2.0,
      menuExpandedChildRightPadding: 4.0,
      menuExpandedChildBottomPadding: 2.0,
    );
    return isDarkTheme
        ? ThemeColors.lightTheme.copyWith(extensions: [appSidebarTheme])
        : ThemeColors.darkTheme.copyWith(extensions: [appSidebarTheme]);
  }
}

class ThemeColors {
  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackgroundColor,
    ),
    scaffoldBackgroundColor: kScreenBackgroundColor,
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF343A40)),
    colorScheme: const ColorScheme(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: kSecondaryColor,
      onSecondary: Colors.white,
      error: kErrorColor,
      brightness: Brightness.light,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    cardTheme: const CardTheme(
      margin: EdgeInsets.zero,
    ),
  );

  final appColorScheme = AppColorScheme(
    primary: AppColors.primaryColor,
    secondary: kSecondaryColor,
    error: kErrorColor,
    success: kSuccessColor,
    info: kInfoColor,
    warning: kWarningColor,
    hyperlink: const Color(0xFF0074CC),
    buttonTextBlack: kTextColor,
    buttonTextDisabled: kTextColor.withOpacity(0.38),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: const Color(0xFF00040F),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: AppColors.darkTextColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
    ),
    colorScheme: ColorScheme(
      background: AppColors.darkBackgroundColor,
      primary: AppColors.primaryColor, // Customize your primary variant color
      secondary: Colors.green, // Customize your secondary variant color
      surface: Colors.grey.shade900, // Customize your surface color
      error: Colors.red, // Customize your error color
      onPrimary: Colors.white, // Customize your on-primary color
      onSecondary: Colors.white, // Customize your on-secondary color
      onSurface: Colors.white, // Customize your on-surface color
      onBackground: Colors.white, // Customize your on-background color
      onError: Colors.white, // Customize your on-error color
      brightness: Brightness.dark,
    ),
  );
  static Brightness get currentSystemBrightness =>
      // ignore: deprecated_member_use
      SchedulerBinding.instance.window.platformBrightness;
}

extension ThemeExtras on ThemeData {
  Color get navBarColor => brightness == Brightness.light
      ? const Color(0xffF0F0F0)
      : const Color(0xFF00040F);
  //
  Color get textColor => brightness == Brightness.light
      ? const Color(0xFF403930)
      : const Color(0xFFFFF8F2);

  //
  Color get secondaryColor => const Color(0xFFFE53BB);
  //
  Gradient get serviceCard =>
      brightness == Brightness.light ? AppColors.grayWhite : AppColors.grayBack;

  //
  Gradient get contactCard => brightness == Brightness.light
      ? AppColors.grayWhite
      : AppColors.contactGradi;
}

// const Color kPrimaryColor = Color(0xFF347BDE);
const Color kSecondaryColor = Color(0xFF6C757D);
const Color kErrorColor = Color(0xFFDC3545);
const Color kSuccessColor = Color(0xFF08A158);
const Color kInfoColor = Color(0xFF17A2B8);
const Color kWarningColor = Color(0xFFFFc107);
const Color kTextColor = Color(0xFF2A2B2D);
const Color kScreenBackgroundColor = Color(0xFFF4F6F9);

// ThemeData light() {
//   return lighttheme.copyWith(
//     textTheme: themeData.textTheme.apply(
//       bodyColor: kTextColor,
//       displayColor: kTextColor,
//     ),
//     extensions: [
//       AppButtonTheme.fromAppColorScheme(appColorScheme),
//       appColorScheme,
//       AppDataTableTheme.fromTheme(themeData),
//       appSidebarTheme,
//     ],
//   );
// }

ThemeData dark() {
  final themeData = ThemeData.dark().copyWith(
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF343A40)),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      margin: EdgeInsets.zero,
    ),
  );

  final appColorScheme = AppColorScheme(
    primary: AppColors.primaryColor,
    secondary: kSecondaryColor,
    error: kErrorColor,
    success: kSuccessColor,
    info: kInfoColor,
    warning: kWarningColor,
    hyperlink: const Color(0xFF6BBBF7),
    buttonTextBlack: kTextColor,
    buttonTextDisabled: Colors.white.withOpacity(0.38),
  );

  final appSidebarTheme = AppSidebarTheme(
    backgroundColor: themeData.drawerTheme.backgroundColor!,
    foregroundColor: const Color(0xFFC2C7D0),
    sidebarWidth: 304.0,
    sidebarLeftPadding: kDefaultPadding,
    sidebarTopPadding: kDefaultPadding,
    sidebarRightPadding: kDefaultPadding,
    sidebarBottomPadding: kDefaultPadding,
    headerUserProfileRadius: 20.0,
    headerUsernameFontSize: 14.0,
    headerTextButtonFontSize: 14.0,
    menuFontSize: 14.0,
    menuBorderRadius: 5.0,
    menuLeftPadding: 0.0,
    menuTopPadding: 2.0,
    menuRightPadding: 0.0,
    menuBottomPadding: 2.0,
    menuHoverColor: Colors.white.withOpacity(0.2),
    menuSelectedFontColor: Colors.white,
    menuSelectedBackgroundColor: appColorScheme.primary,
    menuExpandedBackgroundColor: Colors.white.withOpacity(0.1),
    menuExpandedHoverColor: Colors.white.withOpacity(0.1),
    menuExpandedChildLeftPadding: 4.0,
    menuExpandedChildTopPadding: 2.0,
    menuExpandedChildRightPadding: 4.0,
    menuExpandedChildBottomPadding: 2.0,
  );

  return themeData.copyWith(
    extensions: [
      AppButtonTheme.fromAppColorScheme(appColorScheme),
      appColorScheme,
      AppDataTableTheme.fromTheme(themeData),
      appSidebarTheme,
    ],
  );
}

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color primary;
  final Color secondary;
  final Color error;
  final Color success;
  final Color info;
  final Color warning;
  final Color hyperlink;
  final Color buttonTextBlack;
  final Color buttonTextDisabled;

  const AppColorScheme({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.success,
    required this.info,
    required this.warning,
    required this.hyperlink,
    required this.buttonTextBlack,
    required this.buttonTextDisabled,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? secondary,
    Color? error,
    Color? success,
    Color? info,
    Color? warning,
    Color? hyperlink,
    Color? buttonTextBlack,
    Color? buttonTextDisabled,
  }) {
    return AppColorScheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      hyperlink: hyperlink ?? this.hyperlink,
      buttonTextBlack: buttonTextBlack ?? this.buttonTextBlack,
      buttonTextDisabled: buttonTextDisabled ?? this.buttonTextDisabled,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
      ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      info: Color.lerp(info, other.info, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      hyperlink: Color.lerp(hyperlink, other.hyperlink, t)!,
      buttonTextBlack: Color.lerp(buttonTextBlack, other.buttonTextBlack, t)!,
      buttonTextDisabled:
          Color.lerp(buttonTextDisabled, other.buttonTextDisabled, t)!,
    );
  }
}

class AppButtonTheme extends ThemeExtension<AppButtonTheme> {
  final ButtonStyle primaryElevated;
  final ButtonStyle secondaryElevated;
  final ButtonStyle errorElevated;
  final ButtonStyle successElevated;
  final ButtonStyle infoElevated;
  final ButtonStyle warningElevated;
  final ButtonStyle primaryOutlined;
  final ButtonStyle secondaryOutlined;
  final ButtonStyle errorOutlined;
  final ButtonStyle successOutlined;
  final ButtonStyle infoOutlined;
  final ButtonStyle warningOutlined;

  final ButtonStyle primaryText;
  final ButtonStyle secondaryText;
  final ButtonStyle errorText;
  final ButtonStyle successText;
  final ButtonStyle infoText;
  final ButtonStyle warningText;

  const AppButtonTheme({
    required this.primaryElevated,
    required this.secondaryElevated,
    required this.errorElevated,
    required this.successElevated,
    required this.infoElevated,
    required this.warningElevated,
    required this.primaryOutlined,
    required this.secondaryOutlined,
    required this.errorOutlined,
    required this.successOutlined,
    required this.infoOutlined,
    required this.warningOutlined,
    required this.primaryText,
    required this.secondaryText,
    required this.errorText,
    required this.successText,
    required this.infoText,
    required this.warningText,
  });

  factory AppButtonTheme.fromAppColorScheme(AppColorScheme appColorScheme) {
    return AppButtonTheme(
      primaryElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.primary,
        disabledForegroundColor: appColorScheme.primary.withOpacity(0.38),
        disabledBackgroundColor: appColorScheme.primary.withOpacity(0.12),
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      secondaryElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.secondary,
        disabledForegroundColor: appColorScheme.secondary,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      errorElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.error,
        disabledForegroundColor: appColorScheme.error,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      successElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.success,
        disabledForegroundColor: appColorScheme.success,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      infoElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.info,
        disabledForegroundColor: appColorScheme.info,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
      warningElevated: ElevatedButton.styleFrom(
        backgroundColor: appColorScheme.warning,
        disabledForegroundColor: appColorScheme.warning,
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.buttonTextBlack,
      ),
      primaryOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.primary,
        disabledForegroundColor: appColorScheme.primary,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.primary,
      ),
      secondaryOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.secondary,
        disabledForegroundColor: appColorScheme.secondary,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.secondary,
      ),
      errorOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.error,
        disabledForegroundColor: appColorScheme.error,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.error,
      ),
      successOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.success,
        disabledForegroundColor: appColorScheme.success,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.success,
      ),
      infoOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.info,
        disabledForegroundColor: appColorScheme.info,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.info,
      ),
      warningOutlined: OutlinedButton.styleFrom(
        foregroundColor: appColorScheme.warning,
        disabledForegroundColor: appColorScheme.warning,
      ).withCommonOutlinedButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.warning,
      ),
      primaryText: TextButton.styleFrom(
        foregroundColor: appColorScheme.primary,
        disabledForegroundColor: appColorScheme.primary,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      secondaryText: TextButton.styleFrom(
        foregroundColor: appColorScheme.secondary,
        disabledForegroundColor: appColorScheme.secondary,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      errorText: TextButton.styleFrom(
        foregroundColor: appColorScheme.error,
        disabledForegroundColor: appColorScheme.error,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      successText: TextButton.styleFrom(
        foregroundColor: appColorScheme.success,
        disabledForegroundColor: appColorScheme.success,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      infoText: TextButton.styleFrom(
        foregroundColor: appColorScheme.info,
        disabledForegroundColor: appColorScheme.info,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
      ),
      warningText: TextButton.styleFrom(
        foregroundColor: appColorScheme.warning,
        disabledForegroundColor: appColorScheme.warning,
      ).withCommonTextButtonStyle(
        appColorScheme: appColorScheme,
        normalButtonTextColor: appColorScheme.buttonTextBlack,
      ),
    );
  }

  @override
  ThemeExtension<AppButtonTheme> copyWith({
    ButtonStyle? primaryElevated,
    ButtonStyle? secondaryElevated,
    ButtonStyle? errorElevated,
    ButtonStyle? successElevated,
    ButtonStyle? infoElevated,
    ButtonStyle? warningElevated,
    ButtonStyle? primaryOutlined,
    ButtonStyle? secondaryOutlined,
    ButtonStyle? errorOutlined,
    ButtonStyle? successOutlined,
    ButtonStyle? infoOutlined,
    ButtonStyle? warningOutlined,
    ButtonStyle? primaryText,
    ButtonStyle? secondaryText,
    ButtonStyle? errorText,
    ButtonStyle? successText,
    ButtonStyle? infoText,
    ButtonStyle? warningText,
  }) {
    return AppButtonTheme(
      primaryElevated: primaryElevated ?? this.primaryElevated,
      secondaryElevated: secondaryElevated ?? this.secondaryElevated,
      errorElevated: errorElevated ?? this.errorElevated,
      successElevated: successElevated ?? this.successElevated,
      infoElevated: infoElevated ?? this.infoElevated,
      warningElevated: warningElevated ?? this.warningElevated,
      primaryOutlined: primaryOutlined ?? this.primaryOutlined,
      secondaryOutlined: secondaryOutlined ?? this.secondaryOutlined,
      errorOutlined: errorOutlined ?? this.errorOutlined,
      successOutlined: successOutlined ?? this.successOutlined,
      infoOutlined: infoOutlined ?? this.infoOutlined,
      warningOutlined: warningOutlined ?? this.warningOutlined,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      errorText: errorText ?? this.errorText,
      successText: successText ?? this.successText,
      infoText: infoText ?? this.infoText,
      warningText: warningText ?? this.warningText,
    );
  }

  @override
  ThemeExtension<AppButtonTheme> lerp(
      ThemeExtension<AppButtonTheme>? other, double t) {
    if (other is! AppButtonTheme) {
      return this;
    }

    return AppButtonTheme(
      primaryElevated: other.primaryElevated,
      secondaryElevated: other.secondaryElevated,
      errorElevated: other.errorElevated,
      successElevated: other.successElevated,
      infoElevated: other.infoElevated,
      warningElevated: other.warningElevated,
      primaryOutlined: other.primaryOutlined,
      secondaryOutlined: other.secondaryOutlined,
      errorOutlined: other.errorOutlined,
      successOutlined: other.successOutlined,
      infoOutlined: other.infoOutlined,
      warningOutlined: other.warningOutlined,
      primaryText: other.primaryText,
      secondaryText: other.secondaryText,
      errorText: other.errorText,
      successText: other.successText,
      infoText: other.infoText,
      warningText: other.warningText,
    );
  }
}

extension ButtonStyleExtension on ButtonStyle {
  ButtonStyle withCommonButtonStyle({
    required AppColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return copyWith(
      minimumSize: MaterialStateProperty.all(const Size(60.0, 46.0)),
      mouseCursor: MaterialStateProperty.resolveWith((state) {
        if (state.contains(MaterialState.disabled)) {
          return SystemMouseCursors.forbidden;
        }

        return null;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return appColorScheme.buttonTextDisabled;
        }

        return normalButtonTextColor;
      }),
    );
  }

  ButtonStyle withCommonOutlinedButtonStyle({
    required AppColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return withCommonButtonStyle(
      appColorScheme: appColorScheme,
      normalButtonTextColor: normalButtonTextColor,
    ).copyWith(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return foregroundColor!.resolve(states);
      }),
      side: MaterialStateProperty.resolveWith((states) {
        return BorderSide(
          width: 1.0,
          color: foregroundColor!.resolve(states)!,
        );
      }),
    );
  }

  ButtonStyle withCommonTextButtonStyle({
    required AppColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return withCommonButtonStyle(
      appColorScheme: appColorScheme,
      normalButtonTextColor: normalButtonTextColor,
    ).copyWith(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return foregroundColor!.resolve(states);
      }),
    );
  }
}

class AppDataTableTheme extends ThemeExtension<AppDataTableTheme> {
  final CardTheme cardTheme;
  final DataTableThemeData dataTableThemeData;

  const AppDataTableTheme({
    required this.cardTheme,
    required this.dataTableThemeData,
  });

  factory AppDataTableTheme.fromTheme(ThemeData themeData) {
    return AppDataTableTheme(
      cardTheme: themeData.cardTheme.copyWith(
        color: Colors.transparent,
        elevation: 0.0,
      ),
      dataTableThemeData: themeData.dataTableTheme.copyWith(
        headingRowColor:
            MaterialStateProperty.all(themeData.colorScheme.primary),
        headingTextStyle: TextStyle(color: themeData.colorScheme.onPrimary),
      ),
    );
  }

  @override
  ThemeExtension<AppDataTableTheme> copyWith({
    CardTheme? cardTheme,
    DataTableThemeData? dataTableThemeData,
  }) {
    return AppDataTableTheme(
      cardTheme: cardTheme ?? this.cardTheme,
      dataTableThemeData: dataTableThemeData ?? this.dataTableThemeData,
    );
  }

  @override
  ThemeExtension<AppDataTableTheme> lerp(
      ThemeExtension<AppDataTableTheme>? other, double t) {
    if (other is! AppDataTableTheme) {
      return this;
    }

    return AppDataTableTheme(
      cardTheme: other.cardTheme,
      dataTableThemeData: other.dataTableThemeData,
    );
  }

// final ThemeData dataTable;
//
// const AppDataTableTheme({
//   required this.dataTable,
// });
//
// factory AppDataTableTheme.fromTheme(ThemeData themeData) {
//   return AppDataTableTheme(
//     dataTable: themeData.copyWith(
//       cardTheme: themeData.cardTheme.copyWith(
//         color: Colors.transparent,
//         elevation: 0.0,
//       ),
//       dataTableTheme: DataTableThemeData(
//         headingRowColor: MaterialStateProperty.all(themeData.colorScheme.primary),
//         headingTextStyle: TextStyle(color: themeData.colorScheme.onPrimary),
//       ),
//     ),
//   );
// }
//
// @override
// ThemeExtension<AppDataTableTheme> copyWith({
//   ThemeData? dataTable,
// }) {
//   return AppDataTableTheme(
//     dataTable: dataTable ?? this.dataTable,
//   );
// }
//
// @override
// ThemeExtension<AppDataTableTheme> lerp(ThemeExtension<AppDataTableTheme>? other, double t) {
//   if (other is! AppDataTableTheme) {
//     return this;
//   }
//
//   return AppDataTableTheme(
//     dataTable: other.dataTable,
//   );
// }
}
