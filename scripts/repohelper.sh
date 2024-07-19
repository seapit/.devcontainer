#!/bin/bash

# # Check if the variables are set
if [[ "$1" == "init" ]]; then
  #printf "\nrepohelper.init\n"
  #printf "/workspaces/cpp/%s/.cmakefiles/templates/* /workspaces/cpp/%s/ -R\n" $2 $2 
  #mkdir -p "/workspaces/cpp/$2/apps" && mkdir -p "/workspaces/cpp/$2/libs"
  cp "${workspaceFolder}/$2/.cmakefiles/templates/apps" "${workspaceFolder}/$2" "-R"
  cp "${workspaceFolder}/$2/.cmakefiles/templates/libs" "${workspaceFolder}/$2" "-R"

elif [[ "$1" == "app" ]]; then
  #printf "\nrepohelper.app\n"
  mkdir -p "${workspaceFolder}/$2/apps/$3"
  cp "${workspaceFolder}/$2/.cmakefiles/templates/apps/App1/" "${workspaceFolder}/$2/apps/$3" "-R"

elif [[ "$1" == "module" ]]; then
  #printf "\nrepohelper.module\n"
  mkdir -p "${workspaceFolder}/$2/libs/$3"
  cp "${workspaceFolder}/$2/.cmakefiles/templates/libs/Module1/" "${workspaceFolder}/$2/libs/$3" "-R"

elif [[ "$1" == "copy" ]]; then
  #printf "\nrepohelper.module\n"
  cp "${workspaceFolder}/$2/$3" "${workspaceFolder}/$2/libs/$3" "-R"
  
elif [[ "$1" == "set active" ]]; then
  #printf "\nrepohelper.module\n"
  export activeRepo="${workspaceFolder}/$2"
else
  echo "Called task from invalid start directory (you are not in a valid repo)"
fi

# fi


