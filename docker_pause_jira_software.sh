#! /usr/bin/bash

# pause container
echo "Would you like to pause Jira software container?"
# echo "Please choose Y/N ?"
read -p "Choose Y/N?" ANSWER2
case "$ANSWER2" in
  [yY]|[yY][eE][sS])
  # stop container
    while read -r id; 
      do 
        if [ ! -z "$id" -a "$id" != " " ];
        then 
          docker pause CONTAINER $id
          echo "atlassian/jira-software paused!"
        fi
    done < container_id.txt
    ;;
  [nN]|[nN][oO])
  # canceling docker pause
    echo "Docker pause cancelled"
    ;;
  *)
    echo "Please enter correct input!"
    ;;
esac
