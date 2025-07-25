cask "pock" do
  version "0.9.0-22"
  sha256 "c190b719a4ecd98680fcea6a8095432012a2b9e0067adac9d4e7b2c92dc8ca6b"

  url "https://pock.app/builds/pock_#{version.dots_to_underscores.gsub("-", "__")}.zip"
  name "Pock"
  desc "Utility to display the Dock in the Touch Bar"
  homepage "https://pock.app/"

  livecheck do
    url "https://pock.app/api/latestVersions.json"
    strategy :json do |json|
      json.dig("core", "name")
    end
  end

  no_autobump! because: :requires_manual_review

  depends_on macos: ">= :catalina"

  app "Pock.app"

  zap trash: [
    "~/Library/Application Scripts/com.pigigaldi.pock.QLPockWidget",
    "~/Library/Application Support/com.pigigaldi.pock",
    "~/Library/Application Support/Pock",
    "~/Library/Caches/com.pigigaldi.pock",
    "~/Library/Containers/com.pigigaldi.pock.QLPockWidget",
    "~/Library/Preferences/com.pigigaldi.pock.plist",
  ]
end
