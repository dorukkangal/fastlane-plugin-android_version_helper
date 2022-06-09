describe Fastlane::Actions::AndroidVersionHelperAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The android_version_helper plugin is working!")

      Fastlane::Actions::AndroidVersionHelperAction.run(nil)
    end
  end
end
