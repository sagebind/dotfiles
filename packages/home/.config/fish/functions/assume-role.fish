# Replacement for https://github.com/remind101/assume-role

function assume-role --description 'Run a command with temporary AWS credentials' -a profile
  set -lx AWS_ACCESS_KEY_ID (aws configure get $profile.aws_access_key_id)
  set -lx AWS_SECRET_ACCESS_KEY (aws configure get $profile.aws_secret_access_key)
  set -lx AWS_SESSION_TOKEN (aws configure get $profile.aws_session_token)
  set -lx AWS_SECURITY_TOKEN "$AWS_SESSION_TOKEN"

  command $argv[2..-1]
end
