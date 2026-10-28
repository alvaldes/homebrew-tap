# alvaldes/tap

Homebrew casks for the macOS apps by [@alvaldes](https://github.com/alvaldes).

## Install

Install any app by its full name. Homebrew adds the tap on the first install.

```sh
brew install --cask alvaldes/tap/<app>
```

## Apps

| App | What it does | Install |
| --- | --- | --- |
| [Netty](https://github.com/alvaldes/netty) | Shows in the menu bar whether your internet connection really works. | `brew install --cask alvaldes/tap/netty` |
| [JUMP](https://github.com/alvaldes/jump) | Click anything on screen from the keyboard with short labels. | `brew install --cask alvaldes/tap/jump` |

Upgrade them with `brew upgrade --cask`.

## First launch

These apps aren't notarized by Apple yet, so macOS blocks each one the first
time it opens. Open System Settings › Privacy & Security and choose
**Open Anyway**.

## Adding an app

Add `Casks/<app>.rb` and a row to the table above. Each app's release script
updates its cask's `version` and `sha256` when it uploads a new release.
