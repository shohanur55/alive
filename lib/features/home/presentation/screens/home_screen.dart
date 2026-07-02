import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodels/home_viewmodel.dart';
import '../widgets/home_bottom_navigation_bar.dart';
import '../widgets/home_country_selector.dart';
import '../widgets/home_header.dart';
import '../widgets/home_tab_selector.dart';
import '../widgets/stream_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    final homeViewModel = ref.read(homeViewModelProvider.notifier);

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
                homeViewModel.setActiveTab(tab);
              },
            ),
            SizedBox(height: 16.h),
            HomeCountrySelector(
              activeCountry: homeState.activeCountry,
              onCountrySelected: (country) {
                homeViewModel.setActiveCountry(country);
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
                  : _buildStreamGrid(homeState, homeViewModel),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        activeIndex: homeState.activePageIndex,
        onIndexChanged: (index) {
          homeViewModel.setActivePageIndex(index);
        },
      ),
    );
  }

  Widget _buildStreamGrid(HomeState homeState, HomeViewModel homeViewModel) {
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
            homeViewModel.toggleFollow(stream.id);
          },
        );
      },
    );
  }
}