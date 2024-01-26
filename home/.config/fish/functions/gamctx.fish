function gamctx -a domain -d "Switch domains for GAM"
  set -l gam_path (dirname (readlink (type -p gam)))

  if test -z "$domain"
    set domain (basename -a $gam_path/*/ | command $FILTER)
  end

  for file_path in $gam_path/$domain/{client_secrets.json,oauth2.txt,oauth2service.json}
    set -l filename (basename $file_path)
    ln -b -s "$domain/$filename" "$gam_path/$filename"
  end

  command gam info domain
end
