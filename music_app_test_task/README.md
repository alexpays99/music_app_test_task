# Run project commands sequencially

flutter pub run build_runner build --delete-conflicting-outputs
flutter run --dart-define-from-file=.env/app_keys.json

