import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  AdsHelper._();

  static final adsHelper = AdsHelper._();

  BannerAd? bannerAd;

  void loadBannerAds() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3940256099942544/9214589741",
        listener: BannerAdListener(),
        request: AdRequest());
    bannerAd!.load();
  }

  InterstitialAd? interstitialAd;

  void loadInterstitialAds() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              interstitialAd = ad;
            },
            onAdFailedToLoad: (error) {}));
  }

  RewardedAd? rewardedAd;

  void loadRewardedAds() {
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
          },
          onAdFailedToLoad: (error) {},
        ));
  }

  AppOpenAd? appOpenAd;

  // void loadAppOpenAds(){
  //   AppOpenAd.load(adUnitId: "ca-app-pub-3940256099942544/2247696110", request: AdRequest(), adLoadCallback: adLoadCallback)
  // }
}
