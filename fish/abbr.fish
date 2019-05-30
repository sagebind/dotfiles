if status --is-interactive
  set -g fish_user_abbreviations

  abbr d docker
  abbr dc docker-compose
  abbr dm docker-machine
  abbr k kubectl

  abbr ed code

  abbr g git
  abbr gc 'git checkout'
  abbr gcd 'git checkout develop'
  abbr gcm 'git checkout master'
  abbr gm 'git merge'
  abbr gp 'git pull'
  abbr gs 'git s'

  abbr s3 'aws s3'
end
