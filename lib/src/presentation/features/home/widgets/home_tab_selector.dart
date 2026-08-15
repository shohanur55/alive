import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: _tabs.map((tab) {
          final bool isActive = activeTab == tab;
          return InkWell(
            onTap: () => onTabSelected(tab),
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w, top: 6.h, bottom: 6.h),
              child: Text(
                tab,
                style: TextStyle(
                  fontSize: isActive ? 16.sp : 14.sp,
                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                  color: isActive
                      ? const Color(0xFF12B31A)
                      : const Color(0xFF9E9E9E),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
