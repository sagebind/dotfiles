#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-
#
# fish-bd 1.1 by Jean-Philippe Roemer <roemer.jp@gmail.com>
# https://github.com/0rax/bd-fish
#
# The MIT License (MIT)
#
# Copyright (c) 2013 Jean-Philippe Roemer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function init --on-event init_bd
    complete -c bd -s c --description "Classic mode : goes back to the first directory named as the string"
    complete -c bd -s s --description "Seems mode : goes back to the first directory containing string"
    complete -c bd -s i --description "Case insensitive move (implies seems mode)"
    complete -c bd -s h -x --description "Display help and exit"
    complete -c bd -A -f

    function __fish_bd_complete_dirs
    	printf (pwd | sed 's|/|\\\n|g')
    end

    complete -c bd -a '(__fish_bd_complete_dirs)'
end

function __bd_usage
	printf "# fish-bd 1.1.1 by Jean-Philippe Roemer <roemer.jp@gmail.com>
# https://github.com/0rax/bd-fish

Based on bd for bash by Vigneshwaran Raveendran (https://github.com/vigneshwaranr/bd)

Description:
    Quickly go back to a parent directory up in your current working directory tree.
    Don't write 'cd ../../..' redundantly, use bd instead.

Usage:
    bd [option] <directory name>

Example:
    # You are in /home/user/my/path/is/very/long/
    # And you want to go back to 'path', simple type
    > bd path
    # or
    > bd -s pa
    # or
    > bd -i P
    # And you are now in /home/user/my/path/

Options:
    -c\t\tClassic mode : goes back to the first directory named as the string (default)
	\t\tSet if default using (set -gx BD_OPT 'classic')
	\t\tDefault mode when BD_OPT or CLI options are specified
    -s\t\tSeems mode : goes back to the first directory containing string
    \t\tSet it as default using (set -gx BD_OPT 'sensitive')
    -i\t\tCase insensitive move (implies seems mode)
    \t\tSet it as default using (set -gx BD_OPT 'insensitive')
    -h\t\tDisplay help and exit
"
end

function bd

	set -l __bd_oldpwd (pwd)
	set -l __bd_newpwd
	set -l __bd_index
	set -l __bd_arg
	set -l __bd_opts $BD_OPT

	set args (getopt "csih" $argv)
	if [ $status -gt 0 ]
        	return 1
	end
	set args (echo $args | sed 's/^\s//' | tr ' ' '\n')

	set -l i 1
	for arg in $args
		switch $arg
		case "-s"
			set __bd_opts "sensitive"
		case "-i"
			set __bd_opts "insensitive"
		case "-c"
			set __bd_opts "classic"
		case "--"
			set i (math $i + 1)
			break
		case "-h"
			__bd_usage
			return 0
		end
		set i (math $i + 1)
	end

	if [ $i -gt (count $args) ]
		cd ..
		pwd
		return 0
	end

	switch "$__bd_opts"
	case "sensitive"
		set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$args[$i]'[^/]*/\).*|\1|')
	case "insensitive"
		set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$args[$i]'[^/]*/\).*|\1|I')
	case '*'		# classic
		set __bd_newpwd (echo $__bd_oldpwd | sed 's|\(.*/'$args[$i]'/\).*|\1|')
	end

	if [ $__bd_newpwd = $__bd_oldpwd ]
		echo "No such occurence."
	end

	echo "$__bd_newpwd"
	cd "$__bd_newpwd"

end
