function docker -a subcommand --wraps docker
  if type -fq colima; and not command docker info > /dev/null 2> /dev/null
    command colima start
  end

  if type -fq docker
    command docker $argv
  else if test "$subcommand" = 'compose'; and type -fq docker-compose
    command docker-compose $argv[2..-1]
  else
    command podman $argv
  end
end
