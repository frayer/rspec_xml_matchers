# rspec\_xml\_matchers

## Archive Notice

I archived this repository on March 26, 2024 while performing repository
cleanup. Feel free to contact me if anyone decides to fork and carry this
forward and I'd be happy to give a shoutout in this README.

## Overview

A collection of custom RSpec Matchers for testing XML. Currently it supports XPath and Schema
Validation matchers, and will be expanded to support XML equivalence testing. Look in the "spec_examples"
directory for more examples, but the following is what you can expect to find.

### XPath Matchers (see "spec\_examples/rspec\_xml\_matchers\_xpath\_spec.rb") ###

	xml.should contain_xpath("/vehicles/vehicle[1]")
	xml.should contain_xpath("/vehicles/vehicle[1]/make").with_text_value("BMW")
	xml.should contain_xpath("/vehicles/vehicle[1]/model").with_text_value("335is")

### XPath Matchers with Namespace Prefixes (see "spec\_examples/rspec\_xml\_matchers\_xpath\_nsprefix\_spec.rb") ###

	namespaces = { 'x' => 'urn:test:vehicles' }
	xml.should contain_xpath("/x:vehicles/x:vehicle[1]/x:make", { 'x' => 'urn:test:vehicles' })
	xml.should contain_xpath("/x:vehicles/x:vehicle[1]/x:make", namespaces).with_text_value("BMW")
	xml.should contain_xpath("/x:vehicles/x:vehicle[1]/x:model", namespaces).with_text_value("335is")

### Schema Validation Matchers (see "spec\_examples/rspec\_xml\_matchers\_schema\_spec.rb") ###

	xml.should validate_against_schema(File.new("vehicles.xsd"))
