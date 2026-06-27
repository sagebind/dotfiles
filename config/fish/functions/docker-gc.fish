function docker-gc
  for image in (docker images -q --filter "dangling=true")
    docker rmi $image
  end
end
