require_relative 'internal/base_action'
require_relative '../helper/android_version_helper_helper'

module Fastlane
  module Actions
    class SetVersionCodeAction < BaseAction
      def self.run(params)
        UI.message('Setting version code!')
        value, _line_index, _content = replace_in_file(params[:file_path], params[:regex], params[:version_code])
        Actions.lane_context[SharedValues::ANDROID_VERSION_CODE] = value
        return value
      end

      def self.other_options
        [
          FastlaneCore::ConfigItem.new(
            key: :regex,
            env_name: 'ANDROID_VERSION_HELPER_VERSION_CODE_REGEX',
            description: 'Specifies the regex to find the line where the version code is specified',
            optional: true,
            type: Regexp,
            default_value: REGEX_VERSION_CODE
          ),
          FastlaneCore::ConfigItem.new(
            key: :version_code,
            env_name: 'ANDROID_VERSION_HELPER_NEW_VERSION_CODE',
            description: 'Specifies the new version code',
            optional: false,
            type: Integer
          )
        ]
      end

      def self.description
        'Sets your App version code'
      end

      def self.details
        'This action sets a new version code and returns it'
      end

      def self.return_value
        'The new version code of your App'
      end
    end
  end
end
