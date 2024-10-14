import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc_flutter_intro/models/intro_model.dart';
import 'package:poc_flutter_intro/utils/input_decoration_merge.dart';
import 'package:poc_flutter_intro/utils/remove_emoji.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final List<TextInputFormatter>? formatter;
  final TextInputType typeInput;
  final bool enableBorder;
  final void Function(String value)? onChanged;
  final bool enabled;
  final double top;
  final double bottom;
  final bool visibleLabel;
  final int maxLines;
  final int? minLines;
  final bool isRequired;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final String? placeholder;
  final int? maxLength;
  final bool obscureText;
  final bool isDense;
  final bool borderNone;
  final bool readOnly;
  final bool filled;
  final double fontSize;
  final String? initialValue;
  final FocusNode? focusNode;
  final bool enableSuggestions;
  final bool autocorrect;
  final InputDecoration? decoration;
  final void Function(String)? onFieldSubmitted;
  final bool canRequestFocus;
  final bool autofocus;
  final Color? suffixIconColor;
  final TextInputAction? textInputAction;
  final IntroModel? introController;

  Input({
    super.key,
    this.placeholder,
    this.introController,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.top = 10,
    this.suffixIconColor,
    this.bottom = 0,
    this.autofillHints,
    this.autovalidateMode,
    this.textInputAction,
    this.maxLength,
    this.initialValue,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.decoration,
    this.controller,
    this.enabled = true,
    required this.typeInput,
    required this.hint,
    this.prefixIcon,
    this.visibleLabel = true,
    this.sufixIcon,
    this.canRequestFocus = true,
    this.formatter,
    this.enableBorder = true,
    this.isRequired = false,
    this.onChanged,
    this.obscureText = false,
    this.autofocus = false,
    this.isDense = false,
    this.borderNone = false,
    this.readOnly = false,
    this.fontSize = 14,
    this.filled = false,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final hasFocus = ValueNotifier<bool>(false);

  Widget getInput({
    GlobalKey<State<StatefulWidget>>? key,
    required BuildContext context,
  }) {
    return TextFormField(
      key: key,
      textInputAction: textInputAction,
      autofocus: autofocus,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      focusNode: focusNode,
      maxLength: maxLength,
      initialValue: initialValue,
      textAlignVertical: TextAlignVertical.top,
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
      validator: validator,
      autocorrect: autocorrect,
      controller: controller,
      autovalidateMode: autovalidateMode,
      autofillHints: autofillHints,
      canRequestFocus: canRequestFocus,
      readOnly: readOnly,
      decoration: InputDecoration(
        suffixIconColor: suffixIconColor,
        filled: filled,
        fillColor: Colors.transparent,
        prefixIconConstraints: const BoxConstraints(maxWidth: 30),
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 30,
          maxHeight: 40,
        ),
        prefixIcon: prefixIcon,
        labelText: visibleLabel
            ? isRequired
                ? '$hint *'
                : hint
            : null,
        suffixIcon:
            introController!.introBuilder.isNotEmpty || sufixIcon != null
                ? Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (sufixIcon != null) sufixIcon!,
                        if (introController!.introBuilder.isNotEmpty)
                          InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              introController!.intro.start(
                                reset: true,
                                group: introController!.group,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(
                                3,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black, // Cor da borda
                                  width: 2, // Espessura da borda
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.question_mark_rounded,
                                size: 12,
                              ),
                            ),
                          )
                      ],
                    ),
                  )
                : null,
        hintText: placeholder ?? hint,
        labelStyle: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontSize: 16,
          letterSpacing: 0.2,
          color: enabled ? Colors.grey.shade700 : Colors.grey,
        ),
        hintStyle: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          letterSpacing: 0.2,
        ),
        alignLabelWithHint: true,
        isDense: isDense,
        border: borderNone
            ? InputBorder.none
            : enableBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
                : null,
      ).merge(decoration),
      inputFormatters: [
        ...formatter ?? [],
        emojiFormatter,
      ],
      keyboardType: typeInput,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade900,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focus) {
        hasFocus.value = focus;
      },
      child: Container(
        margin: EdgeInsets.only(top: top),
        child: ValueListenableBuilder(
          valueListenable: hasFocus,
          builder: (_, hasFocus, __) {
            if (introController?.intro != null) {
              return ValueListenableBuilder(
                valueListenable: introController!.intro.statusNotifier,
                builder: (context, value, child) {
                  return PopScope(
                    canPop: !value.isOpen,
                    onPopInvokedWithResult: (didPop, _) {
                      if (!didPop) {
                        introController!.intro.dispose();
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: IntroStepBuilder(
                            order: introController!.order,
                            group: introController!.group,
                            overlayBuilder: (params) {
                              return Container(
                                color: Colors.blue,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Column(
                                      children: introController!.introBuilder,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          if (params.onPrev != null)
                                            IntroButton(
                                              text: 'Anterior',
                                              onPressed: params.onPrev,
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                foregroundColor: Colors.white,
                                                side: const BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ),
                                          if (params.onNext != null)
                                            IntroButton(
                                              text: 'Proximo',
                                              onPressed: params.onNext,
                                            ),
                                          if (params.onNext == null)
                                            IntroButton(
                                              text: 'Entendi',
                                              onPressed: params.onFinish,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            builder: (ctx, key) => getInput(
                              key: key,
                              context: ctx,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return getInput(context: context);
            }
          },
        ),
      ),
    );
  }
}
