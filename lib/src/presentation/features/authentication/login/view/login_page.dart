import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utiliity/wave_clippers.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/text/typography.dart';
import '../riverpod/login_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      backgroundColor: context.color.scaffoldBackground,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: context.padding.p24.w),
            sliver: SliverToBoxAdapter(
              child: _buildTopSection(statusBarHeight),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: _buildBottomSection(loginState),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSection(double statusBarHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(statusBarHeight + context.spacing.s20.h),
        _buildAppLogo(),
        Gap(context.spacing.s24.h),
        const Center(
          child: DisplayLargeText('Welcome back! 👋'),
        ),
        Gap(context.spacing.s6.h),
        const Center(
          child: BodyMediumText.secondary(
            'Sign in to continue your live streaming journey.',
            textAlign: TextAlign.center,
          ),
        ),
        Gap(context.spacing.s28.h),
        const LabelLargeText('Email ID or Phone Number'),
        Gap(context.spacing.s6.h),
        CustomTextField(
          controller: _emailController,
          hintText: 'Enter Registered Email or Phone No.',
          keyboardType: TextInputType.emailAddress,
        ),
        Gap(context.spacing.s16.h),
        const LabelLargeText('Password'),
        Gap(context.spacing.s6.h),
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
              color: context.color.text.secondary,
              size: 20.w,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        Gap(context.spacing.s10.h),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              context.pushNamed(Routes.resetPassword);
            },
            child: Text(
              'Forgot Password?',
              style: context.textStyle.labelLarge.copyWith(
                color: context.color.primary,
                decoration: TextDecoration.underline,
                decorationColor: context.color.primary,
              ),
            ),
          ),
        ),
        Gap(context.spacing.s24.h),
        _buildPrimaryLoginButton(
          label: 'Login',
          onTap: _goToHome,
        ),
        Gap(context.spacing.s16.h),
      ],
    );
  }

  Widget _buildBottomSection(AsyncValue<dynamic> loginState) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipPath(
            clipper: DarkBottomWaveClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.color.primary.withValues(alpha: 0.8),
                    context.color.accent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: ClipPath(
            clipper: MainBottomWaveClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: context.color.brandGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding.p24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Gap(context.spacing.s30.h),
              _buildDividerLabel('or continue with'),
              Gap(context.spacing.s16.h),
              _buildSocialLoginButton(
                label: 'Continue with Google',
                assetPath: 'asset/google.png',
                isLoading: loginState.isLoading,
                onTap: loginState.isLoading ? null : _signInWithGoogle,
              ),
              Gap(context.spacing.s12.h),
              _buildSocialLoginButton(
                label: 'Continue with Facebook',
                assetPath: 'asset/facebook.png',
                onTap: () {},
              ),
              Gap(context.spacing.s24.h),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.registration);
                },
                child: RichText(
                  text: TextSpan(
                    style: context.textStyle.bodyMedium.copyWith(
                      color: context.color.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: 'Sign Up',
                        style: context.textStyle.bodyMedium.copyWith(
                          color: context.color.onPrimary,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          decorationColor: context.color.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(context.spacing.s20.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppLogo() {
    return Center(
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.radius.r20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24.r,
              offset: Offset(0, 12.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(context.radius.r20.r),
          child: Image.asset(
            'asset/logo.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: context.color.brandGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(context.radius.r20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alive',
                      style: context.textStyle.headingSmall.copyWith(
                        color: context.color.onPrimary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Icon(
                      Icons.videocam,
                      color: context.color.onPrimary,
                      size: 24.w,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryLoginButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.radius.r27.r),
          gradient: LinearGradient(
            colors: context.color.brandGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: context.color.primary.withValues(alpha: 0.25),
              blurRadius: 16.r,
              offset: Offset(0, 8.h),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: context.textStyle.bodyLarge.copyWith(
              color: context.color.onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton({
    required String label,
    required String assetPath,
    VoidCallback? onTap,
    bool isLoading = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: context.color.scaffoldBackground,
          borderRadius: BorderRadius.circular(context.radius.r25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: context.color.primary,
                ),
              )
            else ...[
              Image.asset(
                assetPath,
                width: 20.w,
                height: 20.w,
              ),
              Gap(context.spacing.s12.w),
              Text(
                label,
                style: context.textStyle.bodyMedium.copyWith(
                  color: context.color.text.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDividerLabel(String label) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.color.onPrimary.withValues(alpha: 0.4),
            thickness: 1.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding.p12.w),
          child: Text(
            label,
            style: context.textStyle.labelLarge.copyWith(
              color: context.color.onPrimary,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: context.color.onPrimary.withValues(alpha: 0.4),
            thickness: 1.w,
          ),
        ),
      ],
    );
  }

  Future<void> _goToHome() async {
    final emailPhone = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (emailPhone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email or phone number')),
      );
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your password')),
      );
      return;
    }

    if (!mounted) return;
    context.goNamed(Routes.home);
  }

  Future<void> _signInWithGoogle() async {
    final user = await ref.read(loginProvider.notifier).loginWithGoogle();
    if (user != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged in as ${user.email ?? "User"}')),
      );
      context.goNamed(Routes.home);
    }
  }
}

