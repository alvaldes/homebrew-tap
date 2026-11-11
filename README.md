# alvaldes/tap

Homebrew casks and formulas for the software by [@alvaldes](https://github.com/alvaldes).

## Casks

Install any app by its full name. Homebrew adds the tap on the first install.

```sh
brew install --cask alvaldes/tap/<app>
```

| App | What it does | Install |
| --- | --- | --- |
| [Netty](https://github.com/alvaldes/netty) | Shows in the menu bar whether your internet connection really works. | `brew install --cask alvaldes/tap/netty` |
| [JUMP](https://github.com/alvaldes/jump) | Click anything on screen from the keyboard with short labels. | `brew install --cask alvaldes/tap/jump` |

Upgrade them with `brew upgrade --cask`.

### First launch

These apps aren't notarized by Apple yet, so macOS blocks each one the first
time it opens. Open System Settings › Privacy & Security and choose
**Open Anyway**.

## Formulas

```sh
brew install alvaldes/tap/<formula>
```

| Formula | What it does | Install |
| --- | --- | --- |
| [velo](https://alvaldes.github.io/velo/) | Terminal music player in one binary: gapless, radio, no daemon. | `brew install alvaldes/tap/velo` |

That installs the release binary CI built for your machine — macOS or Linux,
arm64 or x86_64 — checked against the sha256 published beside it.
`brew upgrade velo` moves to the next release.

### How velo's formula stays current

`Formula/velo.rb` is written by `update.sh` from the checksums of a velo
release, and a workflow runs it every ten minutes: when a release has all four
archives, the formula follows it. To do it by hand:

```sh
./update.sh            # the latest release
./update.sh v0.50.0    # a tag
```

## Adding a cask

Add `Casks/<app>.rb` and a row to the table above. Each app's release script
updates its cask's `version` and `sha256` when it uploads a new release.
