$:.push(File.join(File.dirname(__FILE__),'..','lib'))
require 'nokogiri'
require 'spec_helper'

describe "XPath with Namespace Prefixes RSpec Matchers" do

  xml1 = File.new("spec/test_xml/vehicles_namespace.xml").read
  doc1 = Nokogiri::XML(xml1)
  namespaces = { 'x' => 'urn:test:vehicles' }
  ##
  ## Positive Testing
  ##
  
  it "should find XPath expressions which exist in the XML String" do
    xml1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:make", namespaces)
    xml1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:model", namespaces)
    xml1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:year", namespaces)
    xml1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:make", namespaces)
    xml1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:model", namespaces)
    xml1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:year", namespaces)
  end

  it "should find XPath expressions with text values which exist in the XML String" do
    xml1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:make", namespaces).with_text_value("BMW")
    xml1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:model", namespaces).with_text_value("335is")
    xml1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:year", namespaces).with_text_value("2011")
    xml1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:make", namespaces).with_text_value("BMW")
    xml1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:model", namespaces).with_text_value("M3")
    xml1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:year", namespaces).with_text_value("2006")
    xml1.should contain_xpath("/x:vehicles/x:vehicle[3]/x:make", namespaces).with_text_value("Audi")
    xml1.should contain_xpath("/x:vehicles/x:vehicle[3]/x:model", namespaces).with_text_value("S5")
    xml1.should contain_xpath("/x:vehicles/x:vehicle[3]/x:year", namespaces).with_text_value("2011")
  end
  
  it "should find XPath expressions which exist in the Nokogiri Document" do
    doc1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:make", namespaces)
    doc1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:model", namespaces)
    doc1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:year", namespaces)
    doc1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:make", namespaces)
    doc1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:model", namespaces)
    doc1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:year", namespaces)
  end
  
  it "should find XPath expressions with text values which exist in the Nokogiri Document" do
    doc1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:make", namespaces).with_text_value("BMW")
    doc1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:model", namespaces).with_text_value("335is")
    doc1.should contain_xpath("/x:vehicles/x:vehicle[1]/x:year", namespaces).with_text_value("2011")
    doc1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:make", namespaces).with_text_value("BMW")
    doc1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:model", namespaces).with_text_value("M3")
    doc1.should contain_xpath("/x:vehicles/x:vehicle[2]/x:year", namespaces).with_text_value("2006")
    doc1.should contain_xpath("/x:vehicles/x:vehicle[3]/x:make", namespaces).with_text_value("Audi")
    doc1.should contain_xpath("/x:vehicles/x:vehicle[3]/x:model", namespaces).with_text_value("S5")
    doc1.should contain_xpath("/x:vehicles/x:vehicle[3]/x:year", namespaces).with_text_value("2011")
  end
  
  ##
  ## Negative Testing
  ##
  
  it "should not find XPath expressions which do not exist in the XML String" do
    xml1.should_not contain_xpath("/vehicles/model")
  end
  
  it "should not find XPath expressions with text values which do not exist in the XML String" do
    xml1.should_not contain_xpath("/vehicles/model").with_text_value("BMW")
  end
  
  it "should not find XPath expressions which do not exist in the Nokogiri Document" do
    doc1.should_not contain_xpath("/vehicles/make")
  end
  
  it "should not find XPath expressions with text values which do not exist in the Nokogiri Document" do
    doc1.should_not contain_xpath("/vehicles/make").with_text_value("BMW")
  end
  
end