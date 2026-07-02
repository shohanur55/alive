import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/common_widgets/custom_text_field.dart';
import '../../../../core/utils/wave_clippers.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../viewmodels/auth_viewmodel.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            sliver: SliverToBoxAdapter(
              child: _buildTopSection(statusBarHeight),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: _buildBottomSection(authState),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSection(double statusBarHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: statusBarHeight + 20.h),
        _buildAppLogo(),
        SizedBox(height: 24.h),
        Center(
          child: Text(
            'Welcome back! 👋',
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
              letterSpacing: -0.5,
              fontFamily: 'Inter',
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Center(
          child: Text(
            'Sign in to continue your live streaming journey.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.textGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 28.h),
        Text(
          'Email ID or Phone Number',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textLightGrey,
          ),
        ),
        SizedBox(height: 6.h),
        CustomTextField(
          controller: _emailController,
          hintText: 'Enter Registered Email or Phone No.',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        Text(
          'Password',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textLightGrey,
          ),
        ),
        SizedBox(height: 6.h),
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
              color: AppColors.textLightGrey,
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
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        _buildPrimaryLoginButton(
          label: 'Login',
          onTap: _goToHome,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildBottomSection(AsyncValue<dynamic> authState) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipPath(
            clipper: DarkBottomWaveClipper(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.darkGreenWave,
                    AppColors.lightGreenWave,
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.transitionGreen1,
                    AppColors.transitionGreen2,
                    AppColors.transitionGreen3,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 30.h),
              _buildDividerLabel('or continue with'),
              SizedBox(height: 18.h),
              _buildSocialLoginButton(
                label: 'Continue with Google',
                assetPath: 'asset/google.png',
                isLoading: authState.isLoading,
                onTap: authState.isLoading ? null : _signInWithGoogle,
              ),
              SizedBox(height: 12.h),
              _buildSocialLoginButton(
                label: 'Continue with Facebook',
                assetPath: 'asset/facebook.png',
                onTap: () {},
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.white,
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
    );
  }

  Widget _buildAppLogo() {
    return Center(
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
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
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.lime, AppColors.primary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alive',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Icon(
                      Icons.videocam,
                      color: AppColors.white,
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

  Widget _buildPrimaryLoginButton({required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.r),
          gradient: const LinearGradient(
            colors: [AppColors.lime, AppColors.primary],
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
            label,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
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
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x0F000000),
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
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primary,
                ),
              )
            else ...[
              Image.asset(
                assetPath,
                width: 20.w,
                height: 20.w,
              ),
              SizedBox(width: 12.w),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14.sp,
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
            color: const Color(0x66FFFFFF),
            thickness: 1.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            label,
            style: TextStyle(
              color: AppColors.white,
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
    );
  }

  Future<void> _goToHome() async {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Future<void> _signInWithGoogle() async {
    final result = await ref.read(authViewModelProvider.notifier).loginWithGoogle();
    if (result != null && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }
}
