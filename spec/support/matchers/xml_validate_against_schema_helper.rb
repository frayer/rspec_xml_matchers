require 'nokogiri'
require 'rspec_xml_matchers'

RSpec::Matchers.define :validate_against_schema do |xsd|
  match do |actual|
    @matcher = RSpecXmlMatchers::SchemaMatcherHelper.new(xsd)
    @validation_result = @matcher.validate(actual)
    @validation_result.empty?
  end
  
  failure_message_for_should do |actual|
    message = ["Expected schema validation to pass but found the following errors:"]
    message.concat(@validation_result.collect { |result| "    #{result.to_s}" }).join("\n")
  end
  
  failure_message_for_should_not do |actual|
    "Expected schema validation to fail, but it was successful."
  end
end