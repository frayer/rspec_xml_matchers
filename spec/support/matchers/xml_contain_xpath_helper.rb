require 'nokogiri'
require 'rspec_xml_matchers'

RSpec::Matchers.define :contain_xpath do |xpath_expression, namespace_map|
  @opts = {}
  
  chain :with_text_value do |text_value|
    @opts[:text_value] = text_value
  end
  
  match do |actual|
    namespaces = namespace_map.nil? ? {} : namespace_map
    @matcher = RSpecXmlMatchers::XPathMatcherHelper.new(actual, xpath_expression, namespaces)
    if @opts[:text_value]
      @matcher.contains_xpath_with_text_value?(@opts[:text_value])
    else
      @matcher.contains_xpath?
    end
  end
  
  failure_message_for_should do |actual|
    opts_message = [
      "                  with text value: '#{@opts[:text_value]}'",
      "             but found text value: '#{@matcher.text_value_found}'"
    ].join("\n") if @opts[:text_value]
    
    [ "Expected to find XPath expression: '#{xpath_expression}'", opts_message ].join("\n")
  end
  
  failure_message_for_should_not do |actual|
    opts_message = "with text value: '#{@opts[:text_value]}'" if @opts[:text_value]
    [ "Expected to not find XPath expression: '#{xpath_expression}'", opts_message ].join("\n")
  end
end