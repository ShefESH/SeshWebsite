clear;
usebrowser="None"
importbrowser="none"
driver="none"
echo -e "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@&&&&&&&&&&&&#&/&&&**&*#&&/&/&*&&&/&/#&&&&&&&&&&@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@&&&&&&&&&/*&&&%&&&&&&&&&&&&&&&&&&&&&&&**&*&%&&&&&&&&&@@@@@@@@@@@@@\n@@@@@@@@@@@&&&&&&&&&&*&/&&&&&&&&&&%((((((((((((&&&&&&&&&&(&%&%&&&&&&&@@@@@@@@@@@\n@@@@@@@@@&&&&&&&%&&/&&&&&&&&((((#&&&&&&&&&&&&&&&&(((((&&&&&&&&&&&&&&&&&&@@@@@@@@\n@@@@@@@&&&&&&&&/&/&&&&&&(((&&&&&&&&&&&&&&&&&&&&&&&&&&&#(((&&&&&%&*%&&&&&&@@@@@@@\n@@@@@@&&&&&&#*&#&&&&&&&(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&(((&&&&&&&&&&&&&&@@@@@\n@@@@&&&&&&*&&&&&&&&***&&&&&&&&&&&&&&((((((((((&&&&&&&&&&&&&&(((&&&&&*&(&&&&&@@@@\n@@@&&&&&&&&&&&&&&/**&&&&&&&&&&&&&(((%&&&&&&&&%(((&&&&&&&&&&&&&((#&&&&&*#&&&&&@@@\n@@@&&&&&&&&&&&&&**&&&&&&&&&&&&&&((%&&&&&&&&&&&&%((&&&&&&&&&&&&&&((&&&&(&&(&&&&@@\n@@&&&&&&%*&&&&&**&&&&&&&&&&&&&&(((&&&&&&&&&&&&&&(((&&&&&&&&&&&&&&((&&&&(&&&&&&&@\n@&&&&&(*&&&&&&**&&&&&&&&&&&&&&&((&&&&&&&&&&&&&&&#((&&&&&&&&&&&&&&&((&&&&&*/&&&&&\n@&&&&%&(&&&&&#*%&&&&&&&&&&&&(((((((((((((((((((((((((&&&&&&&&&&&&&((&&&&&(**&&&&\n&&&&&&&&&&&&&**&&&&&&&&&&&&&((((((((((((((((((((((((((&&&&&&&&&&&&&((&&&&&&&&&&&\n&&&&&&(((&&&&**&&&&&&&&&&&&&(((((((((((#&&#(((((((((((&&&&&&&&&&&&&((&&&&(((&&&&\n@&&&&&(((&&&&**&&&&&&&&&&&&&((((((((((&&&&&&((((((((((&&&&&&&&&&&&&(#&&&&(((&&&&\n@&&&&&(((&&&&#*%&&&&&&&&&&&&(((((((((((&&&&(((((((((((&&&&&&&&&&&&((&&&&&(((&&&&\n@&&&&&#(((&&&&**&&&&&&&&&&&&((((((((((#&&&&#((((((((((&&&&&&&&&&&&(#&&&&(((&&&&&\n@@&&&&&(((&&&&&**&&&&&&&&&&&(((((((((((&&&&(((((((((((&&&&&&&&&&&((&&&&(((#&&&&@\n@@@&&&&&(((&&&&&**&&&&&&&&&&((((((((((((((((((((((((((&&&&&&&&&((#&&&&((((&&&&@@\n@@@&&&&&&(((%&&&&#**&&&&&&&&(((((((((((((((((((((((((%&&&&&&&&&&&&&&&((((&&&&@@@\n@@@@@&&&&&((((&&&&&***&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&**/&&&&&(((&&&&&@@@@\n@@@@@@&&&&&&((((&&&&&%**#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&(**&&&&&&((((&&&&&@@@@@\n@@@@@@@&&&&&&&((((&&&&&&%***&&&&&&&&&&&&&&&&&&&&&&&&&&***&&&&&&&((((&&&&&@@@@@@@\n@@@@@@@@@&&&&&&&(((((&&&&&&&&*****&&&&&&&&&&&&&%*****&&&&&&&&((((%&&&&&@@@@@@@@@\n@@@@@@@@@@@@&&&&&&&(((((%&&&&&&&&&&&%/******(%&&&&&&&&&&&(((((#&&&&&&@@@@@@@@@@@\n@@@@@@@@@@@@@@&&&&&&&&%((((((#&&&&&&&&&&&&&&&&&&&&&&(((((((&&&&&&&&@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@&&&&&&&&&&%((((((((((((((((((((((((((&&&&&&&&&&@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&&&%####%&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&&&&&&&&&&&&&&&&&&&@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "Welcome to the ShefESH Selenium Install Bash File for Linux Users"
echo "Which system do you wish to set up for?"
options=("Chrome" "Firefox")
select opt in "${options[@]}"
do
    case $opt in
        "Chrome")
			clear;
			echo "Is Chrome Installed?"
			options1=("Install Chrome" "Already Installed Latest Version")
            select opt1 in "${options1[@]}"
			do
				case $opt1 in
					"Install Chrome")
						echo "Installing Chrome"
						wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
						sudo apt install ./google-chrome-stable_current_amd64.deb
						rm ./google-chrome-stable_current_amd64.deb
						break
						;;
					"Already Installed Latest Version")
						echo "Chrome Installed, Moving onto next step"
						break
						;;
					*) echo "invalid option $REPLY";;
				esac
				break
			done
			echo "Downloading ChromeDriver"
			wget -N https://chromedriver.storage.googleapis.com/94.0.4606.61/chromedriver_linux64.zip -P ~/Downloads
			unzip ~/Downloads/chromedriver_linux64.zip -d ~/Downloads;
			rm ~/Downloads/chromedriver_linux64.zip
			importbrowser="chrome"
			usebrowser="Chrome"
			driver=$(readlink -f ~/Downloads/chromedriver)
			break
            ;;
        "Firefox")
			echo "Downloading GeckoDriver"
			wget -N https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz -P ~/Downloads
			tar -zxvf ~/Downloads/geckodriver-v0.30.0-linux64.tar.gz -C ~/Downloads
			rm ~/Downloads/geckodriver-v0.30.0-linux64.tar.gz
			driver=$(readlink -f ~/Downloads/geckodriver);
			importbrowser="firefox"
			usebrowser="Firefox"
			break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
clear; 
echo "Python and Pip Installation:"
options=("Install Python 3.8 and Pip" "Already Installed")
select opt in "${options[@]}"
do
    case $opt in
        "Install Python 3.8 and Pip")
			sudo apt-get update
			sudo apt-get install python3.8
			sudo apt install python3-pip
			break
            ;;
        "Already Installed")
			break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
pip3 install selenium
clear; 
echo "Do you wish to test your installation:"
options=("Test Installation" "Finish")
select opt in "${options[@]}"
do
    case $opt in
        "Test Installation")
			cd ~/Downloads
			echo -e "from selenium import webdriver \nfrom selenium.webdriver.$importbrowser.service import Service \n\ndriver= webdriver.$usebrowser(executable_path=\"$driver\")\ndriver.get(\"https://www.google.com\") " >> example.py
			python3 example.py
			echo "A google webpage should have opened"
			break
            ;;
        "Finish")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
