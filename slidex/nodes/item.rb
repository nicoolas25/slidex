module Slidex
  module Nodes
    class Item < Text
      html_tag :li

      def visible_at?(frame)
        if @parent.frame == :items
          @parent.children.index(self) + 1 <= frame
        else
          super(frame)
        end
      end
    end
  end
end
