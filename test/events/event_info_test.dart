import 'package:clean_architecture_utils/src/events/events.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  const tName = 'name';
  const tData = {'test': true};

  test('Create EventInfo', () {
    // Act
    const params = EventInfo(name: tName, data: tData);

    // Assert
    expect(params.name, tName);
    expect(params.data, tData);
  });

  test('Test equals', () {
    // Arrange
    const entityOne = EventInfo(name: tName, data: tData);

    const entityTwo = EventInfo(name: tName, data: tData);

    // Assert
    expect(entityOne == entityTwo, isTrue);
  });

  test('Test not equals', () {
    // Arrange
    const entityOne = EventInfo(name: tName, data: 12);

    const entityTwo = EventInfo(name: tName, data: tData);

    // Assert
    expect(entityOne == entityTwo, isFalse);
  });
}
