format:
	dart format --line-length=80 --set-exit-if-changed .

analyze: 
	fvm flutter analyze

gen:
	dart run build_runner build --delete-conflicting-outputs