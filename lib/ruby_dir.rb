require "ruby_dir/version"

module RubyDir
  class Error < StandardError; end
  class Instruct
      def create_directory
        puts "creating directory!"
      end
    end
end
