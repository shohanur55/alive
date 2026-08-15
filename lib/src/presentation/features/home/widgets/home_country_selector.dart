import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _countries.map((country) {
          final String name = country['name']!;
          final String emoji = country['emoji']!;
          final bool isActive = activeCountry == name;

          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: InkWell(
              onTap: () => onCountrySelected(name),
              borderRadius: BorderRadius.circular(20.r),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF12B31A).withValues(alpha: 0.08)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isActive
                        ? const Color(0xFF12B31A)
                        : const Color(0xFFE0E0E0),
                    width: isActive ? 1.5.w : 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    Text(emoji, style: TextStyle(fontSize: 14.sp)),
                    SizedBox(width: 6.w),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight:
                            isActive ? FontWeight.w700 : FontWeight.w500,
                        color: isActive
                            ? Colors.black
                            : const Color(0xFF616161),
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
