import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/stream_data.dart';
import '../widgets/home_bottom_navigation_bar.dart';
import '../widgets/home_country_selector.dart';
import '../widgets/home_header.dart';
import '../widgets/home_tab_selector.dart';
import '../widgets/stream_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activePageIndex = 0;
  String _activeTab = 'Stream';
  String _activeCountry = 'Global';

  final List<StreamData> _streams = [
    StreamData(
      id: '1',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
    StreamData(
      id: '2',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: true,
    ),
    StreamData(
      id: '3',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
    StreamData(
      id: '4',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
    StreamData(
      id: '5',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: true,
    ),
    StreamData(
      id: '6',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
    StreamData(
      id: '7',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: true,
    ),
    StreamData(
      id: '8',
      name: 'Sofia Chen',
      viewers: '8.2K',
      imageUrl:
          'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=500&auto=format&fit=crop&q=80',
      flag: '🇵🇭',
      isFollowing: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
              activeTab: _activeTab,
              onTabSelected: (tab) {
                setState(() => _activeTab = tab);
              },
            ),
            SizedBox(height: 16.h),
            HomeCountrySelector(
              activeCountry: _activeCountry,
              onCountrySelected: (country) {
                setState(() => _activeCountry = country);
              },
            ),
            SizedBox(height: 16.h),
            Expanded(child: _buildStreamGrid()),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        activeIndex: _activePageIndex,
        onIndexChanged: (index) {
          setState(() => _activePageIndex = index);
        },
      ),
    );
  }

  Widget _buildStreamGrid() {
    return GridView.builder(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 100.h),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.73,
      ),
      itemCount: _streams.length,
      itemBuilder: (context, index) {
        final stream = _streams[index];
        return StreamCard(
          stream: stream,
          onFollowToggle: () {
            setState(() {
              _streams[index] = stream.copyWith(isFollowing: !stream.isFollowing);
            });
          },
        );
      },
    );
  }
}