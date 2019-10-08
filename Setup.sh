#! /bin/bash

### Left overs
# Set iTerm2 with Solarized colors theme via CLI
## Preferences --> Profiles --> {profile} --> Colors --> Colors presets --> Import\select
# Set iTerm2 with 
## Preferences --> Profiles --> {profile} --> Text --> [Font] Change font --> 13pt. Hack Regular Nerd Font Complete
## Preferences --> Profiles --> {profile} --> Text --> [Non-ASCII font] Change font --> 13pt. Hack Regular Nerd Font Complete
# Wifi signal, laptop battery metters.
## sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
# [Source]: https://medium.com/@rafavinnce/iterm2-zsh-oh-my-zsh-material-design-the-most-power-full-terminal-on-macos-332b1ee364a5
###

# Script variables
set -o nounset
echo $(tput sgr0)
Args=("$@")
OSname=''
OStype=''
OSversion=''

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

function OS_type {
	# Recognize OS type:
	if [[ -f /etc/redhat-release ]]; then
        OStype="CentOS"
	elif [[ -f /usr/bin/lsb_release ]]; then
        OStype="Ubuntu"
	elif [[ -f /usr/bin/sw_vers ]]; then
		OStype="OSX"
	else
		error_msg "This script supports CentOS \ RHEL, OSX or Ubuntu OS ditributions!"
		exit 102
	fi
}

function OS_version {
    if [[ ${OStype} == "CentOS" ]]; then
        if [[ `cat /etc/redhat-release` == "CentOS Linux release 7."* ]]; then
			OSversion=7
		elif [[ `cat /etc/redhat-release` == "CentOS release 6."* ]]; then
			OSversion=6
        else
            error_msg "Your CentOS version is not supported yet!"
            exit 103
		fi
    elif [[ ${OStype} == "Ubuntu" ]]; then
        OSval=`/usr/bin/lsb_release -rs`
        case ${OSval} in
        14.04)
            OSname='Trusty Tahr'
            OSversion="14.04"
            ;;
        14.10)
            OSname='Utopic Unicorn'
            OSversion="14.10"
            ;;
        15.04)
            OSname='Vivid Vervet'
            OSversion="15.04"
            ;;
        15.10)
            OSname='Wily Werewolf'
            OSversion="15.10"
            ;;
        16.04)
            OSname='Xenial Xerus'
            OSversion="16.04"
            ;;
        16.10)
            OSname='Yakkety Yak'
            OSversion="16.10"
            ;;
        17.04)
            OSname='Zesty Zapus'
            OSversion="17.04"
            ;;
        17.10)
            OSname='Artful Aardvark'
            OSversion="17.10"
            ;;
        18.04)
            OSname='Bionic Beaver'
            OSversion="18.04"
            ;;
        18.10)
            OSname='Cosmic Cuttlefish'
            OSversion="18.10"
            ;;
        19.04)
            OSname='Disco Dingo'
            OSversion="19.04"
            ;;
        *)
            error_msg "Your Ubuntu version is not supported yet!"
            exit 104
            ;;
       esac
    elif [[ ${OStype} == "OSX" ]]; then
		OSval=`sw_vers -productVersion`
		case ${OSval} in
            10.6.*)
                OSname='Snow Leopard'
                OSversion="10.6"
                ;;
            10.7.*)
                OSname='Lion'
                OSversion="10.7"
                ;;
            10.8.*)
                OSname='Mountain Lion'
                OSversion="10.8"
                ;;
            10.9.*)
                OSname='Mavericks'
                OSversion="10.9"
                ;;
            10.10.*)
                OSname='Yosemite'
                OSversion="10.10"
                ;;
            10.11.*)
                OSname="El Capitan"
                OSversion="10.11"
                ;;
            10.12.*)
                OSname='High Sierra'
                OSversion="10.12"
                ;;
            10.13.*)
                OSname='High Sierra'
                OSversion="10.13"
                ;;
            10.14.*)
                OSname='Mojave'
                OSversion="10.14"
                ;;
            10.15.*)
                OSname='Catalina'
                OSversion="10.15"
                ;;
            10.14.*)
                OSname='Mojave'
                OSversion="10.14"
                ;;
            10.15 | 10.15.*)
                OSname='Catalina'
                OSversion="10.15"
                ;;
            *)
                error_msg "Your Mac OS version is not supported yet!"
                exit 105
        esac
    fi
}

# Confirms that this script running using local user account
if [ $EUID == 0 ]; then
	error_msg "### This script must run WITHOUT Root privileges!"
	exit 101
fi

# Making sure this script will use Sudo permissions - when needed - without prompting for credentials more than once
sudo -v
# Keep-alive: update existing `sudo` time stamp until `$0` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Script checks
if [ ! -f $HOME/.ssh/id_rsa ]; then
	warning_msg "By default, you should import your Github account public\private keys prior to runing this script, otherwise make sure your Github account does not use 2FA!"
	read -p "Press any key to continue..."
fi

# Brew installation
if [[ ! `which brew` ]]; then
    echodo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Neofetch installation
echodo brew install neofetch

# Nerd fonts installation
echodo brew tap homebrew/cask-fonts
echodo brew cask install font-hack-nerd-font
echodo sudo chown -R $(whoami) /usr/local/lib/pkgconfig
echodo chmod u+w /usr/local/lib/pkgconfig

# Oh-My-Zsh installation
#bash "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Zsh installation
echodo brew install zsh

# Install Plugins
if [[ ! -d $HOME/.oh-my-zsh/custom/plugins ]]; then echodo  mkdir $HOME/.oh-my-zsh/custom/plugins; fi

if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then echodo git clone git@github.com:zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions; fi
if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then echodo git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; fi
### Enabling Git clone via SSH instead of HTTPS
#if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions; fi
#if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; fi

# Powerlevel9k Installation - In use
if [[ ! -d /usr/local/opt/powerlevel9k ]]; then
	echodo brew tap sambadevi/powerlevel9k
	echodo brew install powerlevel9k
fi

# Zsh Aliases
if [[ ! -f $HOME/.Aliases ]]; then
	echodo cp ./Aliases $HOME/.Aliases
	#chown $USER:staff ~/.Aliases
	echodo chmod 0640 ~/.Aliases
fi

# .Zshrc configuration
if [[ ! -f $HOME/.zshrc ]]; then
    echodo touch $HOME/.zshrc
else
    echodo rm -f $HOME/.zshrc
    echodo touch $HOME/.zshrc
fi

cat >> $HOME/.zshrc << EOF
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="\$PATH:\$HOME/.rvm/bin"
# Load Aliases, if exists
[[ -e ~/.Aliases ]] && emulate sh -c 'source ~/.Aliases'

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

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
exit 0