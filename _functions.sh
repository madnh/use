#!/usr/bin/env bash

function ensurePathExists(){
    local TARGET_PATH="$1"

    if [ ! -e "$TARGET_PATH" ]; then
        echo "Path \"$TARGET_PATH\" is not exists!"

        exit 1
    fi
}

function ensureFileExists(){
    local TARGET_PATH="$1"

    if [ ! -f "$TARGET_PATH" ]; then
        echo "File \"$TARGET_PATH\" is not exists!"

        exit 1
    fi
}

function ensureDirExists(){
    local TARGET_PATH="$1"

    if [ ! -d "$TARGET_PATH" ]; then
        echo "Folder \"$TARGET_PATH\" is not exists!"

        exit 1
    fi
}

function ensureDirNotEmpty(){
    local TARGET_PATH="$1"
    
    if [ -z "$(ls -A $TARGET_PATH)" ]; then
        echo "$TARGET_PATH is empty"

        exit 1
    fi
}



function line() {
    echo '--------------------------------------------------'
}

function shortLine() {
    echo '-------------------'
}


function step(){
    echo 
    echo 
    echo $1
    echo "------------------------"
}

function completed(){
    local MESSAGE=${1:-Done}

    echo -e "${FG_GREEN}${ICON_HEAVY_CHECK}  ${FG_DEFAULT} ${MESSAGE}  ${RESET}"
}

function success(){
    completed "Success"
}

function _done(){
    completed "Done"
}

function errorMessage(){
    local MESSAGE="$1"

    echo -e "${BG_RED} ${FG_WHITE} ${MESSAGE} ${RESET}"
}

function _confirm {
    local confirm_message="${1:- Are you sure you want to do it? ${}}"
    local confirm_title="${2:-Confirm}"

    echo
    echo -e "---------   ${FG_YELLOW}${confirm_title}${FG_DEFAULT}   ---------"
    echo

    read -p "${FG_BLUE}> ${confirm_message} (y/N): ${FG_DEFAULT}" confirm
    echo


    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] ; then
        return 0
    else
        return 1
    fi
}