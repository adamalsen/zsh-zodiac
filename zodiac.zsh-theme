ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "
ZSH_THEME_SVN_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_SVN_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_SVN_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_SVN_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN
ZSH_THEME_HG_PROMPT_PREFIX=$ZSH_THEME_GIT_PROMPT_PREFIX
ZSH_THEME_HG_PROMPT_SUFFIX=$ZSH_THEME_GIT_PROMPT_SUFFIX
ZSH_THEME_HG_PROMPT_DIRTY=$ZSH_THEME_GIT_PROMPT_DIRTY
ZSH_THEME_HG_PROMPT_CLEAN=$ZSH_THEME_GIT_PROMPT_CLEAN

vcs_status() {
    if [[ $(whence in_svn) != "" ]] && in_svn; then
        svn_prompt_info
    elif [[ $(whence in_hg) != "" ]] && in_hg; then
        hg_prompt_info
    else
        git_prompt_info
    fi
}

zodiac() {
    year=$(date +%Y)
    let "cycle = $year - 1983"
    let "lny = $cycle % 12"

    if [ $lny -eq 1 ]; then
       echo "🐭"
    elif [ $lny -eq 2 ]; then
       echo "🐮"
    elif [ $lny -eq 3 ]; then
       echo "🐯"
    elif [ $lny -eq 4 ]; then
       echo "🐰"
    elif [ $lny -eq 5 ]; then
       echo "🐲"
    elif [ $lny -eq 6 ]; then
       echo "🐍"
    elif [ $lny -eq 7 ]; then
       echo "🐴"
    elif [ $lny -eq 8 ]; then
       echo "🐏"
    elif [ $lny -eq 9 ]; then
       echo "🐵"
    elif [ $lny -eq 10 ]; then
       echo "🐔"
    elif [ $lny -eq 11 ]; then
       echo "🐶"
    elif [ $lny -eq 12 ]; then
       echo "🐷"
    else
       echo "🐼"
    fi
}

PROMPT='$(zodiac) %F{green}%2/%f $(vcs_status)$ '
