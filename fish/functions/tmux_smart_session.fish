set prompt "switch to session:"

function get_z_result
    set select_result (zoxide query -l | peco --prompt $prompt)
    #if empty exit
    if test -z $select_result
        exit 0
    end
    echo $select_result
end

function try_to_get_in_session_list
    if test -z $argv
        return
    end
    set session_name $argv
    echo (tmux list-sessions | grep $session_name | awk '{print $1}')
end

function display
    if test -z $argv
        return
    end
    if test -z $TMUX
        echo $argv
    else
        tmux display $argv
    end

end

function t_not_active
    echo tmux is not active
    #save peco to variables
    set z_select_result $(get_z_result)
    set session_name (basename $z_select_result)
    #look for session
    if test -z $(try_to_get_in_session_list $session_name)
        # session does not exist
        display "creating session: $session_name"
        # jump to directory
        cd $z_select_result
        # create session
        tmux new-session -s $session_name
    else
        # session exists
        display "attach to exist session: $session_name"
        # attach to session
        tmux attach -t $session_name
    end
end

function t_active
        set z_select_result $(get_z_result)
        set session_name (basename $z_select_result)

        if test -z (try_to_get_in_session_list $session_name)
            display "Creating and swith to session: $session_name"
            cd $z_select_result
            # create session -d for default size -s for name
            tmux new-session -d -s $session_name
            # attach to session
            tmux switch-client -t $session_name
        else
            display "Switch to exists session: $session_name"
            # switch to tmux session
            tmux switch-client -t $session_name
        end
end

function tmux_smart_session

    if test -z $TMUX
        t_not_active
    else
        t_active
    end
end
