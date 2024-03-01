format:
	dart format --line-length=80 --set-exit-if-changed .

analyze: 
	fvm flutter analyze
