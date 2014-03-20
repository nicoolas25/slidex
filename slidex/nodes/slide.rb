module Slidex
  module Nodes
    class Slide < Base
      html_tag :div
      html_class :slide

      def initialize(options={})
        super

        # Add the title as a first child
        @children << Text.new(text: title, html_class: 'slide-title') if title
      end

      def title
        @options[:title]
      end

      def frame_count
        (@children.map(&:frame_count) << 1).max
      end

      def to_html(indentation: '', frame: 1)
        tag(indentation, frame) do
          deeper = indentation + INDENTATION
          framize(deeper) do |deeper, frame|
            @children.each { |c| c.to_html(indentation: deeper, frame: frame) }
          end
        end
      end

      protected

        def framize(indentation)
          if frame_count == 1
            yield(indentation, 1)
          else
            deeper = indentation + INDENTATION
            (1..frame_count).each do |frame|
              puts %Q{#{indentation}<div class="frame">}
              yield(deeper, frame)
              puts %Q{#{indentation}</div>}
            end
          end
        end
    end
  end
end
