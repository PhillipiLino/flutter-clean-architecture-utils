import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:solfacil_architecture_utils/utils.dart';

class TrackersHelperMock extends Mock implements ITrackersHelper {}

main() {
  late ITrackersHelper helper;
  late _TestWidgetStore store;

  setUp(() {
    helper = TrackersHelperMock();
    store = _TestWidgetStore();

    initModule(_TestModule(), replaceBinds: [
      Bind.instance<_TestWidgetStore>(store),
      Bind.instance<ITrackersHelper>(helper),
    ]);
  });

  tearDownAll(() {
    verify(() => helper.stopPageTrack(any())).called(1);
  });

  testWidgets('Test init track', (tester) async {
    // Arrange

    // Act
    initModule(_TestModule(), replaceBinds: [
      Bind.instance<_TestWidgetStore>(store),
      Bind.instance<ITrackersHelper>(helper),
    ]);

    await tester.pumpWidget(ModularApp(
      module: _TestModule(),
      child: const MaterialApp(
        home: Scaffold(
          body: _TestWidget(),
        ),
      ),
    ));

    // Assert
    verify(() => helper.initPageTrack(any())).called(1);
  });
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({Key? key}) : super(key: key);

  @override
  State<_TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends MainPageState<_TestWidget, _TestWidgetStore> {
  @override
  Widget build(BuildContext context) => Container();
}

class _TestWidgetStore {}

class _TestModule extends Module {
  @override
  List<Bind<Object>> binds = [
    Bind<_TestWidgetStore>((i) => _TestWidgetStore()),
    Bind<ITrackersHelper>((i) => TrackersHelperMock()),
  ];
}
