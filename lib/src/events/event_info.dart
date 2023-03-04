part of clean_architecture_utils;

class EventInfo extends Equatable {
  final String name;
  final dynamic data;

  const EventInfo({required this.name, this.data});

  @override
  List<Object?> get props => [
        name,
        data,
      ];
}
