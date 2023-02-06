#!/usr/bin/bash

isDir(){
    if [[ -d $1 ]];
    then
        echo -e "\t$1 exists and is a directory."
        return 0
    else
        echo -e "\t$1 is not a directory."
        return 1
    fi
}

isFile(){
    if [[ -f $1 ]];
    then
        echo -e "\t$1 exists and is a file."
        return 0
    else
        echo -e "\t$1 is not a file."
        return 1
    fi
}

backup(){
    local BACKUP=$(basename $1)

    echo "BACKUP $BACKUP"

    if isDir $1
    then
        if isDir ./$BACKUP
        then
            rm -rf ./$BACKUP
        fi

        cp -r $1 ./$BACKUP
        echo -e "\tBackup $BACKUP success"
    else
        if isFile $1
        then
            if isFile ./$BACKUP
            then
                rm -f ./$BACKUP
            fi

            cp $1 ./$BACKUP
            echo -e "\tBackup $BACKUP success"
        else
            echo -e "\t$1 is not exist"
        fi
    fi


    if [[ $2 ]]
    then
        if isDir ./$2
        then
            mv $BACKUP ./$2
            echo -e "\tMove $BACKUP to ./$2 success"
        else
            mkdir $2
            mv $BACKUP ./$2
            echo -e "\tMove $BACKUP to ./$2 success"
        fi
    fi 

}
# backup alacritty config
ALACRITTY=~/.config/alacritty/alacritty.yml

backup $ALACRITTY

# backup vscode config
VSCODE=('/.config/Code/User/settings.json' '/.config/Code/User/keybindings.json' '/.config/Code/User/snippets/')

for d in ${VSCODE[@]}
do
    backup $HOME"${d}" ".vscode"
done

# backup tmux config
TMUX=~/.tmux.conf

backup $TMUX

# backup neovim config
NVIM=~/.config/nvim

backup $NVIM
