part of clean_architecture_utils;

class MainPageState<TWidget extends StatefulWidget, TBind extends Object>
    extends State<TWidget> {
  final ITrackersHelper trackersHelper = Modular.get();
  late final String pageTag = _getPageTag();
  final TBind store = Modular.get();

  @override
  void initState() {
    super.initState();
    trackersHelper.initPageTrack(pageTag);
  }

  @override
  void dispose() {
    trackersHelper.stopPageTrack(pageTag);
    super.dispose();
  }

  // coverage:ignore-start
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
  // coverage:ignore-end

  String _getPageTag() {
    return '${runtimeType.toString()}_'
        .replaceAll('State_', '')
        .replaceAll('_', '');
  }

  // coverage:ignore-start
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
  // coverage:ignore-end
}
