# Josef Spjut 2004(ish)-2013

# This is for my binaries
export PATH=$PATH:$HOME/bin

# Mac only settings
if [[ ${OSTYPE//[0-9.]/} == 'darwin' ]]; then
# Add android SDK
    export PATH=$PATH:$HOME/android-sdk-macosx/tools:$HOME/android-sdk-macosx/platform-tools
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
