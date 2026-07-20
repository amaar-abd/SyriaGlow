import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/currency_widgets/syria_flag_widget.dart';

class ConversionResultCard extends StatelessWidget {
  const ConversionResultCard({
    super.key,
    required this.result,
    required this.isToSyp,
    required this.selectedCurrency,
    required this.exchangeRates,
    required this.currencyFlags,
    required this.onCurrencyChanged,
  });

  final double result;
  final bool isToSyp;
  final String selectedCurrency;
  final Map<String, double> exchangeRates;
  final Map<String, String> currencyFlags;
  final ValueChanged<String> onCurrencyChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryGreen, Color(0xFF022622)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.elegantGold.withAlpha(102),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withAlpha(64),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isToSyp ? l10n.approx_value_syp : l10n.approx_value_in,
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.goldSoft,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              if (!isToSyp)
                DropdownButton<String>(
                  dropdownColor: const Color(0xFF022622),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.goldSoft,
                  ),
                  value: selectedCurrency,
                  underline: const SizedBox(),
                  items: exchangeRates.keys.map((curr) {
                    return DropdownMenuItem<String>(
                      value: curr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${currencyFlags[curr]} ',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            curr,
                            style: TextStyle(
                              color: AppColors.goldSoft,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) onCurrencyChanged(val);
                  },
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 30.w),
            child: Divider(
              color: AppColors.textGray.withAlpha(200),
              thickness: 1,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: isToSyp
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${NumberFormat('#,##0').format(result)} SYP ',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.elegantGold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SyriaFlagWidget(width: 32, height: 22),
                    ],
                  )
                : Text(
                    '${NumberFormat('#,##0.00').format(result)} $selectedCurrency ${currencyFlags[selectedCurrency]}',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.elegantGold,
                      letterSpacing: 0.5,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
