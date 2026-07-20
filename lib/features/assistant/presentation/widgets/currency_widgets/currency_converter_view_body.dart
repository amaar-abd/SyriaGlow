import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/currency_widgets/conversion_result_card.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/currency_widgets/currency_input_field.dart';
import 'package:syria_glow/features/assistant/presentation/widgets/currency_widgets/swap_currency_button.dart';

class CurrencyConverterViewBody extends StatefulWidget {
  const CurrencyConverterViewBody({super.key});

  @override
  State<CurrencyConverterViewBody> createState() =>
      _CurrencyConverterViewBodyState();
}

class _CurrencyConverterViewBodyState extends State<CurrencyConverterViewBody> {
  double inputAmount = 0.0;
  double result = 0.0;
  String selectedCurrency = 'USD';
  bool isToSyp = true;

  final TextEditingController _amountController = TextEditingController();

  final Map<String, double> exchangeRates = const {
    'USD': 13700,
    'EUR': 16200,
    'SAR': 4000,
    'AED': 4080,
    'TRY': 415,
    'LBP': 0.17,
  };

  final Map<String, String> currencyFlags = const {
    'USD': '🇺🇸',
    'EUR': '🇪🇺',
    'SAR': '🇸🇦',
    'AED': '🇦🇪',
    'TRY': '🇹🇷',
    'LBP': '🇱🇧',
  };

  void _calculateConversion(String amount) {
    final cleanAmount = amount.replaceAll(',', '');
    if (cleanAmount.isEmpty) {
      setState(() {
        inputAmount = 0.0;
        result = 0.0;
      });
      return;
    }

    final parsedAmount = double.tryParse(cleanAmount);
    if (parsedAmount != null) {
      setState(() {
        inputAmount = parsedAmount;
        final rate = exchangeRates[selectedCurrency] ?? 1.0;

        if (isToSyp) {
          result = inputAmount * rate;
        } else {
          result = rate > 0 ? inputAmount / rate : 0.0;
        }
      });
    }
  }

  void _onAmountChanged(String value) {
    if (value.isEmpty) {
      _calculateConversion('');
      return;
    }

    final clean = value.replaceAll(',', '');
    final number = double.tryParse(clean);
    if (number != null) {
      final formatted = NumberFormat('#,###.##').format(number);
      _amountController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
      _calculateConversion(clean);
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              CurrencyInputField(
                controller: _amountController,
                isToSyp: isToSyp,
                selectedCurrency: selectedCurrency,
                exchangeRates: exchangeRates,
                currencyFlags: currencyFlags,
                onAmountChanged: _onAmountChanged,
                onCurrencyChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                    _calculateConversion(_amountController.text);
                  });
                },
              ),
              SizedBox(height: 16.h),
              SwapCurrencyButton(
                onTap: () {
                  setState(() {
                    isToSyp = !isToSyp;
                    _calculateConversion(_amountController.text);
                  });
                },
              ),
              SizedBox(height: 16.h),
              ConversionResultCard(
                result: result,
                isToSyp: isToSyp,
                selectedCurrency: selectedCurrency,
                exchangeRates: exchangeRates,
                currencyFlags: currencyFlags,
                onCurrencyChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                    _calculateConversion(_amountController.text);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
