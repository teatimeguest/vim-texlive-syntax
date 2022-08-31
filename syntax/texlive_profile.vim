if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syntax iskeyword @,-,48-57,_,192-255

syntax keyword texliveProfileBoolean 0 1
  \ contained
  \ skipwhite
  \ nextgroup=
  \   texliveProfileComment,
  \   texliveProfileInvalidArgument

syntax keyword texliveProfileTodo TODO FIXME XXX contained

syntax region texliveProfileComment
  \ display
  \ start='\s*#' end='$'
  \ contains=texliveProfileTodo,@Spell
  \ keepend oneline

syntax region texliveProfileInvalidOption
  \ display
  \ start='\<[^[:space:]#]\+[[:space:]#]' end='$'
  \ contains=texliveProfileComment
  \ keepend oneline

syntax region texliveProfileInvalidArgument
  \ display
  \ contained
  \ start='\S' end='$'
  \ contains=texliveProfileComment
  \ keepend oneline

syntax region texliveProfileMissingArgument
  \ display
  \ contained
  \ start='#' end='$'
  \ keepend oneline

syntax keyword texliveProfileSchemeOption selected_scheme
  \ skipwhite
  \ nextgroup=
  \   texliveProfileScheme,
  \   texliveProfileMissingArgument

syntax match texliveProfileScheme
  \ display
  \ contained
  \ '\<\K\k*\>'
  \ skipwhite
  \ nextgroup=
  \   texliveProfileComment,
  \   texliveProfileInvalidArgument

syntax match texliveProfileCollection
  \ display
  \ '\<collection-\k\+\>'
  \ skipwhite
  \ nextgroup=
  \   texliveProfileComment,
  \   texliveProfileInvalidArgument

syntax keyword texliveProfilePathOption
  \ TEXDIR
  \ TEXMFLOCAL
  \ TEXMFSYSCONFIG
  \ TEXMFSYSVAR
  \ TEXMFCONFIG
  \ TEXMFVAR
  \ TEXMFHOME
  \ skipwhite
  \ nextgroup=
  \   texliveProfilePath,
  \   texliveProfileMissingArgument

syntax region texliveProfilePath
  \ display
  \ contained
  \ start='[^[:space:]#]' end='$'
  \ contains=texliveProfileComment
  \ keepend oneline

syntax match texliveProfilePlatformOption
  \ display
  \ '\<binary_\k\+\>'
  \ skipwhite
  \ nextgroup=
  \   texliveProfileBoolean,
  \   texliveProfileMissingArgument,
  \   texliveProfileInvalidArgument

syntax keyword texliveProfileInstallerOption
  \ instopt_adjustpath
  \ instopt_adjustrepo
  \ instopt_letter
  \ instopt_portable
  \ instopt_write18_restricted
  \ skipwhite
  \ nextgroup=
  \   texliveProfileBoolean,
  \   texliveProfileMissingArgument,
  \   texliveProfileInvalidArgument

syntax keyword texliveProfileTlpdbOption
  \ tlpdbopt_create_formats
  \ tlpdbopt_generate_updmap
  \ tlpdbopt_install_docfiles
  \ tlpdbopt_install_srcfiles
  \ tlpdbopt_post_code
  \ skipwhite
  \ nextgroup=
  \   texliveProfileBoolean,
  \   texliveProfileMissingArgument,
  \   texliveProfileInvalidArgument

syntax keyword texliveProfileTlpdbOption tlpdbopt_autobackup
  \ skipwhite
  \ nextgroup=
  \   texliveProfileNumberOfBackups,
  \   texliveProfileMissingArgument,
  \   texliveProfileInvalidArgument

syntax match texliveProfileNumberOfBackups
  \ display
  \ contained
  \ '\<\%(-1\|\d\+\)\>'
  \ skipwhite
  \ nextgroup=
  \   texliveProfileComment,
  \   texliveProfileInvalidArgument

syntax keyword texliveProfileTlpdbOption
  \ tlpdbopt_backupdir
  \ tlpdbopt_sys_bin
  \ tlpdbopt_sys_info
  \ tlpdbopt_sys_man
  \ skipwhite
  \ nextgroup=
  \   texliveProfilePath,
  \   texliveProfileMissingArgument

