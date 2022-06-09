describe Fastlane::Actions::GetVersionNameAction do
  describe 'Get Version Name' do
    it 'should return current version name' do
      result = Fastlane::Actions::GetVersionNameAction.run(
        file_path: 'app/build.gradle',
        regex: Fastlane::Actions::GetVersionNameAction::REGEX_VERSION_NAME
      )
      expect(result).to eq('1.1.0')
      expect(result).to eq(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_VERSION_NAME])
    end
  end
end
