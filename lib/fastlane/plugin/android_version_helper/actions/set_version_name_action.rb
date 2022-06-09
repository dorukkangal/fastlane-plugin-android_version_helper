require_relative 'internal/base_action'
require_relative '../helper/android_version_helper_helper'

module Fastlane
  module Actions
    class SetVersionNameAction < BaseAction
      def self.run(params)
        UI.message('Setting version name!')
        value, _line_index, _content = replace_in_file(params[:file_path], params[:regex], params[:version_name])
        Actions.lane_context[SharedValues::ANDROID_VERSION_NAME] = value
        return value
      end

      def self.other_options
        [
          FastlaneCore::ConfigItem.new(
            key: :regex,
            env_name: 'ANDROID_VERSION_HELPER_VERSION_NAME_REGEX',
            description: 'Specifies the regex to find the line where the version name is specified',
            optional: true,
            type: Regexp,
            default_value: REGEX_VERSION_NAME
          ),
          FastlaneCore::ConfigItem.new(
            key: :version_name,
            env_name: 'ANDROID_VERSION_HELPER_NEW_VERSION_NAME',
            description: 'Specifies the new version name',
            optional: false,
            type: String
          )
        ]
      end

      def self.description
        'Sets your App version name'
      end

      def self.details
        'This action sets a new version name and returns it'
      end

      def self.return_value
        'The new version name of your App'
      end
    end
  end
end
