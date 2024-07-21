#!/bin/bash

repo="${workspaceFolder}/$2"

temp_top_apps="${repo}/.cmakefiles/templates/apps"
temp_top_libs="${repo}/.cmakefiles/templates/libs"
temp_bot_app="${repo}/.cmakefiles/templates/apps/App1/"
temp_bot_lib="${repo}/.cmakefiles/templates/libs/Lib1"

# # Check if the variables are set
if [[ "$1" == "init" ]]; then
  #printf "\nrepohelper.init\n"
  #printf "/workspaces/cpp/%s/.cmakefiles/templates/* /workspaces/cpp/%s/ -R\n" $2 $2 
  #mkdir -p "/workspaces/cpp/$2/apps" && mkdir -p "/workspaces/cpp/$2/libs"
  cp "${{temp_top_apps}}" "${repo}" "-R"
  cp "${{temp_top_libs}}" "${repo}" "-R"

elif [[ "$1" == "app" ]]; then
  #printf "\nrepohelper.app\n"
  mkdir -p "${repo}/apps/$3"
  cp "${temp_bot_app}" "${repo}/apps/$3" "-R"

elif [[ "$1" == "module" ]]; then
  #printf "\nrepohelper.module\n"
  mkdir -p "${repo}/libs/$3"
  cp "${temp_bot_lib}/"* "${repo}/libs/$3/" "-R"

elif [[ "$1" == "copy" ]]; then
  #printf "\nrepohelper.module\n"
  cp "${repo}/$3" "${repo}/libs/$3" "-R"
  
# elif [[ "$1" == "setactive" ]]; then
#   #printf "activeRepo=${workspaceFolder}/$2\n"
#   echo "activeRepo=${repo}" > ${workspaceFolder}/.devcontainer/activeRepo.env
#   source ${workspaceFolder}/.devcontainer/activeRepo.env
else
  echo "Called task from invalid start directory (you are not in a valid repo)"
fi

# fi


