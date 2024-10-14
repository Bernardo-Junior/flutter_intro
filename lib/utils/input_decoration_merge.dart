import 'package:flutter/material.dart';

extension InputDecorationExtension on InputDecoration {
  InputDecoration merge(InputDecoration? other) {
    return InputDecoration(
      icon: other?.icon ?? icon,
      labelText: other?.labelText ?? labelText,
      labelStyle: other?.labelStyle ?? labelStyle,
      helperText: other?.helperText ?? helperText,
      helperStyle: other?.helperStyle ?? helperStyle,
      hintText: other?.hintText ?? hintText,
      hintStyle: other?.hintStyle ?? hintStyle,
      hintMaxLines: other?.hintMaxLines ?? hintMaxLines,
      errorText: other?.errorText ?? errorText,
      errorStyle: other?.errorStyle ?? errorStyle,
      errorMaxLines: other?.errorMaxLines ?? errorMaxLines,
      floatingLabelBehavior:
          other?.floatingLabelBehavior ?? floatingLabelBehavior,
      isCollapsed: other?.isCollapsed ?? isCollapsed,
      isDense: other?.isDense ?? isDense,
      contentPadding: other?.contentPadding ?? contentPadding,
      prefixIcon: other?.prefixIcon ?? prefixIcon,
      prefix: other?.prefix ?? prefix,
      prefixText: other?.prefixText ?? prefixText,
      prefixStyle: other?.prefixStyle ?? prefixStyle,
      suffixIcon: other?.suffixIcon ?? suffixIcon,
      suffix: other?.suffix ?? suffix,
      suffixText: other?.suffixText ?? suffixText,
      suffixStyle: other?.suffixStyle ?? suffixStyle,
      counter: other?.counter ?? counter,
      counterText: other?.counterText ?? counterText,
      counterStyle: other?.counterStyle ?? counterStyle,
      filled: other?.filled ?? filled,
      fillColor: other?.fillColor ?? fillColor,
      focusColor: other?.focusColor ?? focusColor,
      hoverColor: other?.hoverColor ?? hoverColor,
      errorBorder: other?.errorBorder ?? errorBorder,
      focusedBorder: other?.focusedBorder ?? focusedBorder,
      focusedErrorBorder: other?.focusedErrorBorder ?? focusedErrorBorder,
      disabledBorder: other?.disabledBorder ?? disabledBorder,
      enabledBorder: other?.enabledBorder ?? enabledBorder,
      border: other?.border ?? border,
      enabled: other?.enabled ?? enabled,
      semanticCounterText: other?.semanticCounterText ?? semanticCounterText,
      alignLabelWithHint: other?.alignLabelWithHint ?? alignLabelWithHint,
    );
  }
}
