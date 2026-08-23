import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';

class HomeCountrySelector extends StatelessWidget {
  const HomeCountrySelector({
    super.key,
    required this.activeCountry,
    required this.onCountrySelected,
  });

  final String activeCountry;
  final ValueChanged<String> onCountrySelected;

  static const List<Map<String, String>> _countries = [
    {'name': 'Global', 'emoji': '🌐'},
    {'name': 'India', 'emoji': '🇮🇳'},
    {'name': 'Philippines', 'emoji': '🇵🇭'},
    {'name': 'Brazil', 'emoji': '🇧🇷'},
    {'name': 'Vietnam', 'emoji': '🇻🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: context.padding.p16.w),
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _countries.map((country) {
          final String name = country['name']!;
          final String emoji = country['emoji']!;
          final bool isActive = activeCountry == name;

          return Padding(
            padding: EdgeInsets.only(right: context.spacing.s10.w),
            child: InkWell(
              onTap: () => onCountrySelected(name),
              borderRadius: BorderRadius.circular(context.radius.r20.r),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isActive
                      ? context.color.primary.withValues(alpha: 0.08)
                      : context.color.scaffoldBackground,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isActive
                        ? context.color.primary
                        : context.color.border,
                    width: isActive ? 1.5.w : 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    Text(emoji, style: context.textStyle.bodyMedium),
                    SizedBox(width: 6.w),
                    Text(
                      name,
                      style: context.textStyle.bodyMedium.copyWith(
                        fontSize: 12.sp,
                        fontWeight:
                            isActive ? FontWeight.w700 : FontWeight.w500,
                        color: isActive
                            ? context.color.text.primary
                            : context.color.text.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

