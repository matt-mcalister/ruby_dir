# RubyDir

This gem allows you to generate an extremely barebones ruby repository.
The repository includes the basics needed for a ruby sandbox.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_dir'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_dir

## Usage

Once installed, run `ruby_dir NAME`, where `NAME` is the name of the repo you
would like to generate.

Here are the files that are generated when you run `ruby_dir blackjack`:

```
blackjack/
  ├── app/                      
  │   ├── models/
  │   └── run.rb              # this file contains an empty App class
  ├── config/
  │   └── environment.rb      # this file handles bundling your gems and local files
  ├── spec/
  │   ├── blackjack_spec.rb   # this file contains one test as a template
  │   └── spec_helper.rb
  ├── tools/
  │   └── console.rb          # this file contains starter code for a basic console
  ├── .rspec                   
  └── Gemfile                 # included gems are rspec, require_all, and pry
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matt-mcalister/ruby_dir.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
