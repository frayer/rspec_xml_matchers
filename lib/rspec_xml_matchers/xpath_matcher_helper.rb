require 'nokogiri'

module RSpecXmlMatchers
  class XPathMatcherHelper
    attr_reader :text_value_found
    
    def initialize(xml, xpath)
      @xml = xml
      @xpath = xpath
      if @xml.instance_of? String
        @xml_document = Nokogiri::XML(@xml)
      elsif @xml.kind_of? Nokogiri::XML::Node
        @xml_document = @xml
      end
    end
    
    def contains_xpath?
      xpath_result = @xml_document.xpath(@xpath)
      block_result = !xpath_result.empty? && block_given? ? yield(xpath_result) : true
      !xpath_result.empty? && block_result
    end
    
    def contains_xpath_with_text_value?(text_value)
      contains_xpath? do |xpath_result|
        child = xpath_result.first.child
        @text_value_found = child.to_s
        child.text? && (@text_value_found == text_value)
      end
    end
  end
end