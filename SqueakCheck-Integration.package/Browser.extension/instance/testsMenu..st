*SqueakCheck-Integration
testsMenu: aMenu
	<classListMenu>
	<messageListMenu>
	<codePaneMenu>
	<menuPriority:  415>
	
	self namesOfTestsForSelectedMethod ifNotEmpty: [self addTestMenuItems: self compiledTestsForSelectedMethod to: aMenu].
	^ aMenu.