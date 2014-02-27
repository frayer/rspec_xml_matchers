require 'nokogiri'
require 'rspec_xml_matchers'

describe RSpecXmlMatchers::XPathMatcherHelper, "#contains_xpath?" do
  before(:all) do
    @test_xml_string = File.new('test_xml/vehicles_no_namespace.xml').read
    @test_xml_doc = Nokogiri::XML(@test_xml_string)
    
    @valid_xpaths = ["/vehicles/vehicle"]
    @valid_xpaths << "/vehicles/vehicle[2]"
    @valid_xpaths << "/vehicles/vehicle[model[text()='M3']]"
    @valid_xpaths << "/vehicles/vehicle[model[text()='M3']]"
    
    @invalid_xpaths = ["/vehicle"]
    @invalid_xpaths << "/vehicles/vehicle[model[text()='S4']]"
  end

  it "contains expected XPath expressions" do
    @valid_xpaths.each do |xpath|
      helper = RSpecXmlMatchers::XPathMatcherHelper.new(@test_xml_string, xpath)
      expect(helper.contains_xpath?).to be_true
    end
  end

  it "does not contain unexpected XPath expressions" do
    @invalid_xpaths.each do |xpath|
      helper = RSpecXmlMatchers::XPathMatcherHelper.new(@test_xml_string, xpath)
      expect(helper.contains_xpath?).to be_false
    end
  end
end