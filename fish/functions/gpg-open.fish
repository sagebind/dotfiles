function gpg-open
  if not set -q CIPHER_ALGO
    set CIPHER_ALGO AES256
  end

  set -l source_file "$argv[1]"
  set -e argv[1]
  set -l tmpfs /run/user/(id -u)/gpg
  mkdir -p $tmpfs

  echo -n "Password: "
  bash -c 'read -s p; printf "%s" "$p"' | read -l password

  set -l working_dir (mktemp --directory --tmpdir=$tmpfs)
  set -l decrypted_file $working_dir/\$original
  set -l working_file $working_dir/(command basename $source_file .gpg)

  printf '%s' "$password" | gpg --passphrase-fd 0 -o $decrypted_file -d $source_file
  cat < $decrypted_file > $working_file

  eval $argv $working_file

  if not cmp -s $working_file $decrypted_file
    printf '%s' "$password" | gpg --passphrase-fd 0 --cipher-algo $CIPHER_ALGO -o $source_file -c $working_file
  end

  rm -r $working_dir
end
