generators
randomObject: anIterationProgress
	| selector |
	
	selector := ((self class allSelectors select: [:name | name beginsWith: 'random'])
		reject: [:name | name == #randomObject:]) atRandom: self rng.
	^ self perform: selector withArguments: {anIterationProgress}.