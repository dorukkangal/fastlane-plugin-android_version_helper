require_relative 'base_action'
require_relative '../helper/android_version_helper_helper'

module Fastlane
  module Actions
    class GetVersionCodeAction < BaseAction
      def self.run(params)
        UI.message('Getting version code!')
        value, _line_index, _content = find_in_file(params[:file_path], params[:regex])
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
          )
        ]
      end

      def self.description
        'Gets your App version code'
      end

      def self.details
        'This action returns your App current version code'
      end

      def self.return_value
        'The version code of your App'
      end
    end
  end
end
