module Slidex
  module DSL
    def root
      @root ||= Nodes::Base.new
    end

    def tree
      @tree ||= [root]
    end

    def slide(title)
      node = Nodes::Slide.new(title: title)
      tree.last << node
      if block_given?
        tree << node
        yield
        tree.pop
      end
    end

    def list(options={})
      node = Nodes::List.new(options)
      tree.last << node
      if block_given?
        tree << node
        yield
        tree.pop
      end
    end

    def text(text_or_opts, text=nil)
      options = text_or_opts.kind_of?(Hash) ?
        text_or_opts.merge(text: text) :
        {text: text_or_opts}

      node = Nodes::Text.new(options)
    end

    def item(text_or_opts, text=nil)
      options = text_or_opts.kind_of?(Hash) ?
        text_or_opts.merge(text: text) :
        {text: text_or_opts}

      node = Nodes::Item.new(options)
      tree.last << node
      if block_given?
        tree << node
        yield
        tree.pop
      end
    end

    def block(options={})
      node = Nodes::Block.new(options)
      tree.last << node
      if block_given?
        tree << node
        yield
        tree.pop
      end
    end
  end
end
