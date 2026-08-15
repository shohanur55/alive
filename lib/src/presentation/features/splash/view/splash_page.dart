import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;

  late final AnimationController _textController;
  late final Animation<Offset> _titleSlide;
  late final Animation<double> _titleOpacity;
  late final Animation<double> _taglineOpacity;

  late final AnimationController _dotController;
  late final Animation<double> _dot1;
  late final Animation<double> _dot2;
  late final Animation<double> _dot3;

  late final AnimationController _bgController;
  late final Animation<Alignment> _bgBegin;
  late final Animation<Alignment> _bgEnd;

  @override
  void initState() {
    super.initState();

    _initBackgroundAnimations();
    _initLogoAnimations();
    _initTextAnimations();
    _initLoadingAnimations();

    _startSequencing();
  }

  void _initBackgroundAnimations() {
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _bgBegin = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _bgController, curve: Curves.easeInOut));

    _bgEnd = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ).animate(CurvedAnimation(parent: _bgController, curve: Curves.easeInOut));
  }

  void _initLogoAnimations() {
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _logoScale = Tween<double>(begin: 0.35, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  void _initTextAnimations() {
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _titleSlide = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    _titleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  void _initLoadingAnimations() {
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _dot1 = _createDotAnimation(0.0, 0.4);
    _dot2 = _createDotAnimation(0.2, 0.6);
    _dot3 = _createDotAnimation(0.4, 0.8);
  }

  Animation<double> _createDotAnimation(double start, double end) {
    return Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _dotController,
        curve: Interval(start, end, curve: Curves.easeInOut),
      ),
    );
  }

  void _startSequencing() async {
    _logoController.forward();

    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) _textController.forward();

    await Future.delayed(const Duration(milliseconds: 2500));
    if (mounted) context.goNamed(Routes.login);
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _dotController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _bgController,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0xFF0A7A0D),
                  Color(0xFF12B31A),
                  Color(0xFF4ECB26),
                  Color(0xFFB2EC0B),
                ],
                stops: const [0.0, 0.35, 0.7, 1.0],
                begin: _bgBegin.value,
                end: _bgEnd.value,
              ),
            ),
            child: child,
          );
        },
        child: Stack(
          children: [
            _buildGlowCircle(top: -80.h, left: -60.w, size: 260.w, opacity: 0.18),
            _buildGlowCircle(bottom: -100.h, right: -80.w, size: 320.w, opacity: 0.14),
            _buildGlowCircle(top: 200.h, right: -40.w, size: 160.w, opacity: 0.10),

            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    _buildLogo(),
                    SizedBox(height: 32.h),
                    _buildAppName(),
                    const Spacer(flex: 3),
                    _buildLoader(),
                    SizedBox(height: 48.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlowCircle({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required double opacity,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return ScaleTransition(
      scale: _logoScale,
      child: FadeTransition(
        opacity: _logoOpacity,
        child: Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 40.r,
                offset: Offset(0, 16.h),
              ),
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.2),
                blurRadius: 20.r,
                offset: Offset(-6.w, -6.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: Image.asset(
              'asset/logo.png',
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _buildLogoFallback(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoFallback() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB2EC0B), Color(0xFF12B31A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Alive',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          Icon(Icons.videocam_rounded, color: Colors.white, size: 28.w),
        ],
      ),
    );
  }

  Widget _buildAppName() {
    return SlideTransition(
      position: _titleSlide,
      child: FadeTransition(
        opacity: _titleOpacity,
        child: Column(
          children: [
            Text(
              'Alive',
              style: TextStyle(
                fontSize: 46.sp,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 12.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            FadeTransition(
              opacity: _taglineOpacity,
              child: Text(
                'Go Live. Be Real. Stream Now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withValues(alpha: 0.8),
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return FadeTransition(
      opacity: _taglineOpacity,
      child: AnimatedBuilder(
        animation: _dotController,
        builder: (_, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _PulseDot(opacity: _dot1.value),
              SizedBox(width: 8.w),
              _PulseDot(opacity: _dot2.value),
              SizedBox(width: 8.w),
              _PulseDot(opacity: _dot3.value),
            ],
          );
        },
      ),
    );
  }
}

class _PulseDot extends StatelessWidget {
  final double opacity;
  const _PulseDot({required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: 8.w,
        height: 8.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.white.withValues(alpha: 0.4), blurRadius: 6.r),
          ],
        ),
      ),
    );
  }
}
