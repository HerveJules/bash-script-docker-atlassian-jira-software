#! /usr/bin/bash

#  stop container
echo "Would you like to stop Jira software container?"
# echo "Please choose Y/N ?"
read -p "Choose Y/N?" ANSWER4
case "$ANSWER4" in
  [yY]|[yY][eE][sS])
  # stop container
   while read -r id; 
      do 
        if [ ! -z "$id" -a "$id" != " " ];
        then 
          docker stop $id
          echo "atlassian/jira-software stopped!"
        fi
    done < container_id.txt
    ;;
  [nN]|[nN][oO])
  # canceling docker stop
    echo "Docker stop cancelled"
    ;;
  *)
    echo "Please enter correct input!"
    ;;
esac
