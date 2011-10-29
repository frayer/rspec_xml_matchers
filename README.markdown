rspec\_xml\_matchers
====================

Overview
--------

A collection of custom RSpec Matchers for testing XML. Currently it supports XPath and Schema
Validation matchers, and will be expanded to support XML equivalence testing. Look in the "spec"
directory for more examples, but the following is what you can expect to find.

### XPath Matchers (see "spec/rspec\_xml\_matchers\_xpath\_spec.rb") ###

	xml.should contain_xpath("/vehicles/vehicle[1]")
	xml.should contain_xpath("/vehicles/vehicle[1]/make").with_text_value("BMW")
	xml.should contain_xpath("/vehicles/vehicle[1]/model").with_text_value("335is")

### Schema Validation Matchers (see "spec/rspec\_xml\_matchers\_schema\_spec.rb") ###

	xml.should validate_against_schema(File.new("vehicles.xsd"))
