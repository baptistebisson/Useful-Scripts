#!/bin/bash

function commitChange() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	if [[ "$BRANCH" != "baptiste" ]]; then
		echo 'Wrong branch';
		exit 1;
	fi

	if [ -z "$(git status --porcelain)" ]; then
		echo 'Nothing to commit';
		exit 1;
	else
		git status
		read -p "Stage everything ? " -n 1 -r
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			git add *
			echo 'Type your commit message : '
			read message
			git commit -m "$message"
			git checkout dev
			git merge baptiste
			git push origin dev
			git checkout baptiste
		fi
	fi
}

function getChanges() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	if [[ "$BRANCH" != "baptiste" ]]; then
		echo 'Wrong branch';
		exit 1;
	fi

	if [ -z "$(git status --porcelain)" ]; then
		git checkout dev
		git pull origin dev
		git checkout baptiste
		git merge dev
	else
		echo 'You need to have a clean branch';
		exit 1;
	fi
}

PS3='Please enter your choice: '
options=("Commit interactive" "Get dev last commit" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Commit interactive")
            commitChange
            break
            ;;
        "Get dev last commit")
            getChanges
            break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done