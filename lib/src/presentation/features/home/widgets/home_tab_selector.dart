import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';

class HomeTabSelector extends StatelessWidget {
  const HomeTabSelector({
    super.key,
    required this.activeTab,
    required this.onTabSelected,
  });

  final String activeTab;
  final ValueChanged<String> onTabSelected;

  static const List<String> _tabs = ['Stream', 'Hot', 'Follow'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding.p16.w),
      child: Row(
        children: _tabs.map((tab) {
          final bool isActive = activeTab == tab;
          return InkWell(
            onTap: () => onTabSelected(tab),
            borderRadius: BorderRadius.circular(context.radius.r12.r),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w, top: 6.h, bottom: 6.h),
              child: Text(
                tab,
                style: (isActive
                        ? context.textStyle.bodyLarge
                        : context.textStyle.bodyMedium)
                    .copyWith(
                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                  color: isActive
                      ? context.color.primary
                      : context.color.text.tertiary,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

