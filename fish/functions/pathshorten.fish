function pathshorten
    if test (count $argv) -eq 0
        echo "Usage: pathshorten path [keep_num]"
        return
    end
    
    set initial_path $argv[1]

    # if path is start with $HOME, replace $HOME with ~
    if string match -q "$HOME*" $initial_path
        set initial_path (string replace -r "^$HOME" "~" $initial_path)
    end 

    # if path length > 1 and it is end with /, remove it
    if string match -rq '\S+/$' $initial_path
        set initial_path (string replace -r '/$' '' $initial_path)
    end

    # keep_num is the number of characters to keep in each directory
    if test (count $argv) -ge 2
        set keep_num $argv[2]
    else
        set keep_num 2
    end
    set file_paths (string split '/' $initial_path)
    set shorten_path ""
    set file_name (string match -r '[^/]+$' $initial_path)
    set dir_deep (count $file_paths)

    #echo file_paths leng (math "$dir_deep - 1") file_name "h$file_name"haha
    
    if test $dir_deep -le 1
        echo $initial_path
        return
    end

    for i in (seq 1 $(math "$dir_deep - 1"))
        set dir $file_paths[$i]
        set dir (string match -r '\S{0,'$keep_num'}' $dir)
        set shorten_path "$shorten_path$dir/"
    end

    set shorten_path "$shorten_path$file_name"
    echo $shorten_path
end
