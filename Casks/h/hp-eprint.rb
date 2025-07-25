cask "hp-eprint" do
  version "2.5.0"
  sha256 "cba1598dc5d03fbf28fa649dafca5cd251f273066cc3a050966834a73ba66c3e"

  url "https://ftp.hp.com/pub/softlib/software13/COL43009/ds-104730-8/HP-ePrint_v#{version}.dmg"
  name "HP ePrint"
  desc "Mobile printing solution"
  homepage "https://h20331.www2.hp.com/hpsub/us/en/eprint/overview.html"

  no_autobump! because: :requires_manual_review

  disable! date: "2024-12-16", because: :discontinued

  pkg "HP ePrint Installer.pkg"

  uninstall pkgutil: "com.hp.pkg.cloudprint.HP-ePrint-Mobile"

  zap trash: [
    "~/Library/Containers/com.hp.cloudprint.HP-ePrint-Mobile",
    "~/Library/PDF Services/HP ePrint",
  ]
end
