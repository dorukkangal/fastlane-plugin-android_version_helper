describe Fastlane::Actions::SetVersionNameAction do
  describe 'Set Version Name' do
    it 'should set version name and return its new value' do
      result = Fastlane::Actions::SetVersionNameAction.run(
        file_path: 'app/build.gradle',
        regex: Fastlane::Actions::SetVersionNameAction::REGEX_VERSION_NAME,
        version_name: '1.2.0'
      )
      expect(result).to eq('1.2.0')
      expect(result).to eq(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_VERSION_NAME])
    end
  end
end
