import 'package:ads_example/utils/ads_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  void initState() {
    super.initState();
    AdsHelper.adsHelper.loadBannerAds();
    AdsHelper.adsHelper.loadInterstitialAds();
    AdsHelper.adsHelper.loadRewardedAds();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdsMob Example'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: AdWidget(ad: AdsHelper.adsHelper.bannerAd!),
          ),
          ElevatedButton(onPressed: () {
            if(AdsHelper.adsHelper.interstitialAd != null){
               AdsHelper.adsHelper.interstitialAd!.show();
            }
          }, child: Text('Show InterstitialAds')),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            if(AdsHelper.adsHelper.rewardedAd != null){
              AdsHelper.adsHelper.rewardedAd!.show(
                onUserEarnedReward: (ad, reward){
                  print("Amounts/points of to earn => ${reward.amount}");
                }
              );
            }
          }, child: Text('Show RewardedAds')),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}
