rspec\_xml\_matchers
====================

Overview
--------

A collection of custom RSpec Matchers for testing XML. Currently it only supports XPath matchers,
but will be expanded to support schema validation and XML equivalence testing. Look in the "spec"
directory for more examples, but the following is what you can expect to find.

	xml.should contain_xpath("/vehicles/vehicle[1]")
	xml.should contain_xpath("/vehicles/vehicle[1]/make").with_text_value("BMW")
	xml.should contain_xpath("/vehicles/vehicle[1]/model").with_text_value("335is")
