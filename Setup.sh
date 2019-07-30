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

# Brew installation
if [[ ! `whic brew` ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# iTerm2 installation
if [[ ! -d "/Applications/iTerm.app" ]]; then
    brew cask install iterm2
fi

# Neofetch installation
brew install neofetch

# Nerd fonts installation
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

# Oh-My-Zsh installation
bash "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Zsh installation
brew install zsh

# Original iTerm2 Solarized Dark colors theme - In use
if [[ ! -f ~/Solarized_Dark.itemcolors ]]; then
cat >> ~/Solarized_Dark.itemcolors << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Ansi 0 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.19370138645172119</real>
		<key>Green Component</key>
		<real>0.15575926005840302</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Ansi 1 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.14145714044570923</real>
		<key>Green Component</key>
		<real>0.10840655118227005</real>
		<key>Red Component</key>
		<real>0.81926977634429932</real>
	</dict>
	<key>Ansi 10 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.38298487663269043</real>
		<key>Green Component</key>
		<real>0.35665956139564514</real>
		<key>Red Component</key>
		<real>0.27671992778778076</real>
	</dict>
	<key>Ansi 11 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.43850564956665039</real>
		<key>Green Component</key>
		<real>0.40717673301696777</real>
		<key>Red Component</key>
		<real>0.32436618208885193</real>
	</dict>
	<key>Ansi 12 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.51685798168182373</real>
		<key>Green Component</key>
		<real>0.50962930917739868</real>
		<key>Red Component</key>
		<real>0.44058024883270264</real>
	</dict>
	<key>Ansi 13 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.72908437252044678</real>
		<key>Green Component</key>
		<real>0.33896297216415405</real>
		<key>Red Component</key>
		<real>0.34798634052276611</real>
	</dict>
	<key>Ansi 14 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.56363654136657715</real>
		<key>Green Component</key>
		<real>0.56485837697982788</real>
		<key>Red Component</key>
		<real>0.50599193572998047</real>
	</dict>
	<key>Ansi 15 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.86405980587005615</real>
		<key>Green Component</key>
		<real>0.95794391632080078</real>
		<key>Red Component</key>
		<real>0.98943418264389038</real>
	</dict>
	<key>Ansi 2 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.020208755508065224</real>
		<key>Green Component</key>
		<real>0.54115492105484009</real>
		<key>Red Component</key>
		<real>0.44977453351020813</real>
	</dict>
	<key>Ansi 3 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.023484811186790466</real>
		<key>Green Component</key>
		<real>0.46751424670219421</real>
		<key>Red Component</key>
		<real>0.64746475219726562</real>
	</dict>
	<key>Ansi 4 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.78231418132781982</real>
		<key>Green Component</key>
		<real>0.46265947818756104</real>
		<key>Red Component</key>
		<real>0.12754884362220764</real>
	</dict>
	<key>Ansi 5 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.43516635894775391</real>
		<key>Green Component</key>
		<real>0.10802463442087173</real>
		<key>Red Component</key>
		<real>0.77738940715789795</real>
	</dict>
	<key>Ansi 6 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.52502274513244629</real>
		<key>Green Component</key>
		<real>0.57082360982894897</real>
		<key>Red Component</key>
		<real>0.14679534733295441</real>
	</dict>
	<key>Ansi 7 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.79781103134155273</real>
		<key>Green Component</key>
		<real>0.89001238346099854</real>
		<key>Red Component</key>
		<real>0.91611063480377197</real>
	</dict>
	<key>Ansi 8 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.15170273184776306</real>
		<key>Green Component</key>
		<real>0.11783610284328461</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Ansi 9 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.073530435562133789</real>
		<key>Green Component</key>
		<real>0.21325300633907318</real>
		<key>Red Component</key>
		<real>0.74176257848739624</real>
	</dict>
	<key>Background Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.15170273184776306</real>
		<key>Green Component</key>
		<real>0.11783610284328461</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Bold Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.56363654136657715</real>
		<key>Green Component</key>
		<real>0.56485837697982788</real>
		<key>Red Component</key>
		<real>0.50599193572998047</real>
	</dict>
	<key>Cursor Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.51685798168182373</real>
		<key>Green Component</key>
		<real>0.50962930917739868</real>
		<key>Red Component</key>
		<real>0.44058024883270264</real>
	</dict>
	<key>Cursor Text Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.19370138645172119</real>
		<key>Green Component</key>
		<real>0.15575926005840302</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Foreground Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.51685798168182373</real>
		<key>Green Component</key>
		<real>0.50962930917739868</real>
		<key>Red Component</key>
		<real>0.44058024883270264</real>
	</dict>
	<key>Selected Text Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.56363654136657715</real>
		<key>Green Component</key>
		<real>0.56485837697982788</real>
		<key>Red Component</key>
		<real>0.50599193572998047</real>
	</dict>
	<key>Selection Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.19370138645172119</real>
		<key>Green Component</key>
		<real>0.15575926005840302</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
</dict>
</plist>
EOF
fi

# Patched iTerm2 Solarized Dark colors theme - Not in use
#cat >> ~/Solarized_Dark.itemcolors << EOF
cat >> /dev/null << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Ansi 0 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.19370138645172119</real>
		<key>Green Component</key>
		<real>0.15575926005840302</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Ansi 1 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.14145714044570923</real>
		<key>Green Component</key>
		<real>0.10840655118227005</real>
		<key>Red Component</key>
		<real>0.81926977634429932</real>
	</dict>
	<key>Ansi 10 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.38298487663269043</real>
		<key>Green Component</key>
		<real>0.35665956139564514</real>
		<key>Red Component</key>
		<real>0.27671992778778076</real>
	</dict>
	<key>Ansi 11 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.43850564956665039</real>
		<key>Green Component</key>
		<real>0.40717673301696777</real>
		<key>Red Component</key>
		<real>0.32436618208885193</real>
	</dict>
	<key>Ansi 12 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.51685798168182373</real>
		<key>Green Component</key>
		<real>0.50962930917739868</real>
		<key>Red Component</key>
		<real>0.44058024883270264</real>
	</dict>
	<key>Ansi 13 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.72908437252044678</real>
		<key>Green Component</key>
		<real>0.33896297216415405</real>
		<key>Red Component</key>
		<real>0.34798634052276611</real>
	</dict>
	<key>Ansi 14 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.56363654136657715</real>
		<key>Green Component</key>
		<real>0.56485837697982788</real>
		<key>Red Component</key>
		<real>0.50599193572998047</real>
	</dict>
	<key>Ansi 15 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.86405980587005615</real>
		<key>Green Component</key>
		<real>0.95794391632080078</real>
		<key>Red Component</key>
		<real>0.98943418264389038</real>
	</dict>
	<key>Ansi 2 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.020208755508065224</real>
		<key>Green Component</key>
		<real>0.54115492105484009</real>
		<key>Red Component</key>
		<real>0.44977453351020813</real>
	</dict>
	<key>Ansi 3 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.023484811186790466</real>
		<key>Green Component</key>
		<real>0.46751424670219421</real>
		<key>Red Component</key>
		<real>0.64746475219726562</real>
	</dict>
	<key>Ansi 4 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.78231418132781982</real>
		<key>Green Component</key>
		<real>0.46265947818756104</real>
		<key>Red Component</key>
		<real>0.12754884362220764</real>
	</dict>
	<key>Ansi 5 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.43516635894775391</real>
		<key>Green Component</key>
		<real>0.10802463442087173</real>
		<key>Red Component</key>
		<real>0.77738940715789795</real>
	</dict>
	<key>Ansi 6 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.52502274513244629</real>
		<key>Green Component</key>
		<real>0.57082360982894897</real>
		<key>Red Component</key>
		<real>0.14679534733295441</real>
	</dict>
	<key>Ansi 7 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.79781103134155273</real>
		<key>Green Component</key>
		<real>0.89001238346099854</real>
		<key>Red Component</key>
		<real>0.91611063480377197</real>
	</dict>
	<key>Ansi 8 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.38298487663269043</real>
		<key>Green Component</key>
		<real>0.35665956139564514</real>
		<key>Red Component</key>
		<real>0.27671992778778076</real>
	</dict>
	<key>Ansi 9 Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.073530435562133789</real>
		<key>Green Component</key>
		<real>0.21325300633907318</real>
		<key>Red Component</key>
		<real>0.74176257848739624</real>
	</dict>
	<key>Background Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.15170273184776306</real>
		<key>Green Component</key>
		<real>0.11783610284328461</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Bold Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.56363654136657715</real>
		<key>Green Component</key>
		<real>0.56485837697982788</real>
		<key>Red Component</key>
		<real>0.50599193572998047</real>
	</dict>
	<key>Cursor Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.51685798168182373</real>
		<key>Green Component</key>
		<real>0.50962930917739868</real>
		<key>Red Component</key>
		<real>0.44058024883270264</real>
	</dict>
	<key>Cursor Text Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.19370138645172119</real>
		<key>Green Component</key>
		<real>0.15575926005840302</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Foreground Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.51685798168182373</real>
		<key>Green Component</key>
		<real>0.50962930917739868</real>
		<key>Red Component</key>
		<real>0.44058024883270264</real>
	</dict>
	<key>Selected Text Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.56363654136657715</real>
		<key>Green Component</key>
		<real>0.56485837697982788</real>
		<key>Red Component</key>
		<real>0.50599193572998047</real>
	</dict>
	<key>Selection Color</key>
	<dict>
		<key>Blue Component</key>
		<real>0.19370138645172119</real>
		<key>Green Component</key>
		<real>0.15575926005840302</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
</dict>
</plist>
EOF

# Material Design Colors iTerm colors - Not in use
cat >> /dev/null << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Ansi 0 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.19215686619281769</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.18431372940540314</real>
		<key>Red Component</key>
		<real>0.17647059261798859</real>
	</dict>
	<key>Ansi 1 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.31764706969261169</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.31764706969261169</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Ansi 10 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.79215681552886963</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.96470588445663452</real>
		<key>Red Component</key>
		<real>0.7254902720451355</real>
	</dict>
	<key>Ansi 11 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.49803918600082397</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.89803916215896606</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Ansi 12 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.99607843160629272</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.84313726425170898</real>
		<key>Red Component</key>
		<real>0.50196081399917603</real>
	</dict>
	<key>Ansi 13 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.67058825492858887</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.50196081399917603</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Ansi 14 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.92158126831054688</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.9924500584602356</real>
		<key>Red Component</key>
		<real>0.65526837110519409</real>
	</dict>
	<key>Ansi 15 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.99999994039535522</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.99999994039535522</real>
		<key>Red Component</key>
		<real>0.9999966025352478</real>
	</dict>
	<key>Ansi 2 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.75294119119644165</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.7450980544090271</real>
		<key>Red Component</key>
		<real>0.73725491762161255</real>
	</dict>
	<key>Ansi 3 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.25098034739494324</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.84313732385635376</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Ansi 4 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.50196081399917603</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.50196081399917603</real>
		<key>Red Component</key>
		<real>0.49803921580314636</real>
	</dict>
	<key>Ansi 5 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.50588232278823853</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.25098031759262085</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Ansi 6 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.85492348670959473</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.98838895559310913</real>
		<key>Red Component</key>
		<real>0.39322873950004578</real>
	</dict>
	<key>Ansi 7 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.34509804844856262</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.34117648005485535</real>
		<key>Red Component</key>
		<real>0.33725491166114807</real>
	</dict>
	<key>Ansi 8 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.77254897356033325</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.7450980544090271</real>
		<key>Red Component</key>
		<real>0.69019621610641479</real>
	</dict>
	<key>Ansi 9 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.50196081399917603</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.541176438331604</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Background Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.13725490868091583</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.12941177189350128</real>
		<key>Red Component</key>
		<real>0.12156862765550613</real>
	</dict>
	<key>Badge Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>0.5</real>
		<key>Blue Component</key>
		<real>0.0</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.1491314172744751</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Bold Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.92941176891326904</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.93333333730697632</real>
		<key>Red Component</key>
		<real>0.92941176891326904</real>
	</dict>
	<key>Cursor Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.5215686559677124</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.51372551918029785</real>
		<key>Red Component</key>
		<real>0.5058823823928833</real>
	</dict>
	<key>Cursor Guide Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>0.25</real>
		<key>Blue Component</key>
		<real>1</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.9268307089805603</real>
		<key>Red Component</key>
		<real>0.70213186740875244</real>
	</dict>
	<key>Cursor Text Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.0</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.0</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Foreground Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.94117647409439087</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.93333333730697632</real>
		<key>Red Component</key>
		<real>0.92549020051956177</real>
	</dict>
	<key>Link Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.73333334922790527</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.35686275362968445</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Selected Text Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.94117647409439087</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.93333333730697632</real>
		<key>Red Component</key>
		<real>0.92549020051956177</real>
	</dict>
	<key>Selection Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.54509806632995605</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.48627451062202454</real>
		<key>Red Component</key>
		<real>0.37647059559822083</real>
	</dict>
</dict>
</plist>
EOF

# Powerlevel9k Installation - In use
if [[ ! -d /usr/local/opt/powerlevel9k ]]; then
	brew tap sambadevi/powerlevel9k
	brew install powerlevel9k
fi

# Powerlevel10k Installation - Not in use ATM!

# .Zshrc configuration
if [[ ! -f ~/.zshrc ]]; then
    touch ~/.zshrc
fi
cat >> ~/.zshrc << EOF
# Load Aliases, if exists
[[ -e ~/.Aliases ]] && emulate sh -c 'source ~/.Aliases'

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

POWERLEVEL9K_MODE='nerdfont-complete'
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# Please only use this battery segment if you have material icons in your nerd font (or font)
# Otherwise, use the font awesome one in "User Segments"
prompt_zsh_battery_level() {
    local percentage1=\`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'\`
    local percentage=\`echo "\${percentage1//\%}"\`
    local color='%F{red}'
    local symbol="\uf00d"
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
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"
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

# Change current user default loginShell to Zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
exit 0