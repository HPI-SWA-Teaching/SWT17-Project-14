SWT014-SqueakCheck
compiledTestsForSelectedMethod

	^ self namesOfTestsForSelectedMethod collect: [:each|
		 self classWithTestsForSelectedClass methodDict at: each].