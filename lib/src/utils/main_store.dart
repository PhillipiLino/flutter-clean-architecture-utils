part of clean_architecture_utils;

class MainStore<T extends Object> extends StreamStore<Failure, T> {
  final EventBus? eventBus;
  final T initialValue;

  MainStore(
    this.eventBus,
    this.initialValue,
  ) : super(initialValue);

  showSuccessMessage(String message) {
    eventBus?.fire(
      EventInfo(name: DefaultEvents.showSuccessMessageEvent, data: message),
    );
  }

  showErrorMessage(String message) {
    eventBus?.fire(
      EventInfo(name: DefaultEvents.showErrorMessageEvent, data: message),
    );
  }

  showAppLoader(bool show) {
    final event = show
        ? DefaultEvents.showAppLoaderEvent
        : DefaultEvents.hideAppLoaderEvent;
    eventBus?.fire(EventInfo(name: event));
  }
}
