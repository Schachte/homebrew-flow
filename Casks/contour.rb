# Install:  brew install --cask schachte/contour/contour
# Upgrade:  brew upgrade --cask contour
# Updated by macos/scripts/release.sh in the Contour source repo on each release.
cask "contour" do
  version "0.2.3"
  sha256 "618435313676602fae4b67d21ec795b44e70c43953003b134ffb2bad42d1be5d"

  url "https://github.com/Schachte/homebrew-contour/releases/download/v#{version}/Contour-#{version}.dmg"
  name "Contour"
  desc "Source-linked C4 architecture diagrams for a codebase"
  homepage "https://github.com/Schachte/homebrew-contour"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Contour.app"

  # ad-hoc signed, not notarized: clear Gatekeeper quarantine so the app opens
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Contour.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Contour",
    "~/Library/Logs/Contour",
    "~/Library/Preferences/dev.contour.app.plist",
  ]

  caveats <<~EOS
    Contour's agent features use a coding-agent CLI you install and sign in to
    separately: Codex, pi or OpenCode (choose in Contour → Settings).

    After an upgrade, quit and reopen Contour if it was running.
    If macOS still says "Contour Not Opened":
      xattr -dr com.apple.quarantine /Applications/Contour.app
  EOS
end
