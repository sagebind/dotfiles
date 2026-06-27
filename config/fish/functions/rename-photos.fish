function rename-photos -d "Renames photos to a uniform pattern"
  exiftool -m '-FileName<DateTimeOriginal' -d '%Y-%m-%d %H.%M.%S%%-2c.%%le' $argv
end
