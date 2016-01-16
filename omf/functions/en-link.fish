function en-link -d "Convert an Evernote web link to a note link"
    set -l fields (echo $argv[1] | tr "/?" "\n")
    set -l account $fields[7]
    set -l shard $fields[5]
    set -l note $fields[8]

    echo "evernote:///view/$account/$shard/$note/$note/"
end
