$:.push(File.join(File.dirname(__FILE__),'..','lib'))
require 'nokogiri'
require 'spec_helper'

describe "XML Schema RSpec Matchers" do
  
  it "should validate a valid document against the schema" do
    doc = Nokogiri::XML(File.new("spec/test_xml/vehicles_namespace.xml"))
    vehicles_schema = Nokogiri::XML::Schema(File.new("spec/test_xml/vehicles.xsd"))
    
    doc.should validate_against_schema(vehicles_schema)
  end
  
  it "should not validate an invalid document against the schema" do
    doc = Nokogiri::XML(File.new('spec/test_xml/vehicles_namespace_invalid.xml'))
    vehicles_schema = Nokogiri::XML::Schema(File.new("spec/test_xml/vehicles.xsd"))
    
    doc.should_not validate_against_schema(vehicles_schema)
  end
  
end