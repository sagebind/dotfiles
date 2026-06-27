function filebot
  if test $argv[1] = "-h"; or test $argv[1] = "--help"
    set argv[1] "-help"
  end

  if type -fq filebot
    command filebot $argv
  else if flatpak info net.filebot.FileBot > /dev/null
    command flatpak run net.filebot.FileBot $argv
  else
    echo "filebot: command not found"
  end
end
