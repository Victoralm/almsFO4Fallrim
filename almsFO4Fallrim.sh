#!/bin/bash


####################### Run Fallrim Save Cleaner on Linux #####################
#title           :almsFO4Fallrim.sh
#description     :This script smooths the usage of Fallrim on Linux
#author          :Victoralm (victoralmlinx@gmail.com)
#date            :2018/11/30
#version         :0.2    
#usage           :./almsFO4Fallrim.sh
#notes           :Install Java 8 and Fallrim to use this script, then edit the paths below.
#bash_version    :versão 4.4.19(1)-release (x86_64-pc-linux-gnu)
###############################################################################



########################## EDIT THIS PATHS AS DESIRED #########################
### Edit the Savegame path as desired
fo4savepath="NEEDTOBECHANGED"
# Example:
# fo4savepath="$HOME/Documentos/My Games/Fallout4/Saves/"

### Edit the Fallrim path as desired
fallrimpath="NEEDTOBECHANGED"
# Example:
# fallrimpath="$HOME/Downloads/ForWine/F4_Mods/FallrimTools 4.0.1 (alpha)-22633-4-0-1-1540939948/FallrimTools"
########################## EDIT THIS PATHS AS DESIRED #########################



profile="$HOME/.profile"
# Get the path of the current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
RED='\033[0;31m'
GREEN='\033[0;32m'
LCYAN='\033[1;36m'
LPURPLE='\033[1;35m'
NC='\033[0m' # No Color

cd "${fo4savepath}"


menu()
{
    if [ ${fo4savepath} == "NEEDTOBECHANGED" ] && [ ${fallrimpath} == "NEEDTOBECHANGED" ]; then
        echo -e "${RED}First you need to edit the ${GREEN}fo4savepath${RED} and ${GREEN}fallrimpath${RED} in this script."
        echo -e "${NC}Actual value of fo4savepath: ${LPURPLE}${fo4savepath}${NC}"
        echo -e "Actual value of fallrimpath: ${LPURPLE}${fallrimpath}${NC}"
    else
        echo
        echo "########## Fallrim Alms Script ##########"
        echo "If not done yet, Fallrim can be downloaded from:"
        echo "https://www.nexusmods.com/fallout4/mods/22633?tab=files"
        echo "Choose one of the following options."
        echo "Enter only the number of the desired option."
        echo "Options:"
        echo
        echo -e "${LCYAN}1${NC}. Run Fallrim with the last save"
        echo -e "${LCYAN}2${NC}. Run Fallrim with one of the last 10 saves"
        echo -e "${LCYAN}3${NC}. Create an alias for this script on the ~/.profile. After that, you can call this script from anywhere by typing: fallrim"
        echo -e "${LCYAN}4${NC}. Exit script"
        read opcao
        case $opcao in
            1) runLastSave ;;
            2) wichSave ;;
            3) createAlias ;;
            4) exit ;;
            *) "Unknown entry!" ; echo ; menu ;;
        esac
    fi
}


# Function: Clean the return of $(ls -l -t | grep .fos | head -1) to get only the filename
get_file_name()
{
    arrsavename=()
    for word in $1
    do
        arrsavename+=("${word}")
    done
    echo ${arrsavename[-1]}
}


createAlias()
{
    clear
    # Creating an alias for the script on the ~/.profile
    theAlias="alias fallrim='${DIR}/./almsFO4Fallrim.sh'"
    # echo "Profile: ${profile}"
    # echo "The alias: ${theAlias}"
    if $(grep -q "${theAlias}" "${profile}"); then
        echo "Great, you already has the alias."
        menu
    else
        echo "Hunm, no alias found..."
        echo "$theAlias" >> ${profile}
        $(source ${profile})
    fi
}

### Function: Runs Fallrim with the desired save
runFallrim()
{
    $(java -jar "${fallrimpath}"/FallrimTools.jar "${fo4savepath}"$1)
}

### Function: Opens the Fallrim to clean the last savegame
runLastSave()
{
    lastestsave=$(ls -l -t | grep .fos | head -1)
    retvalue=$(get_file_name "${lastestsave}")
    echo "Opening the save: $retvalue"
    # Opens the desired save in Fallrim
    # $(java -jar "${fallrimpath}"/FallrimTools.jar "${fo4savepath}""${retvalue}")
    $(runFallrim "${retvalue}")
}


### Function: Enable to chose one of the last 10 saves to open in Fallrim
runOneOfLast10Saves()
{
    arrFNfirst10saves=()
    first10saves=$(ls -l -t | grep .fos | head -10)
    for line in "${first10saves}"; do
        i=0
        for word in ${line}; do
            if [[ ${word} == *".fos" ]]; then
                arrFNfirst10saves[i]+=$(echo ${word})
                i=$(expr $i + 1)
            fi
        done
    done
}


# Function: Backup save before opens in Fallrim
bkSave()
{
    $(cp $1 $1.almsBk)
}


### Function to select wich save to open in Fallrim
wichSave()
{
    runOneOfLast10Saves
    clear
    echo "Choose one of the following options."
    echo "Enter only the number of the desired option."
    echo "Options:"
    echo
    for((i=0;i<"${#arrFNfirst10saves[@]}";i++)); do
        echo "${i} - ${arrFNfirst10saves[$i]}"
    done
    read opcao
    case $opcao in
        0) $(runFallrim "${arrFNfirst10saves[0]}") ;;
        1) $(runFallrim "${arrFNfirst10saves[1]}") ;;
        2) $(runFallrim "${arrFNfirst10saves[2]}") ;;
        3) $(runFallrim "${arrFNfirst10saves[3]}") ;;
        4) $(runFallrim "${arrFNfirst10saves[4]}") ;;
        5) $(runFallrim "${arrFNfirst10saves[5]}") ;;
        6) $(runFallrim "${arrFNfirst10saves[6]}") ;;
        7) $(runFallrim "${arrFNfirst10saves[7]}") ;;
        8) $(runFallrim "${arrFNfirst10saves[8]}") ;;
        9) $(runFallrim "${arrFNfirst10saves[9]}") ;;
        10) exit ;;
        *) "Unknown entry!" ; echo ; menu ;;
    esac
}


menu