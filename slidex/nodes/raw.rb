module Slidex
  module Nodes
    class Raw < Base
      def initialize(raw)
        super({})
        @raw = raw
      end

      def to_html(indentation: '', frame: 1)
        puts %Q{#{indentation}#{@raw}}
      end
    end
  end
end
