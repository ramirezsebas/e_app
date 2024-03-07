format:
	dart format --line-length=80 --set-exit-if-changed .

analyze: 
	flutter analyze

gen:
	dart run build_runner build --delete-conflicting-outputs

build-config:
	touch android/key.properties
	echo "storePassword=YOUR_STORE_PASSWORD" >> android/key.properties
	echo "keyPassword=YOUR_KEY_PASSWORD" >> android/key.properties
	echo "keyAlias=YOUR_KEY_ALIAS" >> android/key.properties
	echo "storeFile=YOUR_STORE_FILE" >> android/key.properties

run-dev:
	flutter run --flavor development --target lib/main_development.dart

run-stage:
	flutter run --flavor staging --target lib/main_staging.dart

run-prod:
	flutter run --flavor production --target lib/main_production.dart

build-dev:
	flutter build appbundle --flavor development --target lib/main_development.dart

build-stage:
	flutter build appbundle --flavor staging --target lib/main_staging.dart

build-prod:
	flutter build appbundle --flavor production --target lib/main_production.dart