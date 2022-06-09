describe Fastlane::Actions::SetVersionCodeAction do
  describe 'Set Version Name' do
    it 'should set version code and return its new value' do
      result = Fastlane::Actions::SetVersionCodeAction.run(
        file_path: 'app/build.gradle',
        regex: Fastlane::Actions::SetVersionCodeAction::REGEX_VERSION_CODE,
        version_code: 11
      )
      expect(result).to eq("11")
      expect(result).to eq(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_VERSION_CODE])
    end
  end
end
