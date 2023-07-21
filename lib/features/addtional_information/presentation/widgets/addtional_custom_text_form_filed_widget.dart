import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

Widget customAdditionalTextFormField(
    {IconData? prefixIcon,
    required context,
    required String? labelText,
    TextStyle? labelStyle,
    EdgeInsetsGeometry? contentPadding,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    ValueChanged<String>? onFieldSubmitted,
    bool obscureText = false,
    Function()? onTap,
    bool readOnly = false,
    required TextEditingController? controller,
    Widget? suffixIcon}) {
  final orientations = MediaQuery.of(context).orientation;
  double height = mediaQueryHeight(context);
  return Container(
    // margin: const EdgeInsets.symmetric(horizontal: 12),
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrantation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrantation == Orientation.landscape;
        return TextFormField(
          readOnly: readOnly,
          onTap: onTap,
          style: TextStyle(
              fontSize: isTablet(context)
                  ? isLandscape
                      ?height* 0.028
                      :height* 0.022
                  :height* 0.022),
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: defultFontSize(context),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: Colors.black54,
                    size: isTablet(context)
                        ? isLandscape
                            ?height* 0.04
                            : iconSizeTablet(context)
                        : iconSizeMobile(context),
                  )
                : null,
            labelText: labelText,
            labelStyle: labelStyles(
              fontSize: isTablet(context)
                  ? (orientations == Orientation.landscape
                      ? tabletLandscapeFontSize(context)
                      : tabletFontSize(context))
                  : defultFontSize(context),
            ),
            contentPadding: isTablet(context)
                ? isLandscape
                    ? EdgeInsets.all(
                        paddingTablet30(context),
                      )
                    : EdgeInsets.all(paddingTablet30(context))
                : EdgeInsets.all(paddingMobile10(context)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hoverColor: customPrimarySwatch,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: customPrimarySwatch,
              ),
            ),
          ),
        );
      },
    ),
  );
}
