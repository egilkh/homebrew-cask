cask "gog-galaxy" do
  version "2.0.44.200"
  sha256 "621123325ab8a26e6352fd9fa86fb850c1f2679cf8c1ddd1b83c9712eef1f96b"

  url "https://cdn.gog.com/open/galaxy/client/#{version.chomp("a")}/galaxy_client_#{version}.pkg"
  name "GOG Galaxy"
  desc "Game client"
  homepage "https://www.gog.com/galaxy"

  livecheck do
    url :homepage
    regex(%r{href=.*?/galaxy_client_(\d+(?:\.\d+)*a?)\.pkg}i)
  end

  auto_updates true

  pkg "galaxy_client_#{version}.pkg"

  uninstall delete:    "/Applications/GOG Galaxy.app",
            launchctl: [
              "com.gog.galaxy.autoLauncher",
              "com.gog.galaxy.ClientService",
              "com.gog.galaxy.commservice",
            ]

  zap trash: [
    "/Library/LaunchDaemons/com.gog.galaxy.ClientService.plist",
    "/Library/PrivilegedHelperTools/com.gog.galaxy.ClientService",
    "/Users/Shared/GOG.com",
    "~/Library/Application Support/GOG.com",
    "~/Library/Preferences/com.gog.galaxy.cef.renderer.plist",
    "~/Library/Preferences/com.gog.galaxy.plist",
    "~/Library/Saved Application State/com.gog.galaxy.savedState",
  ]
end
