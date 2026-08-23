part of '../colors.dart';

abstract class TextColors {
  const TextColors();

  Color get primary;
  Color get secondary;
  Color get tertiary;
  Color get hint;
}

class _LightTextColors extends TextColors {
  const _LightTextColors();

  @override
  Color get primary => _Primitive.neutral80;

  @override
  Color get secondary => _Primitive.neutral40;

  @override
  Color get tertiary => _Primitive.neutral30;

  @override
  Color get hint => _Primitive.neutral30;
}

class _DarkTextColors extends TextColors {
  const _DarkTextColors();

  @override
  Color get primary => _Primitive.neutral0;

  @override
  Color get secondary => _Primitive.neutral30;

  @override
  Color get tertiary => _Primitive.neutral40;

  @override
  Color get hint => _Primitive.neutral40;
}

