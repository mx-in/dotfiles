function get_openai_key -a refetch

    set fish_base_path "$HOME/.config/fish"
    set keys_file $fish_base_path"/openai_keys.txt"

    if test "$refetch" = "-r"
      curl 'https://freeopenai.xyz/api.txt' --compressed > $keys_file
      echo 'index:0' >> $keys_file
    end

    set start_line (grep 'index' $keys_file | awk -F: '{print $2}'| string replace -a '\s' '')
    set line_count (wc -l $keys_file | awk '{print $1}' | string replace -a '\s' '')
    set start_line (math $start_line + 1)
    set line_count (math $line_count - 1)

    echo "$line_count keys total, start to test from no.$start_line"

    if test $start_line -gt $line_count
      echo "no more keys"
      return
    end

    for i in (seq (math $start_line) $line_count)
      set key (sed -n "$i"p $keys_file | string replace '' '')
      set test_result (echo (test_openai_key $key))
      echo "no.$i: $test_result"

      if test "$test_result" = "true"
        echo "😎: $key"
        echo $key | pbcopy && say "find a valid key"
        #update index
        sed -i bak "s/index:$start_line/index:$i/" $keys_file

        #update open ai key
        sed -i bak "s/$OPENAI_API_KEY/$key/" "$fish_base_path/privacy.fish"
        set -gx OPENAI_API_KEY $key 
        rm "$fish_base_path/openai_keys.txtbak"
        rm "$fish_base_path/privacy.fishbak"
        return
      end
    end
end

