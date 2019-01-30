require "ruby_dir/version"

module RubyDir
  class Error < StandardError; end
  class Instruct
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def create_directory
        `mkdir #{name}`
        puts "created #{name}/"
        `cd #{name} && mkdir app`
        puts "created #{name}/app"
        `cd #{name} && bundle init`
        puts "created #{name}/Gemfile"
        `cd #{name} && echo '\ngem "rspec"\ngem "require_all"\ngem "pry"' >> Gemfile`
        puts "added pry and rspec to Gemfile"
        `cd #{name} && mkdir config && touch config/environment.rb`
        `cd #{name} && echo "require 'bundler/setup'\nBundler.require\nrequire_rel '../app'" >> config/environment.rb`
        puts "created #{name}/config/environment.rb"
        `cd #{name} && rspec --init`
        `cd #{name} && echo 'require_relative "../config/environment.rb"' | cat - spec/spec_helper.rb > temp && mv temp spec/spec_helper.rb`
        puts "created #{name}/rspec/spec_helper.rb"
        `cd #{name} && mkdir tools && touch tools/console.rb`
        `echo "require_relative '../config/environment.rb'\n\ndef reload\n  load 'config/environment.rb'\nend\n\n# Insert code here to run before hitting the binding.pry\n# This is a convenient place to define variables and/or set up new object instances,\n# so they will be available to test and play around with in your console\n\nbinding.pry\nputs 'goodbye'" >> #{name}/tools/console.rb`
        puts "created #{name}/tools/console.rb"
        `cd #{name} && bundle`
      end
    end
end
