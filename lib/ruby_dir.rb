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
        `cd #{name} && rspec --init`
        `cd #{name} && mkdir config && touch config/environment.rb`
        `cd #{name} && echo "require 'bundler/setup'\nBundler.require\nrequire_rel '../app'" >> config/environment.rb`
        puts "created #{name}/config/environment.rb"
        `cd #{name} && echo 'require_relative "../config/environment.rb"' | cat - spec/spec_helper.rb > temp && mv temp spec/spec_helper.rb`
      end
    end
end
