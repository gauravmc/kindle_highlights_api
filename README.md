# Kindle Highlights API

A wrapper that helps fetch highlights from Amazon Kindle and play around with them.

## Installation

Add this line to your application's Gemfile:

    gem 'kindle_highlights_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kindle_highlights_api

## Usage

```ruby
require 'kindle_highlights_api'

fetcher = KindleHighlightsAPI::Fetcher.new("yourusername@gmail.com", "somepassword")

books = fetcher.fetch

books.count # =>
19

books.map(&:title) # =>
[
  "Smalltalk Best Practice Patterns",
  "Drawing on the Right Side of the Brain: The Definitive, 4th Edition",
  "Benjamin Franklin: An American Life",
  "Mucusless Diet Healing System",
  "Crucial Conversations Tools for Talking When Stakes Are High, Second Edition",
  "The War of Art",
  "A Short History of Nearly Everything",
  "Einstein: His Life and Universe",
  "Turn the Ship Around!: A True Story of Turning Followers into Leaders",
  "The 5 Elements of Effective Thinking",
  ...
]

books.first.title # =>
"Smalltalk Best Practice Patterns"

books.first.highlights # =>
[
  "If you are trying to explain why code should be different, it is much more satisfying for you and the learner to be able to discuss the pattern and how it applies to the particular situation.",
  "I’m constantly amazed at how even a little help cleaning up small problems reveals the source and solution of much bigger problems.",
  "If you’re programming along, doing nicely, and all of a sudden your program gets balky, makes things hard for you, it’s talking. It’s telling you there is something important missing.",
  "The problems in the construction of objects are universal. You have to name classes, relate classes via inheritance and delegation, relate methods in the same class and different classes, name variables, and so on. Patterns record these problems and how to approach solving them.",
  "Keep all of the operations in a method at the same level of abstraction.",
  "Any time you are sending two or more messages from one object to another in a single method, you may be able to create a Composed Method in the receiver that combines those messages.",
  "There is probably no coding decision with more effect on the quality of your code than names you give your classes.",
  "The first thing readers will look at when they look at your code is the names of the classes. Those names will go beyond your code. Insidiously, they leak into everyday conversation—and not just for developers. Ten years down the road, you will hear users who know nothing about programming using the class names you chose.",
  "Unfortunately, many people get all formal when they go to name a superclass. Just calling it what it is isn’t enough. They have to tack on a flowery, computer science-y, impressive sounding, but ultimately meaningless word, like Object, Thing, Component, Part, Manager, Entity, or Item. You’re creating a vocabulary, not writing a program. Be a poet for a moment. The simple, the punchy, the easily remembered will be far more effective in the long run than some long name that says it all, but in such a way that no one wants to say it at all.",
  "Name a superclass with a single word that conveys its purpose in the design.",
  "if I am using inheritance strictly for code sharing, but the role of the subclass is different than the role of the superclass, I go back to Simple Superclass Name."
  ...
]

```

## Contributing

1. Fork it ( https://github.com/gauravmc/kindle_highlights_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
