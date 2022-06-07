#! /usr/bin/bash

# Ask would like to create Jira software container?
echo "Would you like to pull Jira software image?"
# echo "Please choose Y/N ?"
read -p "Choose Y/N?" ANSWER1

case "$ANSWER1" in
  [yY]|[yY][eE][sS])
  # pull jira software from docker hub
    echo "Pulling atlassian/jira-software"
    docker pull atlassian/jira-software
    # create data volume
    docker volume create --name jiraVolume
    # get id of the container
    id=$(docker run -v jiraVolume:/var/atlassian/application-data/jira --name="jira" -d -p8080:8080 atlassian/jira-software)
    echo "container id is ====> $id"
    echo "Access Jira-software: localhost:8080"
    touch container_id.txt
    echo $id >> container_id.txt
    ;;
  [nN]|[nN][oO])
  # canceling docker pull
    echo "Docker pull cancelled"
    ;;
  *)
    echo "Please enter correct input!"
    ;;
esac

