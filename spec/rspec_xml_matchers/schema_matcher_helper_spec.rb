require 'nokogiri'
require 'rspec_xml_matchers'

describe RSpecXmlMatchers::SchemaMatcherHelper do
  
  before(:all) do
    @test_xml_string = File.new('test_xml/vehicles_no_namespace.xml').read
    @test_xml_ns_string = File.new('test_xml/vehicles_namespace.xml').read
    @test_xml_ns_invalid_string = File.new('test_xml/vehicles_namespace_invalid.xml').read
    
    @test_xsd_string = File.new('test_xml/vehicles.xsd').read
    @test_xsd_schema = Nokogiri::XML::Schema(@test_xsd_string)
    
    @helper = RSpecXmlMatchers::SchemaMatcherHelper.new(@test_xsd_string)
  end
  
  it "should return an empty Array when there are no schema validate errors" do
    results = @helper.validate(@test_xml_ns_string)
    results.should be_empty
  end
  
  it "should return at least one schema validation error when validation fails" do
    results = @helper.validate(@test_xml_string)
    results.should have_at_least(1).error
  end
  
  it "should return 3 schema validation errors" do
    results = @helper.validate(@test_xml_ns_invalid_string)
    results.should have_at_least(3).errors
  end
  
end