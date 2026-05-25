import 'package:flutter/material.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';

class CustomCheckboxListTile extends StatelessWidget {
  const CustomCheckboxListTile({super.key, this.value, this.onChanged});
  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    final linkStyle = textStyle?.copyWith(
      color: AppColors.elegantGold,
      fontWeight: FontWeight.bold,
    );
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryGreenLight,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextTheme.of(context).bodyMedium,
              children: isArabic
                  ? [
                      const TextSpan(text: 'أوافق على '),
                      TextSpan(
                        text: context.l10n.termsOfService,
                        style: linkStyle,
                      ),
                      const TextSpan(text: ' و '),
                      TextSpan(
                        text: context.l10n.privacyPolicy,
                        style: linkStyle,
                      ),
                    ]
                  : [
                      const TextSpan(text: 'I agree to the '),
                      TextSpan(
                        text: context.l10n.termsOfService,
                        style: linkStyle,
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: context.l10n.privacyPolicy,
                        style: linkStyle,
                      ),
                    ],
            ),
          ),
        ),
      ],
    );
  }
}
