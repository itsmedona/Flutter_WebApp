import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0XFF4a2fbd);
  static const secondaryColor = Color(0xFFFE53BB);
  static const textColor = Color(0xFF2B2B2B);
  static const lightgrayColor = Color(0x44948282);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF2B2B2B);
  static const errorcolor = Colors.red;
  static const lightBackgroundColor = Color(0xFFFFFFFF);
  static const lightTextColor = Color(0xFF403930);
  static const darkBackgroundColor = Color(0xFF2B2B2B);
  static const darkTextColor = Color(0xFFF3F2FF);
  static const uiComponentsbgColor = Color(0xFFf8f9fb);
  static const uiComponentsbuttonColor = Color(0xFF188acc);
  static const uiComponentstarbuttonColor = Color(0xFF3a4046);
  static const tabbarlableColor = Color(0xFF033D73);
  static const tabbarBackground = Color(0xFFF0F3F5);
  static const dividerColor = Color(0xFFDDE1E5);
  static const buttonSecondaryColor = Color(0xFFcfd5da);
  static const buttonSuccessColor = Color(0xFF78ab40);
  static const buttonInfoColor = Color(0xFF3eabe8);
  static const checkBoxButtonColor = Color(0xFF0d4378);
  static const buttonWarningColor = Color(0xFFde5b02);
  static const buttonFocusColor = Color(0xFF6a17f2);
  static const buttonAltColor = Color(0xFF754ac4);
  static const buttonBorderColor = Color(0xFFf8f9fa);
  static const buttontextColor = Color(0xFFb4bcc3);
  static const textgreyColor = Color(0xFF7e7e7e);
  static const buttondangerColor = Color(0xFFcc3339);
  static const containerBgColor = Color(0xFFf8e0d1);
  static const terxtBgColor = Color(0xFF732d00);
  static const bgGreyColor = Color(0xFFe9ecef);
  static const drbackgroundColor = Color(0xFF343A40);

//=
  static const tabscreenbutton = Color(0XFF7AAD43);
  static const tabscreenbitton2 = Color(0XFFCA2A30);
  static const tabcolor = Color(0XFF022241);
  static const buttonunselect = Color(0XFF255685);
  static const outlinecolor = Color(0XFF6F42C1);
  static const starcolor = Colors.amber;
  static const dashifycolor = Color(0XFFFF2E2E);

  static const pinkpurple = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0XFF8EC5FC), Color(0XFFE0C3FC)],
  );

  static const pinkpurplesidebar = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0XFFE0C3FC), Color(0XFF8EC5FC)],
  );
  static const grayBack = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
  );
  static const grayWhite = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFFFFF), Color(0xFFF3F2FF)],
  );
  static const greenblack = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF233329), Color(0xFF63D471)],
  );
  static const navyblue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff3A1C71), Color(0xFFD76D77), Color(0xFFFFAF7B)],
  );
  static const redwhite = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xff1565C0), Color(0xFFb92b27)],
  );
  static const buttonGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0XFF7DE7EB), Color(0XFF33BBCF)],
  );

  static const contactGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0XFF43C6AC), Color(0xFF191654)],
  );

  static LinearGradient primaryGradiant = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [const Color(0xff4A569D), const Color(0xFFDC2424).withOpacity(0.8)],
  );
  static LinearGradient primaryGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryColor, AppColors.primaryColor.withOpacity(0.5)],
  );
  static LinearGradient buttonSecondaryGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.buttonSecondaryColor,
      AppColors.buttonSecondaryColor.withOpacity(0.5)
    ],
  );
  static LinearGradient buttonSuccessGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.buttonSuccessColor,
      AppColors.buttonSuccessColor.withOpacity(0.5)
    ],
  );
  static LinearGradient buttonInfoGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.buttonInfoColor,
      AppColors.buttonInfoColor.withOpacity(0.5)
    ],
  );
  static LinearGradient buttonWarningGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.buttonWarningColor,
      AppColors.buttonWarningColor.withOpacity(0.5)
    ],
  );
  static LinearGradient buttonFocusColorGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.buttonFocusColor,
      AppColors.buttonFocusColor.withOpacity(0.5)
    ],
  );
  static LinearGradient buttonAltColorGradi = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.buttonAltColor,
      AppColors.buttonAltColor.withOpacity(0.5)
    ],
  );

  BoxShadow primaryColorShadow = BoxShadow(
    color: primaryColor.withAlpha(100),
    blurRadius: 12.0,
    offset: const Offset(0.0, 0.0),
  );
  BoxShadow blackColorShadow = BoxShadow(
    color: Colors.black.withAlpha(100),
    blurRadius: 12.0,
    offset: const Offset(0.0, 0.0),
  );
}
