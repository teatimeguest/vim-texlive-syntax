# vim-texlive-syntax

> A Vim syntax plugin for TeX Live-related files,
> such as [texlive.profile][texlive-profile] and [DEPENDS.txt][depends-txt]

[![CI][ci-badge]][ci]

## Options

Some highlights for installation profiles can be disabled by options:

- ```vim
  let g:texlive_profile_disable_legacy_options = 1
  ```

  Disable highlighting of legacy options, such as `option_doc` and `portable`.
  This implies `g:texlive_profile_disable_ignored_options = 1`.

- ```vim
  let g:texlive_profile_disable_ignored_options = 1
  ```

  Disable highlighting of ignored options,
  such as `option_menu_integration` and `in_place`.

- ```vim
  let g:texlive_profile_disable_windows_only_options = 1
  ```

  Disable highlighting of Windows-only options,
  such as `tlpdbopt_desktop_integration` and `option_w32_multi_user`.

## License

[MIT License](./LICENSE)

[ci]: https://github.com/teatimeguest/vim-texlive-syntax/actions/workflows/ci.yml
[ci-badge]: https://github.com/teatimeguest/vim-texlive-syntax/actions/workflows/ci.yml/badge.svg?branch=main
[depends-txt]: https://tug.org/texlive/pkgcontrib.html#deps
[texlive-profile]: https://tug.org/texlive/doc/install-tl.html#PROFILES
