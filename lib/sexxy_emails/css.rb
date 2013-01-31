require 'nokogiri'
require 'css_parser'
require 'css_parser/rule_set'

module SexxyEmails::Css
  include CssParser

  class << self
    # Takes a string of HTML and inlines any css blocks in it.
    def inline(html, options = {})
      Nokogiri::HTML(html).tap do |doc|
        css_parser = CssParser::Parser.new
        # Collect the style and remove from the html tree
        doc.css('style').each do |style|
          css_parser.add_block!(style.content)
          style.remove
        end

        # Each selector
        css_parser.each_selector do |selector, declaration|
          doc.css(selector).each do |node|
            node['style'] = merge_rules(node, selector, declaration)
          end
        end
      end.to_s
    end

    protected
    # Let existing styles be at the top of the cascade
    def merge_rules(node, selector, declaration)
      if node['style'].nil?
        declaration
      else
        CssParser.merge(
          CssParser::RuleSet.new(nil, declaration), 
          CssParser::RuleSet.new(nil, node['style'])).declarations_to_s
      end
    end

  end
end
