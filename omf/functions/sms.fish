function sms -d "Send an SMS to someone via your Android phone"
    if not set -q MAKER_KEY
        echo "IFTTT Maker API key not set."
        return 1
    end

    set url "https://maker.ifttt.com/trigger/sms/with/key/"$MAKER_KEY
    echo "Sending request to '$url'..."

    curl -G --data-urlencode value1=$argv[1] --data-urlencode value2=$argv[2] $url
end
