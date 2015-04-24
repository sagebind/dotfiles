function rm
    if test $argv[1] = "-s"
        # skip trash and use regular rm
        command rm $args[2..-1]
    else
        # send files to trash
        gvfs-trash $argv
    end
end
