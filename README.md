# Slidex

This a a small slideshow generator based on a Ruby DSL.

The purpose of this experiment is to introduce the concept of 'frames'
as the excellent beamer does it.

## Usage

Since the project has no dependencies Bundler isn't used yet and since
the project isn't mature there is no gemspec either.

To experiment with the actual code you can:

```ruby
# Include the Slidex module
require 'slidex'
include Slidex

# Declare your slideshow (see the exemple)
# ...

# Output the resulting html body
root.to_html
```


## Example

The following code will produce a slide with 3 frames. On the first one,
only the first element of the list is visible. On the second one, the two
item on the list are visible. On the third one, all the element are
visible.

```ruby
slide "Combine both list and block" do
  list frame: :items do
    item "This is item 1"
    item "This is item 2"
  end

  block frame: 3 do
    text "This is a nice sentence."
  end
end
```

The idea behind this is to avoid useless animation but to keep a fine
grained control over what is displayed and when.

## TODO

The project is not suitable for any real use right now. The following
things are missing:

* A decent stylesheet
* The Javascript to do the transition between frames
* A robust HTML generator based (visitor pattern)
* New nodes like `code`
* Options for the nodes like `center`

## Enchancements

* Advanced navigation that lists the slides
