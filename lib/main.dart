import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alive/features/auth/presentation/screens/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit wraps the MaterialApp to enable responsive styling.
    // Design size 375x812 is standard for modern notches (e.g., iPhone 13/14).
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Alive Live Streaming',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF12B31A),
              primary: const Color(0xFF12B31A),
            ),
            fontFamily: 'Inter',
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  SPLASH SCREEN
// ─────────────────────────────────────────────────────────────────────────────

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // ── logo scale + fade ──
  late final AnimationController _logoCtrl;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;

  // ── title slide-up + fade ──
  late final AnimationController _titleCtrl;
  late final Animation<Offset> _titleSlide;
  late final Animation<double> _titleOpacity;

  // ── tagline fade ──
  late final AnimationController _taglineCtrl;
  late final Animation<double> _taglineOpacity;

  // ── pulsing dots ──
  late final AnimationController _dotCtrl;
  late final Animation<double> _dot1;
  late final Animation<double> _dot2;
  late final Animation<double> _dot3;

  // ── background pan ──
  late final AnimationController _bgCtrl;
  late final Animation<Alignment> _bgBegin;
  late final Animation<Alignment> _bgEnd;

  @override
  void initState() {
    super.initState();

    // Background gradient pan
    _bgCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _bgBegin = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _bgCtrl, curve: Curves.easeInOut));
    _bgEnd = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ).animate(CurvedAnimation(parent: _bgCtrl, curve: Curves.easeInOut));

    // Logo: scale 0.4→1.0 with elastic bounce, then gently pulse
    _logoCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _logoScale = Tween<double>(begin: 0.35, end: 1.0).animate(
      CurvedAnimation(parent: _logoCtrl, curve: Curves.elasticOut),
    );
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoCtrl,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    _logoCtrl.forward();

    // Title: slides up from 40px below and fades in
    _titleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _titleSlide = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _titleCtrl, curve: Curves.easeOutCubic),
    );
    _titleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _titleCtrl, curve: Curves.easeIn),
    );

    // Tagline fades in
    _taglineCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _taglineCtrl, curve: Curves.easeIn),
    );

    // Pulsing loading dots
    _dotCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _dot1 = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _dotCtrl,
        curve: const Interval(0.0, 0.4, curve: Curves.easeInOut),
      ),
    );
    _dot2 = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _dotCtrl,
        curve: const Interval(0.2, 0.6, curve: Curves.easeInOut),
      ),
    );
    _dot3 = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _dotCtrl,
        curve: const Interval(0.4, 0.8, curve: Curves.easeInOut),
      ),
    );

    // Stagger title and tagline after logo lands
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _titleCtrl.forward();
    });
    Future.delayed(const Duration(milliseconds: 1100), () {
      if (mounted) _taglineCtrl.forward();
    });

    // Navigate to LoginScreen after 3.5 s
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 700),
            pageBuilder: (context, anim, anim2) => const LoginScreen(),
            transitionsBuilder: (context, animation, _, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _titleCtrl.dispose();
    _taglineCtrl.dispose();
    _dotCtrl.dispose();
    _bgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _bgCtrl,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0xFF0A7A0D), // deep forest green
                  Color(0xFF12B31A), // brand green
                  Color(0xFF4ECB26), // vivid mid-green
                  Color(0xFFB2EC0B), // signature lime
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
            // ── Decorative blurred circles ──────────────────────────────────
            Positioned(
              top: -80.h,
              left: -60.w,
              child: _GlowCircle(size: 260.w, opacity: 0.18),
            ),
            Positioned(
              bottom: -100.h,
              right: -80.w,
              child: _GlowCircle(size: 320.w, opacity: 0.14),
            ),
            Positioned(
              top: 200.h,
              right: -40.w,
              child: _GlowCircle(size: 160.w, opacity: 0.10),
            ),

            // ── Main content ────────────────────────────────────────────────
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),

                    // Logo
                    ScaleTransition(
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
                                color: const Color(0x55000000),
                                blurRadius: 40.r,
                                offset: Offset(0, 16.h),
                              ),
                              BoxShadow(
                                color: const Color(0x33FFFFFF),
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
                              errorBuilder: (_, _, _) => Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFB2EC0B),
                                      Color(0xFF12B31A),
                                    ],
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
                                    Icon(
                                      Icons.videocam_rounded,
                                      color: Colors.white,
                                      size: 28.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // App name
                    SlideTransition(
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
                                    color: const Color(0x60000000),
                                    blurRadius: 12.r,
                                    offset: Offset(0, 4.h),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 6.h),
                            // Tagline
                            FadeTransition(
                              opacity: _taglineOpacity,
                              child: Text(
                                'Go Live. Be Real. Stream Now.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xCCFFFFFF),
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Spacer(flex: 3),

                    // Pulsing dots loader
                    FadeTransition(
                      opacity: _taglineOpacity,
                      child: AnimatedBuilder(
                        animation: _dotCtrl,
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
                    ),
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
}

/// Semi-transparent blurred decorative circle
class _GlowCircle extends StatelessWidget {
  const _GlowCircle({required this.size, required this.opacity});
  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Pulsing dot for the loading indicator
class _PulseDot extends StatelessWidget {
  const _PulseDot({required this.opacity});
  final double opacity;

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
            BoxShadow(
              color: const Color(0x60FFFFFF),
              blurRadius: 6.r,
            ),
          ],
        ),
      ),
    );
  }
}


