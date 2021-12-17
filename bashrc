source ~/git-completion.bash
source ~/git-prompt.sh

export PS1='🟢\[\e[0;39m\]$CHE_MACHINE_NAME\[\e[0;39m\]:\[\e[38;5;215m\]\w\[\e[0;39m\]\[\e[1;32m\]$(__git_ps1 " (%s)")\n\[\e[38;5;215m\]>_ \[\e[0m\]'

echo "              ##,             "
echo "         ,###########         "
echo "     (##################(        Welcome to Eclipse Che"
echo " (##########################(*"
echo "############################*    Namespace: ${CHE_WORKSPACE_NAMESPACE}"
echo "############,   ,(#####.         Workpace: ${CHE_WORKSPACE_NAME}"
echo "#######(*                    ,   Container: ${CHE_MACHINE_NAME}"
echo "###(*.                   .****"
echo "/*******/.          .,**/*****"
echo "/************.  .*************"
echo "/*****************************"
echo "  *************************/  "
echo "      ,*********/*******      "
echo "           ********,          "
echo ""
