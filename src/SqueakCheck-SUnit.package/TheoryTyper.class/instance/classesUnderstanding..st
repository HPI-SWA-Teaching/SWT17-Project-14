typing
classesUnderstanding: aSymbol
	"Return a Set of pairs of the form {#NameOfClass. isMeta}, representing all the classes known to understand the message aSymbol."
	^ ((Object systemNavigation allImplementorsOf: aSymbol)
		collect: [:each | {each classSymbol. each classIsMeta}])
			asSet.