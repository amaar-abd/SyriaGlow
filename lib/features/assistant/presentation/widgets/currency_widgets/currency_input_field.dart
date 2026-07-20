import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/currency_widgets/syria_flag_widget.dart';

class CurrencyInputField extends StatelessWidget {
  const CurrencyInputField({
    super.key,
    required this.controller,
    required this.isToSyp,
    required this.selectedCurrency,
    required this.exchangeRates,
    required this.currencyFlags,
    required this.onAmountChanged,
    required this.onCurrencyChanged,
  });
  final TextEditingController controller;
  final bool isToSyp;
  final String selectedCurrency;
  final Map<String, double> exchangeRates;
  final Map<String, String> currencyFlags;
  final ValueChanged<String> onAmountChanged;
  final ValueChanged<String> onCurrencyChanged;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      color: AppColors.surfaceWhite,
      elevation: 4,
      shadowColor: Colors.black.withAlpha(100),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: AppColors.primaryGreen,
                    selectionHandleColor: AppColors.elegantGold,
                    selectionColor: AppColors.primaryGreen.withAlpha(40),
                  ),
                ),
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  cursorColor: AppColors.primaryGreen,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                  decoration: InputDecoration(
                    labelText: isToSyp
                        ? l10n.amount_foreign_currency
                        : l10n.amount_syp,
                    labelStyle: TextTheme.of(context).bodySmall?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: '1,000.00',
                    hintStyle: TextStyle(
                      color: AppColors.textGray.withAlpha(128),
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: onAmountChanged,
                ),
              ),
            ),
            if (isToSyp)
              DropdownButton<String>(
                borderRadius: BorderRadius.circular(16.r),
                dropdownColor: AppColors.surfaceWhite,
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 30.r,
                  color: AppColors.primaryGreen,
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
                            color: AppColors.textDark,
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
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SyriaFlagWidget(width: 22, height: 15),
                    SizedBox(width: 6.w),
                    Text(
                      'SYP',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
