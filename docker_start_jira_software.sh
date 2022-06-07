#! /usr/bin/bash

# start container
echo "Would you like to start Jira software container?"
# echo "Please choose Y/N ?"
read -p "Choose Y/N?" ANSWER3
case "$ANSWER3" in
  [yY]|[yY][eE][sS])
  # start container
    while read -r id; 
      do 
        if [ ! -z "$id" -a "$id" != " " ];
        then 
          docker start $id
          echo "atlassian/jira-software started!"
          echo "Access jira-software: localhost:8080"
        fi
    done < container_id.txt
    ;;
  [nN]|[nN][oO])
  # canceling docker start
    echo "Docker start cancelled"
    ;;
  *)
    echo "Please enter correct input!"
    ;;
esac
