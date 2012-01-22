require 'nokogiri'

module RSpecXmlMatchers

  class XPathMatcherHelper
    attr_reader :text_value_found
    
    def initialize(xml, xpath, namespaces={})
      @xml = xml
      @xpath = xpath
      @namespaces = namespaces
      if @xml.instance_of? String
        @xml_document = Nokogiri::XML(@xml)
      elsif @xml.kind_of? Nokogiri::XML::Node
        @xml_document = @xml
      end
    end
    
    # Checks for the existence of the XPath expression in the XML given in
    # the initializer. If a block is given to this method, it is passed
    # the Nokogiri::XML::NodeSet result of the XPath search.
    def contains_xpath?
      xpath_result_set = @xml_document.xpath(@xpath, @namespaces)
      yield(xpath_result_set) if block_given?
      !xpath_result_set.empty?
    end
    
    # Checks for the existence of the XPath expression in the XML given in
    # the initializer as well as if the Node returned by that XPath expression
    # contains the text value given in this method.
    def contains_xpath_with_text_value?(text_value)
      contains_text_value = false
      
      contains_xpath? do |xpath_result_set|
        if !xpath_result_set.empty?
          child = xpath_result_set.first.child
          contains_text_value = !child.nil? && child.text? && (child.to_s == text_value)
        end
      end
      
      contains_text_value
    end
    
  end

end