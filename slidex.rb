module Slidex
  root_path = File.expand_path(File.dirname(__FILE__))

  autoload :Nodes, "#{root_path}/slidex/nodes"
  autoload :DSL,   "#{root_path}/slidex/dsl"
end
