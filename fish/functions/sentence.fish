function sentence -d "Convert a string to proper sentence case" -a string
  echo "$string" | sed -e 's/\b\([A-Z]\)\([a-z]*\)\b/\l\1\2/g' -e 's/\`[a-z]/\u&/g'
end
