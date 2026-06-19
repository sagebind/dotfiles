# If using Colima for Docker on macOS, auto-start the VM on demand.

if type -fq docker; and type -fq colima
  function docker --wraps docker
    if not command docker info > /dev/null 2> /dev/null
      command colima start
    end

    command docker $argv
  end

  if type -fq docker-compose
    function docker-compose --wraps docker-compose
      if not command docker info > /dev/null 2> /dev/null
        command colima start
      end

      command docker-compose $argv
    end
  end
end