if !get(g:, 'texlive_profile_disable_windows_only_options', 0)
  syntax keyword texliveProfileTlpdbOption
    \ tlpdbopt_desktop_integration
    \ tlpdbopt_w32_multi_user
    \ skipwhite
    \ nextgroup=
    \   texliveProfileBoolean,
    \   texliveProfileMissingArgument,
    \   texliveProfileInvalidArgument

  syntax keyword texliveProfileTlpdbOption tlpdbopt_file_assocs
    \ skipwhite
    \ nextgroup=
    \   texliveProfileFileassocMode,
    \   texliveProfileMissingArgument,
    \   texliveProfileInvalidArgument

  syntax keyword texliveProfileFileassocMode 0 1 2
    \ contained
    \ skipwhite
    \ nextgroup=
    \   texliveProfileComment,
    \   texliveProfileInvalidArgument
endif

if !get(g:, 'texlive_profile_disable_legacy_options', 0)
  syntax keyword texliveProfileLegacyOption
    \ option_doc
    \ option_fmt
    \ option_src
    \ option_post_code
    \ option_adjustrepo
    \ option_letter
    \ option_path
    \ option_symlinks
    \ portable
    \ option_write18_restricted
    \ skipwhite
    \ nextgroup=
    \   texliveProfileBoolean,
    \   texliveProfileMissingArgument,
    \   texliveProfileInvalidArgument

  syntax keyword texliveProfileLegacyOption option_autobackup
    \ skipwhite
    \ nextgroup=
    \   texliveProfileNumberOfBackups,
    \   texliveProfileMissingArgument,
    \   texliveProfileInvalidArgument

  syntax keyword texliveProfileLegacyOption
    \ option_backupdir
    \ option_sys_bin
    \ option_sys_info
    \ option_sys_man
    \ skipwhite
    \ nextgroup=
    \   texliveProfilePath,
    \   texliveProfileMissingArgument

  if !get(g:, 'texlive_profile_disable_ignored_optinos', 0)
    syntax keyword texliveProfileIgnoredOption in_place
      \ skipwhite
      \ nextgroup=
      \   texliveProfileBoolean,
      \   texliveProfileMissingArgument,
      \   texliveProfileInvalidArgument
  endif

  if !get(g:, 'texlive_profile_disable_windows_only_options', 0)
    syntax keyword texliveProfileLegacyOption
      \ option_desktop_integration
      \ option_w32_multi_user
      \ skipwhite
      \ nextgroup=
      \   texliveProfileBoolean,
      \   texliveProfileMissingArgument,
      \   texliveProfileInvalidArgument

    syntax keyword texliveProfileLegacyOption option_file_assocs
      \ skipwhite
      \ nextgroup=
      \   texliveProfileFileassocMode,
      \   texliveProfileMissingArgument,
      \   texliveProfileInvalidArgument

    if !get(g:, 'texlive_profile_disable_ignored_optinos', 0)
      syntax keyword texliveProfileIgnoredOption option_menu_integration
        \ skipwhite
        \ nextgroup=
        \   texliveProfileBoolean,
        \   texliveProfileMissingArgument,
        \   texliveProfileInvalidArgument
    endif
  endif
endif

highlight def link texliveProfileInvalidOption texliveProfileError
highlight def link texliveProfileMissingArgument texliveProfileError
highlight def link texliveProfileInvalidArgument texliveProfileError

highlight def link texliveProfileSchemeOption texliveProfileOption
highlight def link texliveProfileInstallerOption texliveProfileOption
highlight def link texliveProfileTlpdbOption texliveProfileOption
highlight def link texliveProfileLegacyOption texliveProfileOption

highlight def link texliveProfileBoolean Boolean
highlight def link texliveProfileTodo Todo
highlight def link texliveProfileComment Comment
highlight def link texliveProfileError Error
highlight def link texliveProfileScheme Type
highlight def link texliveProfileCollection Type
highlight def link texliveProfilePath String
highlight def link texliveProfileNumberOfBackups Number
highlight def link texliveProfileFileassocMode Constant
highlight def link texliveProfileOption Statement
highlight def link texliveProfilePathOption Define
highlight def link texliveProfilePlatformOption Identifier
highlight def link texliveProfileIgnoredOption Comment

let b:current_syntax = 'texlive_profile'
