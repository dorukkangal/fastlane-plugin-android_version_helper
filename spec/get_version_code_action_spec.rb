describe Fastlane::Actions::GetVersionCodeAction do
  describe 'Get Version Code' do
    it 'should return current version code' do
      result = Fastlane::Actions::GetVersionCodeAction.run(
        file_path: 'app/build.gradle',
        regex: Fastlane::Actions::GetVersionCodeAction::REGEX_VERSION_CODE
      )
      expect(result).to eq("10")
      expect(result).to eq(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_VERSION_CODE])
    end
  end
end
