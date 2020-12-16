#! /bin/bash

### Left overs
# Wifi signal, laptop battery metters.
## sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
###

### Credits to:
# [Source]: https://medium.com/@rafavinnce/iterm2-zsh-oh-my-zsh-material-design-the-most-power-full-terminal-on-macos-332b1ee364a5
## avillafiorita/.colors.csv    -   https://gist.github.com/avillafiorita/9e626ce370e1da6c6373#file-set_colors-bash
## kevinSuttle/macOS-Defaults   -   https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos

# Script variables
set -o nounset
echo $(tput sgr0)
Args=("$@")
OSname=''
OStype=''
OSversion=''
ShellFont='Hack Nerd Font'
ShellFontSize='13'
TerminalTheme='Solarized_Dark_xterm-256color'       # The Terminal theme should be located on ~/.config/Terminal/

# Output templates:
description_msg() {
	echo -e "$(tput setaf 10)--> $*$(tput sgr0)"
}
error_msg() {
	echo -e "$(tput setaf 1)(X) --> $*$(tput sgr0)"
}
notification_msg() {
	echo -e "$(tput setaf 3)##\n## $*\n##\n$(tput sgr0)"
}
output_msg() {
	echo -e "$(tput setaf 2)--> $*$(tput sgr0)"
}
query_msg() {
	echo -e "$(tput setaf 9)--> $*$(tput sgr0)"
}
warning_msg() {
	echo -e "$(tput setaf 3)(!) --> $*$(tput sgr0)"
}
function echodo {
	output_msg "$@"
	"$@"
}


function Brew {
    # Nerd fonts installation
    echodo brew tap homebrew/cask-fonts
    echodo brew install --cask font-hack-nerd-font
    echodo sudo chown -R $(whoami) /usr/local/lib/pkgconfig
    echodo chmod u+w /usr/local/lib/pkgconfig
    
    # Install GNU Sed
    if [[ ! `which gsed` ]]; then
        echodo brew install gsed
    fi

    # Neofetch installation
    if [[ ! `which neofetch` ]]; then
        echodo brew install neofetch
    fi

    # Powerlevel9k Installation
    if [[ ! -d /usr/local/opt/powerlevel9k ]]; then
        echodo brew tap sambadevi/powerlevel9k
        echodo brew install powerlevel9k
    fi

    # Zsh installation
    if [[ ! -L /usr/local/bin/zsh ]]; then
        echodo brew install zsh
    else
        echodo brew upgrade zsh
    fi
}


function Setup_Plugins {
    # Install Plugins
    if [[ ! -d $HOME/.oh-my-zsh/custom/plugins ]]; then echodo  mkdir -p $HOME/.oh-my-zsh/custom/plugins; fi
    if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then echodo git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions; fi
    if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then echodo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; fi
}


function Senity_Checks {
    # Confirms that this script running using local user account
    if [ $EUID == 0 ]; then
        error_msg "### This script must run WITHOUT Root privileges!"
        exit 101
    fi

    # Checking Internet access
    if [[ ! `ping -c1 8.8.8.8` ]]; then
        error_msg "Failed to reach Google DNS over IP, access to the internet is a MUST for this script to work!"
        exit 106
    elif [[ ! `ping -c1 www.google.com` ]]; then
        error_msg "Failed to reach Google webserver using its DNS record, access to the internet is a MUST for this script to work!"
        exit 107
    fi

    # Checks for Brew installation
    if [[ ! `which brew` ]]; then
        warning_msg "Brew was not detected - will try to install it now..."
        yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        output_msg "Brew has been detected, will make sure it is working well and updated..."
        echodo brew doctor
        echodo brew analytics off
    fi

    # Checks for Git binary
    if [[ ! `which git` ]]; then
        echodo brew install git
    fi
}


