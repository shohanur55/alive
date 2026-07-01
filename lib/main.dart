import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
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

// ─────────────────────────────────────────────────────────────────────────────
//  LOGIN SCREEN
// ─────────────────────────────────────────────────────────────────────────────

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get status bar padding for notched screens to position logo correctly.
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1. Top Section - White background containing form elements
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: statusBarHeight + 20.h),

                          // App Icon Display
                          Center(
                            child: Container(
                              width: 80.w,
                              height: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x14000000),
                                    blurRadius: 24.r,
                                    offset: Offset(0, 12.h),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.asset(
                                  'asset/logo.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Dynamic premium fallback if the asset isn't ready
                                    return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFB2EC0B),
                                            Color(0xFF12B31A),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Alive',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: -0.5,
                                            ),
                                          ),
                                          Icon(
                                            Icons.videocam,
                                            color: Colors.white,
                                            size: 24.w,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),

                          // Heading
                          Center(
                            child: Text(
                              'Welcome back! 👋',
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF111111),
                                letterSpacing: -0.5,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          SizedBox(height: 6.h),

                          // Subheading
                          Center(
                            child: Text(
                              'Sign in to continue your live streaming journey.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF7A7A7A),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),

                          // Email label
                          Text(
                            'Email ID or Phone Number',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF8A8A8A),
                            ),
                          ),
                          SizedBox(height: 6.h),

                          // Email Input Field
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Enter Registered Email or Phone No.',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 16.h),

                          // Password label
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF8A8A8A),
                            ),
                          ),
                          SizedBox(height: 6.h),

                          // Password Input Field
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Enter your password',
                            obscureText: _obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFF8A8A8A),
                                size: 20.w,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),

                          // Forgot Password Link
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                // Forgot password action
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF12B31A),
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xFF12B31A),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),

                          // Gradient Login Button
                          GestureDetector(
                            onTap: () {
                              // Login action
                            },
                            child: Container(
                              width: double.infinity,
                              height: 54.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27.r),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFB2EC0B), // Lime yellow-green
                                    Color(0xFF12B31A), // Bright green
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x4012B31A),
                                    blurRadius: 16.r,
                                    offset: Offset(0, 8.h),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),

                    // 2. Bottom Section - Curved Wavy Green Gradient Layout
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(minHeight: 280.h),
                        child: Stack(
                          children: [
                            // Backwave - Darker green layer for overlapping effect
                            Positioned.fill(
                              child: ClipPath(
                                clipper: DarkBottomWaveClipper(),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(
                                          255,
                                          9,
                                          134,
                                          13,
                                        ), // ডিপ ডার্ক গ্রিন
                                        Color(0xFF73DF0C),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Frontwave - Premium lime-green gradient containing form items
                            Positioned.fill(
                              child: ClipPath(
                                clipper: MainBottomWaveClipper(),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        // ইমেজের টপ এজ অনুযায়ী উজ্জ্বল লাইম গ্রিন
                                        Color.fromARGB(255, 3, 124, 7),
                                        Color.fromARGB(
                                          255,
                                          120,
                                          219,
                                          28,
                                        ), // মিডেল ট্রানজিশন গ্রিন
                                        Color.fromARGB(255, 185, 227, 70),

                                        // Rich green
                                        // Bright lime-green
                                      ],
                                      begin: Alignment.topLeft,

                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Content overlay inside wave
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ), // Safe spacing for wave crest
                                  // "or continue with" divider
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: const Color(0x66FFFFFF),
                                          thickness: 1.w,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                        ),
                                        child: Text(
                                          'or continue with',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: const Color(0x66FFFFFF),
                                          thickness: 1.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18.h),

                                  // Google Login Button
                                  GestureDetector(
                                    onTap: () {
                                      // Continue with Google
                                    },
                                    child: Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          25.r,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x0F000000),
                                            blurRadius: 12.r,
                                            offset: Offset(0, 4.h),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'asset/google.png',
                                            width: 20.w,
                                            height: 20.w,
                                          ),
                                          SizedBox(width: 12.w),
                                          Text(
                                            'Continue with Google',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12.h),

                                  // Facebook Login Button
                                  GestureDetector(
                                    onTap: () {
                                      // Continue with Facebook
                                    },
                                    child: Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          25.r,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x0F000000),
                                            blurRadius: 12.r,
                                            offset: Offset(0, 4.h),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'asset/facebook.png',
                                            width: 20.w,
                                            height: 20.w,
                                          ),
                                          SizedBox(width: 12.w),
                                          Text(
                                            'Continue with Facebook',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 24.h),

                                  // Sign Up Option
                                  GestureDetector(
                                    onTap: () {
                                      // Nav to Sign Up Screen
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: "Don't have an account? ",
                                          ),
                                          TextSpan(
                                            text: 'Sign Up',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: Colors.white,
                                              color: const Color(0xFAFFFFFF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Custom Clipper for the dark green underlying wave
class DarkBottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Starts a bit higher on the left
    path.moveTo(0, size.height * 0.10);

    // Wave dipping down early and rising in the middle
    path.cubicTo(
      size.width * 0.40,
      size.height * -0.10,
      size.width * 0.35,
      size.height * 0.30,
      size.width * 0.85,
      size.height * 0.12,
    );

    // Rise again from the same point
    path.cubicTo(
      size.width * 0.40,
      size.height * 0.45, // Go upward
      size.width * 0.60,
      size.height * -0.08,
      size.width,
      size.height * 0.09,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Custom Clipper for the foreground lime-green wave
class MainBottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Start on the left side
    path.moveTo(0, size.height * 0.20);

    // Curves down first, then peaks around 65% width
    path.cubicTo(
      size.width * 0.30,
      size.height * 0.35,
      size.width * 0.50,
      size.height * 0.01,
      size.width,
      size.height * 0.15,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Custom reusable text field for input forms
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xFFB5B5B5),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        fillColor: const Color(0xFFF7F7F8),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 15.h,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: const Color(0xFF12B31A),
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
