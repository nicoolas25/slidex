module Slidex
  module Nodes
    class List < Base
      html_tag :ul

      def visible_at?(frame)
        @frame == :items || super(frame)
      end

      def frame_count
        (@frame == :items && @children.size) || super
      end
    end
  end
end
