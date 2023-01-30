part of solfacil_architecture_utils;

class MainStore<T extends Object> extends StreamStore<Failure, T> {
  final EventBus? eventBus;
  final T initialValue;

  MainStore(
    this.eventBus,
    this.initialValue,
  ) : super(initialValue);

  showSuccessMessage(String message) {
    eventBus?.fire(EventInfo(name: successMessageEvent, data: message));
  }

  showErrorMessage(String message) {
    eventBus?.fire(EventInfo(name: errorMessageEvent, data: message));
  }

  showAppLoader(bool show) {
    final event = show ? showAppLoaderEvent : hideAppLoaderEvent;
    eventBus?.fire(EventInfo(name: event));
  }
}

const successMessageEvent = 'show_success_message';
const errorMessageEvent = 'show_error_message';
const showAppLoaderEvent = 'show_app_loader';
const hideAppLoaderEvent = 'hide_app_loader';
