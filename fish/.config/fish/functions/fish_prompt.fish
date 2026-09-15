function fish_prompt --description 'Minimal prompt: cwd, git branch, last status'
    set -l last_status $status
    set -l normal (set_color normal)

    # Only show user@host when it actually matters (remote or root)
    if set -q SSH_CONNECTION; or fish_is_root_user
        echo -n -s (set_color brblack) (prompt_login) $normal ' '
    end

    # Full path, no abbreviation
    echo -n -s (set_color $fish_color_cwd) (prompt_pwd --full-length-dirs=99 --dir-length=0) $normal

    # Branch name, with a single "*" if there are uncommitted changes
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_color_branch brblack
    set -g __fish_git_prompt_char_stateseparator ''
    set -g __fish_git_prompt_char_dirtystate '*'
    set -g __fish_git_prompt_char_stagedstate '*'
    set -g __fish_git_prompt_char_cleanstate ''
    echo -n -s (fish_git_prompt ' %s') $normal

    if test $last_status -ne 0
        echo -n -s ' ' (set_color $fish_color_status) "[$last_status]" $normal
    end

    set -l suffix '>'
    fish_is_root_user; and set suffix '#'
    echo -n -s ' ' $suffix ' '
end
