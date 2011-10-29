require 'nokogiri'

module RSpecXmlMatchers
  class SchemaMatcherHelper
    def initialize(xsd)
      if xsd.kind_of? Nokogiri::XML::Schema
        @xsd = xsd
      else
        @xsd = Nokogiri::XML::Schema(xsd)
      end
    end
    
    def validate(xml)
      xml_doc = xml
      xml_doc = Nokogiri::XML(xml) if xml.kind_of? String
      @xsd.validate(xml_doc)
    end
  end
end