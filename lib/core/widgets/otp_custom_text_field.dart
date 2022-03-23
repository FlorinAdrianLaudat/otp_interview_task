import 'package:flutter/material.dart';
import 'package:otp_interview_task/resources/otp_colors.dart';

import '../../resources/dimension_keys.dart';
import '../../resources/text_styles.dart';

enum TextFocus { focused, unfocused }

class OtpCustomTextField extends StatefulWidget {
  final Key widgetKey;
  final String? title;
  final TextEditingController? teController;
  final Function(TextFocus)? focusChanged;
  final void Function()? onTap;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final Color? inputFillColor;
  final int? maxLines;
  final int? minLines;

  const OtpCustomTextField({
    Key? key,
    required this.widgetKey,
    this.title,
    this.teController,
    this.focusChanged,
    this.onTap,
    this.onChange,
    this.onFieldSubmitted,
    this.focusNode,
    this.textStyle,
    this.inputFillColor,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  _OtpCustomTextFieldState createState() => _OtpCustomTextFieldState();
}

class _OtpCustomTextFieldState extends State<OtpCustomTextField> {
  late FocusNode _node;

  @override
  void initState() {
    super.initState();

    _node = widget.focusNode ?? FocusNode(debugLabel: 'OTPCustomTextField');

    if (widget.focusChanged != null) {
      _node.addListener(_handleFocusChange);
    }
  }

  void _handleFocusChange() {
    if (widget.focusChanged != null) {
      if (_node.hasFocus) {
        widget.focusChanged!(TextFocus.focused);
      } else {
        widget.focusChanged!(TextFocus.unfocused);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _node,
      key: widget.widgetKey,
      controller: widget.teController,
      decoration: _textInputDecoration(context),
      maxLines: widget.maxLines ?? DimensionKeys.defaultMaxLinesInputField,
      minLines: widget.minLines ?? DimensionKeys.defalutMinLinesInputField,
      onChanged: widget.onChange,
      textAlign: TextAlign.center,
    );
  }

  InputDecoration _textInputDecoration(BuildContext context) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      label: Center(
        child: Text(
          widget.title ?? '',
          style: widget.textStyle ?? TextStyles.textStyleGreyAndBold,
        ),
      ),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      fillColor: widget.inputFillColor ?? OtpColor.paleYellow,
      filled: true,
    );
  }
}
