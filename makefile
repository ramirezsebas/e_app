format:
	dart format --line-length=80 --set-exit-if-changed .

analyze: 
	flutter analyze

gen:
	dart run build_runner build --delete-conflicting-outputs

build-dev:
	flutter build appbundle --flavor development --target lib/main_development.dart

build-stage:
	flutter build appbundle --flavor staging --target lib/main_staging.dart

build-prod:
	flutter build appbundle --flavor production --target lib/main_production.dart