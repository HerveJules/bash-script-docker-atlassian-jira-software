#! /usr/bin/bash

# destroy container
echo "Would you like to destroy Jira software container?"
# echo "Please choose Y/N ?"
read -p "Choose Y/N?" ANSWER5
case "$ANSWER5" in
  [yY]|[yY][eE][sS])
    while read -r id; 
      do 
        if [ ! -z "$id" -a "$id" != " " ];
        then 
          docker rm -f $id
          docker rmi -f $id
          rm container_id.txt
          echo "atlassian/jira-software destroyed!"
        fi
    done < container_id.txt
   
    ;;
  [nN]|[nN][oO])
  # canceling docker rm
    echo "Docker rm cancelled"
    ;;
  *)
    echo "Please enter correct input!"
    ;;
esac
