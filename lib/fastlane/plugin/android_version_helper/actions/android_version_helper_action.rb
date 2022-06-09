require 'fastlane/action'
require_relative '../helper/android_version_helper_helper'

module Fastlane
  module Actions
    class AndroidVersionHelperAction < Action
      def self.run(params)
        UI.message("The android_version_helper plugin is working!")
      end

      def self.description
        "An easy way to manage your Android app version name and code"
      end

      def self.authors
        ["Doruk Kangal"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "This plugin enables you to more easily manage Android app versioning with fastlane"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "ANDROID_VERSION_HELPER_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
