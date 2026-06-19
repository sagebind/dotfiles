function filter -a query --description 'Filter a list of items using the current default filter'
  if test -z "$query"
    command $FILTER
  else
    command $FILTER --query "$query"
  end
end
