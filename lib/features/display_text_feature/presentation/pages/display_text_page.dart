import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/string_utils.dart';
import '../../../../core/widgets/otp_app_bar.dart';
import '../../../../localization/app_localizations.dart';
import '../../../../resources/dimension_keys.dart';
import '../../../../resources/string_keys.dart';
import '../../../../resources/text_styles.dart';

class DisplayTextPage extends StatelessWidget {
  final String inputText;
  const DisplayTextPage({Key? key, required this.inputText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OtpAppBar(backIcon: true),
      body: Container(
        color: Colors.yellow,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.height * (kIsWeb ? 0.25 : 0.05)),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25,
                    ),
                    child: StringUtils.isNotNullOrEmpty(inputText)
                        ? _buildSuccessText(context)
                        : _buildWrongText(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildSuccessText(context) {
    return Column(
      children: [
        Text(
          translate(context, StringKeys.congrats),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              vertical: DimensionKeys.commonVerticalMargin),
          child: Icon(Icons.check),
        ),
        Text(
          translate(context, StringKeys.input),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: DimensionKeys.smallVerticalMargin,
            bottom: DimensionKeys.bigVerticalMargin,
          ),
          child: Text(
            inputText,
            style: TextStyles.textStyleBigBold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  _buildWrongText(context) {
    return Column(
      children: [
        Text(
          translate(context, StringKeys.wrong),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              vertical: DimensionKeys.commonVerticalMargin),
          child: Icon(Icons.error),
        ),
      ],
    );
  }
}
