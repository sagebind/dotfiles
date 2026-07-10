if type -fq pitchfork
  set -l completions_dir "$HOME/.local/share/fish/vendor_completions.d"
  set -l completions_file "$completions_dir/pitchfork.fish"

  if not test -f $completions_file
    mkdir -p $completions_dir
    pitchfork completion fish > $completions_file
  end
end
