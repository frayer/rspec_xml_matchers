$:.push(File.join(File.dirname(__FILE__),'..','lib'))
require 'nokogiri'
require 'spec_helper'

describe "XPath RSpec Matchers" do

  xml1 = File.new("spec/test_xml/vehicles_no_namespace.xml").read
  doc1 = Nokogiri::XML(xml1)
  
  ##
  ## Positive Testing
  ##
  
  it "should find XPath expressions which exist in the XML String" do
    xml1.should contain_xpath("/vehicles/vehicle[1]/make")
    xml1.should contain_xpath("/vehicles/vehicle[1]/model")
    xml1.should contain_xpath("/vehicles/vehicle[1]/year")
    xml1.should contain_xpath("/vehicles/vehicle[2]/make")
    xml1.should contain_xpath("/vehicles/vehicle[2]/model")
    xml1.should contain_xpath("/vehicles/vehicle[2]/year")
  end

  it "should find XPath expressions with text values which exist in the XML String" do
    xml1.should contain_xpath("/vehicles/vehicle[1]/make").with_text_value("BMW")
    xml1.should contain_xpath("/vehicles/vehicle[1]/model").with_text_value("335is")
    xml1.should contain_xpath("/vehicles/vehicle[1]/year").with_text_value("2011")
    xml1.should contain_xpath("/vehicles/vehicle[2]/make").with_text_value("BMW")
    xml1.should contain_xpath("/vehicles/vehicle[2]/model").with_text_value("M3")
    xml1.should contain_xpath("/vehicles/vehicle[2]/year").with_text_value("2006")
    xml1.should contain_xpath("/vehicles/vehicle[3]/make").with_text_value("Audi")
    xml1.should contain_xpath("/vehicles/vehicle[3]/model").with_text_value("S5")
    xml1.should contain_xpath("/vehicles/vehicle[3]/year").with_text_value("2011")
  end
  
  it "should find XPath expressions which exist in the Nokogiri Document" do
    doc1.should contain_xpath("/vehicles/vehicle[1]/make")
    doc1.should contain_xpath("/vehicles/vehicle[1]/model")
    doc1.should contain_xpath("/vehicles/vehicle[1]/year")
    doc1.should contain_xpath("/vehicles/vehicle[2]/make")
    doc1.should contain_xpath("/vehicles/vehicle[2]/model")
    doc1.should contain_xpath("/vehicles/vehicle[2]/year")
  end
  
  it "should find XPath expressions with text values which exist in the Nokogiri Document" do
    doc1.should contain_xpath("/vehicles/vehicle[1]/make").with_text_value("BMW")
    doc1.should contain_xpath("/vehicles/vehicle[1]/model").with_text_value("335is")
    doc1.should contain_xpath("/vehicles/vehicle[1]/year").with_text_value("2011")
    doc1.should contain_xpath("/vehicles/vehicle[2]/make").with_text_value("BMW")
    doc1.should contain_xpath("/vehicles/vehicle[2]/model").with_text_value("M3")
    doc1.should contain_xpath("/vehicles/vehicle[2]/year").with_text_value("2006")
    doc1.should contain_xpath("/vehicles/vehicle[3]/make").with_text_value("Audi")
    doc1.should contain_xpath("/vehicles/vehicle[3]/model").with_text_value("S5")
    doc1.should contain_xpath("/vehicles/vehicle[3]/year").with_text_value("2011")
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
  
  it "should not find XPath expressions where the text value does not exist in the XML String" do
    xml1.should_not contain_xpath("/vehicles/vehicle[1]/make").with_text_value("wrong value")
  end
  
  it "should not find XPath expressions where the text value does not exist in the Nokogiri Document" do
    doc1.should_not contain_xpath("/vehicles/vehicle[1]/make").with_text_value("wrong value")
  end
  
end