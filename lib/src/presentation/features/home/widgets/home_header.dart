import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding.p16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _AppLogo(),
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 38.w,
                    height: 38.w,
                    decoration: BoxDecoration(
                      color: context.color.inputFill,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: context.color.icon,
                      size: 20.w,
                    ),
                  ),
                  Positioned(
                    top: -2.h,
                    right: -2.w,
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: context.color.error,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '3',
                        style: context.textStyle.bodySmall.copyWith(
                          color: context.color.onPrimary,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: context.spacing.s12.w),
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: context.color.brandGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: context.color.primary.withValues(alpha: 0.2),
                      blurRadius: 8.r,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.card_giftcard_rounded,
                  color: context.color.onPrimary,
                  size: 20.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.radius.r10.r),
        boxShadow: [
          BoxShadow(
            color: context.color.primary.withValues(alpha: 0.2),
            blurRadius: 8.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.radius.r10.r),
        child: Image.asset(
          'asset/logo.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.radius.r10.r),
                gradient: LinearGradient(
                  colors: context.color.brandGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Alive',
                    style: TextStyle(
                      color: context.color.onPrimary,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Icon(
                    Icons.videocam_rounded,
                    color: context.color.onPrimary,
                    size: 14.w,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

