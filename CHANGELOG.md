# Changelog

## 0.4.0 - 2020-09-10
### Added
- Emacs styles for TSDoc, `debbugs`, `diredfl`, `git-gutter`,
  `pdf-view-midnight-colors`, `popup`, `swiper`, and `tab-bar-mode`.
- Vim style for the current quickfix line.

### Changed
- The active status bar is now gray.
- Shell messages in Emacs' `shell-mode` are no longer colored.
- Region no longer extends to the end of the line in Emacs 27.
- Ported Emacs theme to [autothemer](https://github.com/jasonm23/autothemer).

### Fixed
- Keep constant line height for boxed Emacs faces.

## 0.3.0 - 2020-01-13
### Added
- Emacs support for `solaire-mode`. Make sure to run
  `solaire-mode-swap-bg` for good results.
- Emacs styles for `emms`, `magit`, `transient`, Org, Clojure, JavaScript,
  HTML, and CSS.

## 0.2.2 - 2019-04-22
### Added
- Emacs styles for `geiser`, `guix`, and shell `heredocs`.

### Changed
- The `style-theme` macro is now `parchment-style-theme`.

## 0.2.1 - 2019-04-08
### Added
- A few Emacs styles for `evil`, `org`, and `eww`.

### Fixed
- Explicitly depend on Emacs 24.
- Make `package-lint` happier with the Emacs theme.

## 0.2.0 - 2019-04-06
### Added
- New Emacs theme.
- Vim styles for git, tmux, org, email, roff, reStructuredText.
- Styles for embedded terminal colors in Neovim and Vim 8.

### Changed
- Types are now highlighted in blue rather than the default text color.

## 0.1.0 - 2017-10-25
### Added
- Initial release of original vim theme.
