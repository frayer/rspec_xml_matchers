$:.push(File.join(File.dirname(__FILE__),'..','lib'))
require 'test/unit'
require 'nokogiri'
require 'rspec_xml_matchers'

module RSpecXmlMatchers
  class XPathMatcherHelperTest < Test::Unit::TestCase
    def setup
      @test_xml_string = File.new('spec/test_xml/vehicles_no_namespace.xml').read
      @test_xml_doc = Nokogiri::XML(@test_xml_string)
      
      @valid_xpaths = ["/vehicles/vehicle"]
      @valid_xpaths << "/vehicles/vehicle[2]"
      @valid_xpaths << "/vehicles/vehicle[model[text()='M3']]"
      @valid_xpaths << "/vehicles/vehicle[model[text()='M3']]"
      
      @invalid_xpaths = ["/vehicle"]
      @invalid_xpaths << "/vehicles/vehicle[model[text()='S4']]"
    end
    
    def test_contains_xpath
      @valid_xpaths.each do |xpath|
        helper = RSpecXmlMatchers::XPathMatcherHelper.new(@test_xml_string, xpath)
        assert helper.contains_xpath?, "Expected to find XPath #{xpath}."
      end
    end
    
    def test_doesnt_contain_xpath
      @invalid_xpaths.each do |xpath|
        helper = RSpecXmlMatchers::XPathMatcherHelper.new(@test_xml_string, xpath)
        assert !helper.contains_xpath?, "Expected to NOT find XPath #{xpath}."
      end
    end
  end
end