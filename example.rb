require 'pry'
require './slidex'

include Slidex::DSL

slide "This is a list" do
  list frame: :items do
    item "This is item 1"
    item "This is item 2"
  end
end

slide "This is a block" do
  block do
    text "This is a nice sentence."
  end
end

slide "Combine both" do
  list frame: :items do
    item "This is item 1"
    item "This is item 2"
  end

  block frame: 3 do
    text "This is a nice sentence."
  end
end

root.to_html
