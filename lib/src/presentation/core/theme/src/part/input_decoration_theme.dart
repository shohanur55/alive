part of '../theme_data.dart';

class _InputDecorationLightTheme with ThemeExtensions {
  InputDecorationTheme call() {
    final BorderRadius borderRadius = BorderRadius.circular(
      dimensions.radius.r12,
    );

    return InputDecorationTheme(
      filled: true,
      fillColor: lightColor.inputFill,
      hintStyle: textStyle.bodyMedium.copyWith(color: lightColor.text.hint),
      contentPadding: EdgeInsets.symmetric(
        vertical: dimensions.spacing.s15,
        horizontal: dimensions.spacing.s16,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: lightColor.primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: lightColor.error,
          width: 1.0,
        ),
      ),
      suffixIconColor: lightColor.icon,
      disabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
    );
  }
}

class _InputDecorationDarkTheme with ThemeExtensions {
  InputDecorationTheme call() {
    final BorderRadius borderRadius = BorderRadius.circular(
      dimensions.radius.r12,
    );

    return InputDecorationTheme(
      filled: true,
      fillColor: darkColor.inputFill,
      hintStyle: textStyle.bodyMedium.copyWith(color: darkColor.text.hint),
      contentPadding: EdgeInsets.symmetric(
        vertical: dimensions.spacing.s15,
        horizontal: dimensions.spacing.s16,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: darkColor.primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: darkColor.error,
          width: 1.0,
        ),
      ),
      suffixIconColor: darkColor.icon,
      disabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide.none,
      ),
    );
  }
}

