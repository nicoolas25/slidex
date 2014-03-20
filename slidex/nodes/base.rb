module Slidex
  module Nodes
    class Base
      INDENTATION = '  '.freeze

      attr_reader :children, :frame

      def initialize(options={})
        @children = []
        @options  = options
        @frame    = options[:frame] || :all
      end

      def <<(node)
        node.parent = self
        @children << node
      end

      def frame_count
        counts  = @children.map(&:frame_count)
        counts << (@frame.kind_of?(Numeric) ? @frame : 1)
        counts.max
      end

      def visible_at?(frame)
        @frame == :all ||
          @frame == frame ||
          (@frame.respond_to?(:include?) && @frame.include?(frame)) ||
          (@parent && @parent.visible_at?(frame))
      end

      def to_html(indentation: '', frame: 1)
        tag(indentation, frame) do
          deeper = indentation + INDENTATION
          @children.each { |c| c.to_html(indentation: deeper, frame: frame) }
        end
      end

      def self.html_tag(tag=nil)
        return @html_tag || :div if tag.nil?
        @html_tag = tag
      end

      html_tag :div

      def self.html_class(klass=nil)
        return @html_class if klass.nil?
        @html_class = klass
      end

      html_class :deck

      protected

        attr_writer :parent

        def tag(indentation, frame)
          html_tag   = @options[:html_tag]   || self.class.html_tag
          html_class = @options[:html_class] || self.class.html_class

          classes = [html_class]
          classes << 'invisible' unless visible_at?(frame)
          classes.compact!

          puts %Q{#{indentation}<#{html_tag} class="#{classes.join(' ')}">}
          yield
          puts %Q{#{indentation}</#{html_tag}>}
        end
    end
  end
end
