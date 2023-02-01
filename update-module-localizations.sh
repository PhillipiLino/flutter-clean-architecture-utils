flutter pub run intl_generator:generate_from_arb --output-dir=lib/src/localizations/messages --no-use-deferred-loading lib/src/localizations/module_localization.dart lib/src/localizations/messages/en/intl_*.arb lib/src/localizations/messages/pt/intl_*.arb;
sed -i '' '1,1s/^/\/\/ coverage:ignore-file\n/' lib/src/localizations/messages/messages_all.dart
sed -i '' '1,1s/^/\/\/ coverage:ignore-file\n/' lib/src/localizations/messages/messages_en.dart
sed -i '' '1,1s/^/\/\/ coverage:ignore-file\n/' lib/src/localizations/messages/messages_pt.dart