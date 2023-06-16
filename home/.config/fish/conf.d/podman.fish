# Masquarade Podman as Docker if Docker is not installed.

if not type -fq docker; and type -fq podman
  if find $HOME/.local/share/containers/podman -name podman.sock -type s 2> /dev/null | head -n1 | read -l socket_path
    set -gx DOCKER_HOST "unix://$socket_path"
  end

  function docker -a subcommand
    if test "$subcommand" = 'compose'
      docker-compose $argv[2..-1]
    else
      command podman $argv
    end
  end

  if not type -fq docker-compose; and type -fq podman-compose
    function docker-compose
      command podman-compose $argv
    end
  end
end
