function docker-compose --wraps docker-compose
  if type -fq colima; and not command docker info > /dev/null 2> /dev/null
    command colima start
  end

  if type -fq docker-compose
    command docker-compose $argv
  else if type -fq docker
    command docker compose $argv
  else
    command podman-compose $argv
  end
end
