import 'package:flutter/material.dart';
import 'package:global_services_mobile/ui/utils/hex_color.dart';

class Styles {
  static const LargeTextSize = 26.0;
  static const MediumTextSize = 20.0;
  static const BodyTextSize = 16.0;
  static const String FontNameDefault = 'Montserrat';
  static const double LogoHeight = 120;
  static const double LogoWidth = 220;

  static const _textSizeLarge = 22.0;
  static const _textSizeDefault = 16.0;
  static const _textSizeSmall = 12.0;
  static const horizontalPaddingDefault = 12.0;
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = HexColor('#FFFFFF');
  static final Color _textColorFaint = _hexToColor('999999');
  static final Color textColorBright = _hexToColor('FFFFFF');
  static final Color accentColor = _hexToColor('FF0000');
  static final String _fontNameDefault = 'Muli';

  static final Color buttonColor = HexColor('#102849');
  static final Color appBarColor = HexColor('#164373');
  static final Color errorAlertColor = HexColor('#C20033');
  static final Color bodyColor = HexColor('#164373');
  static final Color dropDownColor = HexColor('#164373');

  static final navBarTitle = TextStyle(
    fontFamily: _fontNameDefault,
    color: Colors.blue,
  );

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

  static final titleTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: LargeTextSize,
    color: Colors.black,
  );

  static final body1TextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: BodyTextSize,
    color: Colors.black,
  );

  static final headerLarge = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w500,
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
}
