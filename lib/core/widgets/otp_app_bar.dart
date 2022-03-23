import 'package:flutter/material.dart';
import '../../../../../../localization/app_localizations.dart';
import '../../resources/string_keys.dart';
import '../../resources/widget_keys.dart';

class OtpAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? backIcon;
  final Function? onBackBtnPressed;

  const OtpAppBar({
    Key? key,
    this.title,
    this.backIcon = false,
    this.onBackBtnPressed,
  }) : super(key: key);

  @override
  _OtpAppBarState createState() => _OtpAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _OtpAppBarState extends State<OtpAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: WidgetKeys.appBar,
      title: Align(
        child: Text(widget.title ??
            AppLocalizations.of(context)!.translate(StringKeys.pageTitle)),
      ),
      leading: _buildBackButton(),
    );
  }

  _buildBackButton() {
    if (widget.onBackBtnPressed != null) {
      return IconButton(
          key: WidgetKeys.backBtn,
          icon: const BackButtonIcon(),
          onPressed: () {
            widget.onBackBtnPressed ?? Navigator.of(context).pop();
          });
    } else {
      return null;
    }
  }
}
