cask "mono-mdk-for-visual-studio" do
  version "6.12.0.205"
  sha256 "c56f386eeff8e28898313fea97e09af078f8fcefaeb7af1bf69e4261f643cd88"

  url "https://download.mono-project.com/archive/#{version.major_minor_patch}/macos-10-universal/MonoFramework-MDK-#{version}.macos10.xamarin.universal.pkg"
  name "Mono"
  desc "Open source implementation of Microsoft's .NET Framework"
  homepage "https://www.mono-project.com/"

  # The stable version is that listed on the download page. See:
  #   https://github.com/Homebrew/homebrew-cask-versions/pull/12974
  livecheck do
    url "https://www.mono-project.com/download/preview/"
    regex(/MonoFramework-MDK-(\d+(?:\.\d+)+).macos10.xamarin.universal\.pkg/i)
  end

  conflicts_with cask:    "mono-mdk",
                 formula: "mono"

  pkg "MonoFramework-MDK-#{version}.macos10.xamarin.universal.pkg"

  uninstall delete:  [
              "/Library/Frameworks/Mono.framework/Versions/#{version.major_minor_patch}",
              "/private/etc/paths.d/mono-commands",
            ],
            pkgutil: "com.xamarin.mono-*",
            rmdir:   [
              "/Library/Frameworks/Mono.framework/Versions",
              "/Library/Frameworks/Mono.framework",
            ]

  zap trash:  [
        "~/.mono",
        "~/Library/Caches/com.xamarin.fontconfig",
      ],
      delete: "~/Library/Preferences/mono-sgen64.plist"

  caveats <<~EOS
    This is a version specific for Visual Studio users. This cask should follow the specific Visual Studio channel/branch maintained by mono developers.

    Installing #{token} removes mono and mono dependant formula binaries in
    /usr/local/bin and adds #{token} to /private/etc/paths.d/
    You may want to:

      brew unlink {formula} && brew link {formula}

    and/or remove /private/etc/paths.d/mono-commands
  EOS
end
