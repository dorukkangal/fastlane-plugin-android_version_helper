require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?(:UI)

  module Helper
    class AndroidVersionHelperHelper
      def self.find_in_file(file_path, regex)
        UI.user_error!("Could not find the file '#{file_path}'") unless File.exist?(file_path)

        content = File.readlines(file_path)
        captures = nil
        found = false
        line_index = nil

        content.each_with_index do |line, index|
          unless line.match(regex) && !found
            next
          end

          captures = line.match(regex)&.captures
          found = true
          line_index = index
          break
        end

        if found
          UI.message("#{captures[0]} was found in file '#{file_path}' on line #{line_index}")
        else
          UI.message("No line matched with regex '#{regex.inspect}' in file '#{file_path}'")
        end

        return captures&.at(0), line_index, content
      end

      def self.replace_in_file(file_path, regex, replacement)
        value, line_index, content = find_in_file(file_path, regex)
        unless line_index.nil?
          content[line_index] = content[line_index].sub(value, replacement.to_s)
          File.write(file_path, content.join)
          UI.message("#{value} was replaced with #{replacement} in file '#{file_path}' on line #{line_index}")
        end

        return replacement.to_s, line_index, content
      end
    end
  end
end
