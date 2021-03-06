typing
typeTheory: aCompiledMethod
	| prototypeClassNames pragma prototypeClasses |
	
	"If the theory uses the <theory> pragma, treat that as <theoryTaking: #Object>. Otherwise, the symbol given in the pragma gives the name of the class used to determine which generator to use."
	
	pragma := aCompiledMethod pragmaAt: #theoryTaking:.
	pragma ifNil: [^((1 to: self selector numArgs) collect: [:unused |
		self acceptableTypesFor: aCompiledMethod])].

	prototypeClassNames := pragma arguments first.
	(prototypeClassNames isKindOf: Array) ifFalse: [
		prototypeClassNames := {prototypeClassNames}].
		
	prototypeClasses := prototypeClassNames collect: [:each |
		self class environment at: each ifAbsent: [MissingPrototypeException signal: each]].
	
	prototypeClasses size = 1 ifTrue: [
		prototypeClasses := (1 to: self selector numArgs) collect: [:unused | prototypeClasses first]].
	
	self selector numArgs ~= prototypeClasses size ifTrue: [
		MissingPrototypeException signal: ('expected 1 or ', self selector numArgs,' arguments for #theoryTaking:, but received ',prototypeClassNames size)].
	
	^ prototypeClasses