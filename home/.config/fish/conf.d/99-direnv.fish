if type -fq direnv
  set -x DIRENV_LOG_FORMAT ""
  direnv hook fish | source
end
