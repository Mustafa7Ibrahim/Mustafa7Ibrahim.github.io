import 'package:flutter/material.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';

extension StyledText<T extends Text> on T {
  Text copyWith({
    String? data,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    TextScaler? textScaler,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
  }) =>
      Text(
        data ?? this.data ?? '',
        style: style ?? this.style,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        locale: locale ?? this.locale,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        softWrap: softWrap ?? this.softWrap,
        textDirection: textDirection ?? this.textDirection,
        textScaler: textScaler ?? this.textScaler,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      );

  T textStyle(TextStyle? style) => copyWith(
        style: (this.style ?? const TextStyle()).copyWith(
          background: style?.background,
          backgroundColor: style?.backgroundColor,
          color: style?.color,
          debugLabel: style?.debugLabel,
          decoration: style?.decoration,
          decorationColor: style?.decorationColor,
          decorationStyle: style?.decorationStyle,
          decorationThickness: style?.decorationThickness,
          fontFamily: style?.fontFamily,
          fontFamilyFallback: style?.fontFamilyFallback,
          fontFeatures: style?.fontFeatures,
          fontSize: style?.fontSize,
          fontStyle: style?.fontStyle,
          fontWeight: style?.fontWeight,
          foreground: style?.foreground,
          height: style?.height,
          inherit: style?.inherit,
          letterSpacing: style?.letterSpacing,
          locale: style?.locale,
          shadows: style?.shadows,
          textBaseline: style?.textBaseline,
          wordSpacing: style?.wordSpacing,
        ),
      ) as T;

  T softWrap(bool softWrap) => copyWith(softWrap: softWrap) as T;

  T textWidthBasis(TextWidthBasis textWidthBasis) =>
      copyWith(textWidthBasis: textWidthBasis) as T;

  T semanticsLabel(String semanticsLabel) =>
      copyWith(semanticsLabel: semanticsLabel) as T;

  T overflow(TextOverflow textOverflow) =>
      copyWith(overflow: textOverflow) as T;

  T strutStyle(StrutStyle strutStyle) => copyWith(strutStyle: strutStyle) as T;
  T locale(Locale locale) => copyWith(locale: locale) as T;
  T maxLines(int maxLines) => copyWith(maxLines: maxLines) as T;

  T get bold => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: FontWeight.bold,
        ),
      ) as T;

  // extra bold
  T get extraBold => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: FontWeight.w800,
        ),
      ) as T;

  T get light => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: FontWeight.w300,
        ),
      ) as T;
  T get regular => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: FontWeight.w400,
        ),
      ) as T;
  T get medium => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: FontWeight.w500,
        ),
      ) as T;

  T get italic => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontStyle: FontStyle.italic,
        ),
      ) as T;

  T shadow({
    Color color = Colors.black26,
    Offset offset = const Offset(2, 4),
    double blurRadius = 10,
  }) =>
      copyWith(
        style: (style ?? const TextStyle()).copyWith(
          shadows: [
            Shadow(color: color, offset: offset, blurRadius: blurRadius),
          ],
        ),
      ) as T;

  T fontWeight(FontWeight fontWeight) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontWeight: fontWeight,
        ),
      ) as T;

  T size(double size) => copyWith(
        style: (style ?? const TextStyle()).copyWith(fontSize: size),
      ) as T;

  T fontFamily(String font) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontFamily: font,
        ),
      ) as T;

  T letterSpacing(double space) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          letterSpacing: space,
        ),
      ) as T;

  T wordSpacing(double space) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          wordSpacing: space,
        ),
      ) as T;

  T color(Color color) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          color: color,
        ),
      ) as T;

  T align(TextAlign align) => copyWith(textAlign: align) as T;

  T get center => copyWith(textAlign: TextAlign.center) as T;

  T direction(TextDirection direction) =>
      copyWith(textDirection: direction) as T;

  T baseline(TextBaseline textBaseline) => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          textBaseline: textBaseline,
        ),
      ) as T;

  T get withUnderLine => copyWith(
        style: (style ?? const TextStyle())
            .copyWith(decoration: TextDecoration.underline),
      ) as T;

  // ------------------------------------------

  // heading1
  T get heading1 => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontSize: 57,
          color: AppColors.textPrimaryColor,
        ),
      ).bold as T;

  // heading2
  T get heading2 => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontSize: 38,
          color: AppColors.textPrimaryColor,
        ),
      ).bold as T;

  // heading3
  T get heading3 => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontSize: 28,
          color: AppColors.textPrimaryColor,
        ),
      ).medium as T;

  // heading4
  T get heading5 => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontSize: 14,
          color: AppColors.textPrimaryColor,
        ),
      ).bold as T;

  // bodyL
  T get bodyL => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontSize: 20,
          color: Colors.black,
        ),
      ).medium as T;

  // bodyM
  T get bodyM => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontSize: 16,
          color: Colors.black,
        ),
      ).medium as T;

  // bodyS
  T get bodyS => copyWith(
        style: (style ?? const TextStyle()).copyWith(
          fontSize: 14,
          color: Colors.black,
        ),
      ).medium as T;
}
