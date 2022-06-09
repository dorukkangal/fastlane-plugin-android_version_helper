require 'fastlane/action'
require_relative '../../helper/android_version_helper_helper'

module Fastlane
  module Actions
    module SharedValues
      ANDROID_VERSION_NAME = :ANDROID_VERSION_NAME
      ANDROID_VERSION_CODE = :ANDROID_VERSION_CODE
    end

    class BaseAction < Action
      REGEX_VERSION_NAME = /versionName '(\d+\.\d+\.\d+)'/
      REGEX_VERSION_CODE = /versionCode (\d+)/

      def self.authors
        ['oruk Kangal']
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :file_path,
            env_name: 'ANDROID_VERSION_HELPER_VERSION_FILE',
            description: 'Specify the file path containing the version code. e.g:app/build.gradle.kts',
            optional: true,
            type: String,
            default_value: 'app/build.gradle'
          )
        ] + other_options
      end

      def self.other_options
        []
      end

      def self.find_in_file(file_path, regex)
        Helper::AndroidVersionHelperHelper.find_in_file(file_path, regex)
      end

      def self.replace_in_file(file_path, regex, replacement)
        Helper::AndroidVersionHelperHelper.replace_in_file(file_path, regex, replacement)
      end

      def self.is_supported?(platform)
        platform == :android
      end
    end
  end
end
