function 7z --wraps 7zz
  # 7zip officially supports Linux now, use it if available. It is often exposed
  # under `7zz` to avoid conflicts with the old p7zip package. p7zip itself is now
  # deprecated and unmaintained.
  if type -fq 7zz
    command 7zz $argv
  else
    command 7z $argv
  end
end
