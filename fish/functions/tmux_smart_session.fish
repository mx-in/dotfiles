set prompt "switch to session:"

function get_z_result
        set select_result (zoxide query -l | peco --prompt $prompt)
        #if empty exit
        if test -z $select_result
            exit 0
        end
        echo $select_result
end

function t_not_active
        echo tmux is not active
        #save peco to variables
        set z_select_result $(get_z_result)
        
        set folder (basename $z_select_result)
        #lookup tmux session name
        set session (tmux list-sessions | grep $folder | awk '{print $1}')
        echo $session
        set session (string replace : '' $session)

        breakpoint

        if test -z $session
            # session does not exist
            echo "session does not exist"
            # jump to directory
            cd $z_select_result
            # create session
            tmux new-session -s $folder
        else
            # session exists
            echo "session exists"
            # attach to session
            tmux attach -t $session
        end
end

function t_active
        echo "tmux is active"
        set z_select_result $(get_z_result)

        set folder (basename $z_select_result)

        #lookup tmux session name
        set session (tmux list-sessions | grep $folder | awk '{print $1}')
        set session (string replace : '' $session)

        if test -z $session
            # session does not exist
            echo "session does not exist"
            # jump to directory
            cd $z_select_result
            # create session
            tmux new-session -d -s $folder
            # attach to session
            tmux switch-client -t $folder
        else
            # session exists
            echo "session exists"
            # attach to session
            # switch to tmux session
            tmux switch-client -t $session
        end
end

function tmux_smart_session
    #if not currently in tmux
    set prompt "Switch to Session: "
    if test -z $TMUX
        t_not_active
    else
        t_active
    end
end
