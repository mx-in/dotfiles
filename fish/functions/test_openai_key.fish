function test_openai_key -a key 
    if test -z "$key"
      set key $OPENAI_API_KEY 
    end

    set gpt (curl https://api.openai.com/v1/chat/completions -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $key" \
    -d '{
        "model": "gpt-3.5-turbo",
        "messages": [{"role": "user", "content": "hello world"}],
        "temperature": 0.7
    }')
    set error (echo $gpt | jq -r '.error')
    if test "$error" = 'null'
      echo "true"
    else
      echo $error | jq -r '.code'
    end
end

