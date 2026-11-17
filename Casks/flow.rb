# Install:  brew install --cask schachte/flow/flow
# Upgrade:  brew upgrade --cask flow
# Generated from macos/packaging/flow.rb in the Flow source repo by `make release`; edit it there.
cask "flow" do
  version "0.3.0"
  sha256 "444dd1fc73ef47c0a913ab819ec3734f85a1c276f7a78b7c908c12636cd2c423"

  url "https://github.com/Schachte/homebrew-flow/releases/download/v#{version}/Flow-#{version}.dmg"
  name "Flow"
  desc "Source-linked C4 architecture diagrams for a codebase"
  homepage "https://github.com/Schachte/homebrew-flow"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Flow.app"

  # ad-hoc signed, not notarized: clear Gatekeeper quarantine so the app opens
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Flow.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Contour",
    "~/Library/Application Support/Flow",
    "~/Library/Logs/Contour",
    "~/Library/Logs/Flow",
    "~/Library/Preferences/dev.contour.app.plist",
    "~/Library/Preferences/dev.flow.app.plist",
  ]

  caveats <<~EOS
    Flow's agent features use a coding-agent CLI you install and sign in to
    separately: Codex, pi or OpenCode (choose in Flow → Settings).

    Flow was called Contour before 0.3.0; it brings Contour's workspaces and
    settings over on first launch. Remove the old app with:
      brew uninstall --cask contour

    After an upgrade, quit and reopen Flow if it was running.
    If macOS still says "Flow Not Opened":
      xattr -dr com.apple.quarantine /Applications/Flow.app
  EOS
end
