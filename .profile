# Josef Spjut 2004(ish)-2013

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Mac only settings
if [[ ${OSTYPE//[0-9.]/} == 'darwin' ]]; then
# Add android SDK
    export PATH=$PATH:$HOME/android-sdk-macosx/tools:$HOME/android-sdk-macosx/platform-tools:/usr/local/share/python
    export ANDROID_SDK_ROOT=$HOME/android-sdk-macosx
    export NDK_ROOT=$HOME/android-ndk

# Add latex (appears to not be needed)
#export PATH=$PATH:/usr/texbin

# set up display x11 when in terminal
    export DISPLAY=:0.0
    
# for MPLABX
    export PATH="/Applications/microchip/xc32/v1.10/bin":$PATH

    echo OSX .profile loaded!
fi # end darwin
