import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_page_route.dart';
import '../../../../core/widgets/otp_app_bar.dart';
import '../../../../core/widgets/otp_custom_text_field.dart';
import '../../../../localization/app_localizations.dart';
import '../../../../resources/dimension_keys.dart';
import '../../../../resources/string_keys.dart';
import '../../../../resources/text_styles.dart';
import '../../../../resources/widget_keys.dart';
import '../../../display_text_feature/presentation/pages/display_text_page.dart';

class InputTextPage extends StatefulWidget {
  const InputTextPage({Key? key}) : super(key: key);

  @override
  State<InputTextPage> createState() => _InputTextPageState();
}

class _InputTextPageState extends State<InputTextPage> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OtpAppBar(),
      body: Container(
        color: Colors.yellow,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.height * (kIsWeb ? 0.25 : 0.05),
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: DimensionKeys.bigVerticalMargin,
                  ),
                  OtpCustomTextField(
                    widgetKey: WidgetKeys.inputTextArea,
                    title: translate(context, StringKeys.inputHint),
                    teController: textController,
                    onChange: (text) {
                      setState(() {});
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: DimensionKeys.commonVerticalMargin),
                    child: Text(
                      translate(context, StringKeys.outputOfText),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: DimensionKeys.commonVerticalMargin,
                    ),
                    child: Text(
                      textController.text,
                      style: TextStyles.textStyleBigBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: DimensionKeys.bigVerticalMargin),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: _navigateToDisplayPage,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: DimensionKeys.smallHorizontalMargin),
                        child: Text(
                          translate(context, StringKeys.submit),
                          style: TextStyles.textStyleWhiteAndBold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _navigateToDisplayPage() {
    FocusScope.of(context).unfocus();
    Navigator.push(
      context,
      CustomPageRoute(
        child: DisplayTextPage(
          inputText: textController.text,
        ),
      ),
    );
  }
}
