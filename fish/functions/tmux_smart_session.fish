function tmux_smart_session
    #if not currently in tmux
    if test -z $TMUX
        tmux is not active
        echo "is not tmux"

        #save fzf to variables
        set ZOXIDE_RESULT (zoxide query -l | fzf --reverse)
        echo $ZOXIDE_RESULT

        exit 1
        #if empty exit
        if test -z $ZOXIDE_RESULT
            echo "exit 0"
        end

        set FOLDER (basename "$ZOXIDE_RESULT")
        #lookup tmux session name
        set SESSION (tmux list-sessions | grep "$FOLDER" | awk '{print $1}')
        set SESSION (string replace "$SESSION" : '')
        echo "$SESSION"

        if test -z "$SESSION"
            # session does not exist
            echo "session does not exist"
            # jump to directory
            cd "$ZOXIDE_RESULT"
            # create session
            tmux new-session -s "$FOLDER"
        else
            # session exists
            echo "session exists"
            # attach to session
            tmux attach -t "$SESSION"
        end
    else
        #tmux is active
        echo "is tmux"
        #save fzf to variables
        set ZOXIDE_RESULT (zoxide query -l | fzf --reverse)
        #if no result exit
        if test -z "$ZOXIDE_RESULT"
            echo "exit 0"
        end

        set FOLDER (basename "$ZOXIDE_RESULT")

        #lookup tmux session name
        set SESSION (tmux list-sessions | grep "$FOLDER" | awk '{print $1}')
        set SESSION (string replace "$SESSION" : '')

        if test -z "$SESSION"
            # session does not exist
            echo "session does not exist"
            # jump to directory
            cd "$ZOXIDE_RESULT"
            # create session
            tmux new-session -d -s "$FOLDER"
            # attach to session
            tmux switch-client -t "$FOLDER"
        else
            # session exists
            echo "session exists"
            # attach to session
            # switch to tmux session
            tmux switch-client -t "$SESSION"
        end
    end
end
