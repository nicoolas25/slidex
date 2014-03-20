
module Slidex
  module Nodes
    root_path = File.expand_path(File.dirname(__FILE__))

    autoload :Base,  "#{root_path}/nodes/base"
    autoload :Block, "#{root_path}/nodes/block"
    autoload :Item,  "#{root_path}/nodes/item"
    autoload :List,  "#{root_path}/nodes/list"
    autoload :Raw,   "#{root_path}/nodes/raw"
    autoload :Slide, "#{root_path}/nodes/slide"
    autoload :Text,  "#{root_path}/nodes/text"
  end
end
