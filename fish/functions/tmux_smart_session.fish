function tmux_smart_session
    #if not currently in tmux
    set prompt "Switch to Session: "
    if test -z $TMUX
        echo tmux is not active
        #save peco to variables
        set z_select_result (zoxide query -l | peco --prompt $prompt)
        echo z_select_result: $z_select_result

        #if empty exit
        if test -z $z_select_result
            exit 0
        end

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
            tmux new-session -s $folder
        else
            # session exists
            echo "session exists"
            # attach to session
            tmux attach -t $session
        end
    else
        #tmux is active
        echo "is tmux"
        #save peco to variables
        set z_select_result (zoxide query -l | peco --prompt $prompt)
        #if no result exit
        echo z_select_result: $z_select_result
        if test -z $z_select_result
            exit 0
        end

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
end
