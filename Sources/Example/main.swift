import Speck

Reporter.listen(reporter)

Speck.register([EquatableSpec, HooksSpec])
try Speck.run()
