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
        `cd #{name}/app && mkdir models`
        puts "created #{name}/app/models"
        `touch #{name}/app/run.rb`
        `echo "class App\n\n  def self.run\n    # Your code here...\n  end\n\nend" >> #{name}/app/run.rb`
        puts "created #{name}/app/run.rb"
        `cd #{name} && bundle init`
        puts "created #{name}/Gemfile"
        `cd #{name} && echo '\ngem "rspec"\ngem "require_all"\ngem "pry"' >> Gemfile`
        puts "added pry and rspec to Gemfile"
        `cd #{name} && mkdir config && touch config/environment.rb`
        `cd #{name} && echo "require 'bundler/setup'\nBundler.require\nrequire_rel '../app'" >> config/environment.rb`
        puts "created #{name}/config/environment.rb"
        `cd #{name} && rspec --init`
        `cd #{name} && echo 'require_relative "../config/environment.rb"' | cat - spec/spec_helper.rb > temp && mv temp spec/spec_helper.rb`
        puts "created #{name}/spec/spec_helper.rb"
        `cd #{name} && touch spec/#{name}_spec.rb`
        `echo "describe "App.run" do\n  it 'executes successfully without errors' do\n    expect{App.run}.to_not raise_error\n  end\nend" >> #{name}/spec/#{name}_spec.rb`
        puts "created #{name}/spec/#{name}_spec.rb"
        `cd #{name} && mkdir tools && touch tools/console.rb`
        `echo "require_relative '../config/environment.rb'\n\ndef reload\n  load 'config/environment.rb'\nend\n\n# Insert code here to run before hitting the binding.pry\n# This is a convenient place to define variables and/or set up new object instances,\n# so they will be available to test and play around with in your console\n\nbinding.pry\nputs 'goodbye'" >> #{name}/tools/console.rb`
        puts "created #{name}/tools/console.rb"
        `cd #{name} && bundle`
      end
    end
end
