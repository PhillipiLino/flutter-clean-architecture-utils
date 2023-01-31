import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solfacil_architecture_utils/events.dart';
import 'package:solfacil_architecture_utils/utils.dart';

class EventBusMock extends Mock implements EventBus {}

main() {
  late EventBus eventBus;
  late MainStore store;

  setUp(() {
    eventBus = EventBusMock();
    store = MainStore(eventBus, 1);
  });

  test('Show success message', () async {
    // Arrange
    const message = 'Success message';

    // Act
    await store.showSuccessMessage(message);

    // Assert
    verify(() => eventBus.fire(
          const EventInfo(
              name: DefaultEvents.showSuccessMessageEvent, data: message),
        )).called(1);
  });

  test('Show error message', () async {
    // Arrange
    const message = 'Error message';

    // Act
    await store.showErrorMessage(message);

    // Assert
    verify(() => eventBus.fire(
          const EventInfo(
              name: DefaultEvents.showErrorMessageEvent, data: message),
        )).called(1);
  });

  test('Show app loader passing true', () async {
    // Act
    await store.showAppLoader(true);

    // Assert
    verify(() => eventBus.fire(
        const EventInfo(name: DefaultEvents.showAppLoaderEvent))).called(1);
  });

  test('Show app loader passing false', () async {
    // Act
    await store.showAppLoader(false);

    // Assert
    verify(() => eventBus.fire(
        const EventInfo(name: DefaultEvents.hideAppLoaderEvent))).called(1);
  });
}
