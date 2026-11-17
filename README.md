# Contour for Homebrew

Contour turns a source folder into source-linked C4 architecture diagrams on macOS (Apple silicon, macOS 15+).

## Install

```sh
brew install --cask schachte/contour/contour
```

That one command adds this tap and trusts only the `contour` cask (Homebrew 6+ asks you to trust non-official taps).

## Upgrade

```sh
brew upgrade --cask contour
```

Quit and reopen Contour afterwards if it was running.

## Uninstall

```sh
brew uninstall --cask contour         # the app
brew uninstall --cask --zap contour   # also workspaces, logs and settings
```

## Notes

- Builds are ad-hoc signed and not notarized. The cask clears the Gatekeeper quarantine flag after installing so the app opens; if macOS still blocks it, run `xattr -dr com.apple.quarantine /Applications/Contour.app`.
- Agent features use a coding-agent CLI you install and sign in to separately: Codex, pi or OpenCode.
- Each release's DMG is attached to this repository's [releases](https://github.com/Schachte/homebrew-contour/releases).
