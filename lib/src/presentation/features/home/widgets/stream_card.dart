import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';
import '../../../../domain/entities/stream_entity.dart';

class StreamCard extends StatelessWidget {
  const StreamCard({
    super.key,
    required this.stream,
    required this.onFollowToggle,
  });

  final StreamEntity stream;
  final VoidCallback onFollowToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.radius.r20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.radius.r20.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                stream.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: context.color.inputFill,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          context.color.primary,
                        ),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: context.color.border,
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: context.color.disabled,
                      size: 32.w,
                    ),
                  );
                },
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.75),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              left: 10.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(context.radius.r12.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.white,
                      size: 11.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      stream.viewers,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12.h,
              left: 10.w,
              right: 10.w,
              child: Row(
                children: [
                  Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.6),
                        width: 1.5.w,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: context.color.disabled,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 16.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          stream.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(stream.flag, style: TextStyle(fontSize: 10.sp)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: onFollowToggle,
                    borderRadius: BorderRadius.circular(context.radius.r10.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.color.accent,
                        borderRadius:
                            BorderRadius.circular(context.radius.r10.r),
                      ),
                      child: Text(
                        stream.isFollowing ? 'Following' : '+ Follow',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
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