function Setup_Terminal {
# Terminal confgiuration
# Use a modified version of the Solarized Dark theme by default in Terminal.app
# Font and font size are values of $ShellFont & $ShellFontSize are set in the top of this script
osascript << EOB
tell application "Terminal"
	local allOpenedWindows
	local initialOpenedWindows
	local windowID
	set themeName to "${TerminalTheme}"
	(* Store the IDs of all the open terminal windows. *)
    set initialOpenedWindows to id of every window
	(* Open the custom theme so that it gets added to the list
	   of available terminal themes (note: this will open two
	   additional terminal windows). *)
	do shell script "open '$HOME/.config/Terminal/" & themeName & ".terminal'"
	(* Wait a little bit to ensure that the custom theme is added. *)
	delay 1
	(* Set the custom theme as the default terminal theme. *)
	set default settings to settings set themeName
	(* Get the IDs of all the currently opened terminal windows. *)
	set allOpenedWindows to id of every window
	repeat with windowID in allOpenedWindows
		(* Close the additional windows that were opened in order
		   to add the custom theme to the list of terminal themes. *)
		if initialOpenedWindows does not contain windowID then
			close (every window whose id is windowID)
		(* Change the theme for the initial opened terminal windows
		   to remove the need to close them in order for the custom
		   theme to be applied. *)
		else
			set current settings of tabs of (every window whose id is windowID) to settings set themeName
		end if
	end repeat
end tell
EOB
    
    # Apply Terminal font & size on current Terminal session as well
    osascript -e "tell application \"Terminal\" to set the font name of every window to \"${ShellFont}\""
    osascript -e "tell application \"Terminal\" to set the font size of every window to \"${ShellFontSize}\""
}

    
function SysPrep {
    # Making sure this script will use Sudo permissions - when needed - without prompting for credentials more than once
    sudo -v
    # Keep-alive: update existing `sudo` time stamp until `$0` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}


function SystemPreperation {
    # Zsh Aliases
    if [[ ! -f $HOME/.Aliases ]]; then
        echodo cp Aliases $HOME/.Aliases
        echodo chmod 0640 ~/.Aliases
    fi

    # Terminal Font
    if [[ ! -f $HOME/.Terminal ]]; then
        echodo cp Terminal $HOME/.Terminal
        echodo chmod 0640 ~/.Terminal
        gsed -i "s/--ShellFont--/${ShellFont}/" ~/.Terminal
        gsed -i "s/--ShellFontSize--/${ShellFontSize}/" ~/.Terminal
    fi

    # .Zshrc configuration
    if [[ ! -f $HOME/.zshrc ]]; then
        echodo touch $HOME/.zshrc
    else
        echodo rm -f $HOME/.zshrc
        echodo touch $HOME/.zshrc
    fi

    # Terminal Solarized theme
    if [[ ! -d $HOME/.config/Terminal ]]; then
        echodo mkdir -p $HOME/.config/Terminal
        echodo cp ${TerminalTheme}.terminal $HOME/.config/Terminal/
    fi


cat >> $HOME/.zshrc << EOF
# Load Aliases, if exists
[[ -e ~/.Aliases ]] && emulate sh -c 'source ~/.Aliases'
[[ -e ~/.Terminal ]] && emulate sh -c 'source ~/.Terminal'

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# Set Keyboard binding with iTerm2
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

### The lines commented-out below maight be useful if the above ones will fail!
#bindkey "\e\e[D" backward-word
#bindkey "\e\e[C" forward-word
###

# Additional plugins
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

POWERLEVEL9K_MODE='nerdfont-complete'
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# Please only use this battery segment if you have material icons in your nerd font (or font)
# Otherwise, use the font awesome one in "User Segments"
prompt_zsh_battery_level() {
    local percentage1=\`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'\`
    local percentage=\`echo "\${percentage1//\%}"\`
    local color='%F{red}'
    local symbol="\uf00d"
    if [ \$(pmset -g ps > /dev/null 2>&1 | wc -l) != 2 ]; then
        local charging="false";
        local symbol="\u26A1"
        echo -n "%{\$color%}\$symbol" ;
        break
    fi
    pmset -g ps | grep "discharging" > /dev/null
    if [ \$? -eq 0 ]; then
        local charging="false";
    else
        local charging="true";
    fi

    if [ \$percentage -le 20 ]
        then symbol='\uf579' ; color='%F{red}' ;
        #10%
    elif [ \$percentage -gt 19 ] && [ \$percentage -le 30 ]
        then symbol="\uf57a" ; color='%F{red}' ;
        #20%
    elif [ \$percentage -gt 29 ] && [ \$percentage -le 40 ]
        then symbol="\uf57b" ; color='%F{yellow}' ;
        #35%
    elif [ \$percentage -gt 39 ] && [ \$percentage -le 50 ]
        then symbol="\uf57c" ; color='%F{yellow}' ;
        #45%
    elif [ \$percentage -gt 49 ] && [ \$percentage -le 60 ]
        then symbol="\uf57d" ; color='%F{blue}' ;
        #55%
    elif [ \$percentage -gt 59 ] && [ \$percentage -le 70 ]
        then symbol="\uf57e" ; color='%F{blue}' ;
        #65%
    elif [ \$percentage -gt 69 ] && [ \$percentage -le 80 ]
        then symbol="\uf57f" ; color='%F{blue}' ;
        #75%
    elif [ \$percentage -gt 79 ] && [ \$percentage -le 90 ]
        then symbol="\uf580" ; color='%F{blue}' ;
        #85%
    elif [ \$percentage -gt 89 ] && [ \$percentage -le 99 ]
        then symbol="\uf581" ; color='%F{blue}' ;
        #85%
    elif [ \$percentage -gt 98 ]
        then symbol="\uf578" ; color='%F{green}' ;
        #100%
    fi

    if [ \$charging = "true" ];
        then color='%F{green}'; if [ \$percentage -gt 98 ]; then symbol='\uf584'; fi
    fi
    echo -n "%{\$color%}\$symbol" ;
}

zsh_internet_signal(){
    local color
    local symbol="\uf7ba"
    if ifconfig en0 | grep inactive &> /dev/null; then
        color="%F{red}"
    else
        color="%F{blue}"
    fi
    echo -n "%{\$color%}\$symbol "
}

POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="\UF43A  %D{%H:%M  \UF133  %m.%d.%y}"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_CUSTOM_BATTERY_STATUS="prompt_zsh_battery_level"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon custom_internet_signal custom_battery_status_joined ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon custom_internet_signal custom_battery_status_joined ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time  status  time)
HIST_STAMPS="mm/dd/yyyy"
DISABLE_UPDATE_PROMPT=true
EOF

    # Modify PowerLevel9K theme configuration file
    if [[ `which gsed 2> /dev/null` ]]; then
        echodo gsed -i -e "/\"TIME_ICON\"$/ s/^#*/# Modified by Yehonatan Devorkin\n/" -e "s/ \"TIME_ICON\"//" /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme | grep -A5 '# System time'
    fi

    # Change current user default loginShell to Zsh
    echodo sudo dscl . -create $HOME UserShell /usr/local/bin/zsh
}

SysPrep
Senity_Checks
Brew
Setup_Plugins
SystemPreperation
Setup_Terminal
