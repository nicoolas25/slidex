module Slidex
  module Nodes
    class Text < Base
      html_tag :span

      def initialize(options={})
        super

        # Add the raw text as a first child
        @children << Raw.new(text) if text
      end

      def text
        @options[:text]
      end
    end
  end
end
