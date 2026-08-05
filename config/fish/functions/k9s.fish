function k9s --wraps k9s
  # Specify skin for k9s, without using the config file which mixes creds and
  # stuff together.
  set -x K9S_SKIN transparent

  command k9s
end
