if test -d $HOME/.local/android_sdk
  set -gx ANDROID_HOME $HOME/.local/android_sdk
  set -gx ANDROID_SDK_ROOT $ANDROID_HOME
  fish_add_path --global $ANDROID_HOME/cmdline-tools/latest/bin
end
