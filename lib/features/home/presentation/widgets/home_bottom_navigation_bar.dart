import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
    required this.activeIndex,
    required this.onIndexChanged,
  });

  final int activeIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomPaint(
              size: Size(MediaQuery.sizeOf(context).width, 76.h),
              painter: _BottomNavBarPainter(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_filled,
                  label: 'Home',
                  isActive: activeIndex == 0,
                  onTap: () => onIndexChanged(0),
                ),
                _NavItem(
                  icon: Icons.celebration_rounded,
                  label: 'Party',
                  isActive: activeIndex == 1,
                  onTap: () => onIndexChanged(1),
                ),
                SizedBox(
                  width: 78.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Go Live',
                        style: TextStyle(
                            color: activeIndex == 2
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.5),
                          fontSize: 12.sp,
                          fontWeight:
                              activeIndex == 2 ? FontWeight.w800 : FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                _NavItem(
                  icon: Icons.near_me_rounded,
                  label: 'Chats',
                  isActive: activeIndex == 3,
                  onTap: () => onIndexChanged(3),
                ),
                _NavItem(
                  icon: Icons.person_rounded,
                  label: 'Profile',
                  isActive: activeIndex == 4,
                  onTap: () => onIndexChanged(4),
                ),
              ],
            ),
          ),
          Positioned(
            top: 4.h,
            left: (MediaQuery.sizeOf(context).width - 56.w) / 2,
            child: GestureDetector(
              onTap: () => onIndexChanged(2),
              child: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10.r,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.sensors_rounded,
                    color: const Color(0xFF12B31A),
                    size: 26.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.5),
            size: 26.w,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.7),
              fontSize: 12.sp,
              fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFB2EC0B), Color(0xFF12B31A)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    final double radius = 0.w;
    final double width = size.width;
    final double height = size.height;
    final double center = width / 2;
    final double notchWidth = 44.w;
    final double notchHeight = 32.h;

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(center - notchWidth, 0);
    path.cubicTo(
      center - notchWidth / 2 - 5,
      0,
      center - notchWidth / 2 - 15,
      notchHeight,
      center,
      notchHeight,
    );
    path.cubicTo(
      center + notchWidth - 11.w,
      notchHeight - 4,
      center + notchWidth - 28.w,
      0,
      center + notchWidth + 2.w,
      0,
    );
    path.lineTo(width - radius, 0);
    path.quadraticBezierTo(width, 0, width, radius);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.2), 8.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}