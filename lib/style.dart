import 'package:flutter/material.dart';
import 'package:global_services_mobile/ui/utils/hex_color.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Styles {
  static const LargeTextSize = 26.0;
  static const MediumTextSize = 20.0;
  static const bodyMediumTextSize = 16.0;

  static const String FontNameDefault = 'Proxima Nova';

  static const double LogoHeight = 120;
  static const double LogoWidth = 220;

  static const _textSizeLarge = 22.0;
  static const _textSizeDefault = 22.0;
  static const _textSizeSmall = 12.0;
  static const horizontalPaddingDefault = 12.0;
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = Colors.grey;
  static final Color _textColorFaint = _hexToColor('999999');
  static final Color textColorBright = _hexToColor('FFFFFF');
  static final Color accentColor = _hexToColor('FF0000');
  static const String _fontNameDefault = 'Muli';

  static final Color buttonColor = HexColor('#102849');
  static final Color appBarColor = Color.fromARGB(255, 50, 51, 49);
  static final Color errorAlertColor = HexColor('#C20033');
  static const Color bodyColor = Colors.black;
  static final Color dropDownColor = HexColor('#164373');

  static final appBarTheme =
      AppBarTheme(color: Styles.appBarColor, titleTextStyle: appBarTextTitle);

  static final appBarTextStyle = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  static final cardTextStyle = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: _textSizeDefault,
    color: HexColor('#102849'),
  );

  static final titleTextStyle = const TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: LargeTextSize,
    color: Colors.black,
  );

  static const bodyMedium = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.normal,
    fontSize: bodyMediumTextSize,
    color: Color.fromARGB(255, 183, 179, 199),
  );

  static const appBarTextTitle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.bold,
    fontSize: bodyMediumTextSize,
    color: Color.fromARGB(255, 183, 179, 199),
  );

  static final headerLarge = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w800,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
    height: 1.2,
  );

  static final textCTAButton = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: textColorBright,
  );

  static final locationTileTitleLight = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: _textColorStrong,
  );

  static final locationTileTitleDark = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: textColorBright,
  );

  static final locationTileSubTitle = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: accentColor,
  );

  static final locationTileCaption = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeSmall,
    color: _textColorFaint,
  );

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }

  static final alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(
        fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18),
    animationDuration: Duration(milliseconds: 250),
    backgroundColor: HexColor("#164373"),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
  );
}
