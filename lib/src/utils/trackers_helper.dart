part of clean_architecture_utils;

abstract class ITrackersHelper {
  Widget trackedPrimaryButton({
    required String btnId,
    required String btnTitle,
    required VoidCallback? onPress,
    Map<String, Object>? infosToTrack,
  });

  Widget trackedSecondaryButton({
    required String btnId,
    required String btnTitle,
    required VoidCallback? onPress,
    Map<String, Object>? infosToTrack,
  });

  initPageTrack(String pageName);

  stopPageTrack(String pageName, {Map<String, Object>? infos});

  trackCustomEvent(String eventName, {required Map<String, Object> infos});
}
