# credited to shashankmehta (https://github.com/shashankmehta), copied over from pi (https://github.com/tobyjamesthomas/pi)
function get_pwd() {
  git_root=$PWD

  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done

  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi

  echo $prompt_short_dir
}

local return_status="%(?:%{$fg_bold[green]%}λ:%{$fg_bold[red]%}λ)"
local prompt_suffix="%{$fg[magenta]%}❯%{$reset_color%} "
local git_user="%{$fg_bold[yellow]($(git_current_user_email))"
local git_user_prompt="%{$fg_bold[red]($(git_current_user_name))"

PROMPT=' ${return_status} %{$fg[blue]%}$(get_pwd)%{$reset_color%} $(git_prompt_info) %{$fg_bold[yellow]($(git_current_user_name)) ${prompt_suffix}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

