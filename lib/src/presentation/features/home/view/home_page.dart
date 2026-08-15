import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../riverpod/home_provider.dart';
import '../widgets/home_country_selector.dart';
import '../widgets/home_header.dart';
import '../widgets/home_tab_selector.dart';
import '../widgets/stream_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            const HomeHeader(),
            SizedBox(height: 16.h),
            HomeTabSelector(
              activeTab: homeState.activeTab,
              onTabSelected: (tab) {
                homeNotifier.setActiveTab(tab);
              },
            ),
            SizedBox(height: 16.h),
            HomeCountrySelector(
              activeCountry: homeState.activeCountry,
              onCountrySelected: (country) {
                homeNotifier.setActiveCountry(country);
              },
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: homeState.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF12B31A),
                        ),
                      ),
                    )
                  : _buildStreamGrid(homeState, homeNotifier),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStreamGrid(HomeState homeState, Home homeNotifier) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 100.h),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.73,
      ),
      itemCount: homeState.streams.length,
      itemBuilder: (context, index) {
        final stream = homeState.streams[index];
        return StreamCard(
          stream: stream,
          onFollowToggle: () {
            homeNotifier.toggleFollow(stream.id);
          },
        );
      },
    );
  }
}
