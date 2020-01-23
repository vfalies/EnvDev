#!/bin/bash

# Version
envdev_version=`cat ./version`

printf "Profile creator - EnvDev $envdev_version\n\n"

# Init
webserver='none'
dbserver='none'
cacheserver='none'
queuerserver='none'

# Profile name
config=''
response='Yes'
while [[ $config == '' ]]; do
    read -p "> Profile name: " config
    if [ $config = 'default' ]; then
        echo "'default' is a reserved word"
        config=''
    else
        if test -f "./profiles/${config}.env"; then
            printf "\nProfile already exist, would you overwrite it ? \n"
            select response in Yes No; do
                if [ "$response" = "Yes" ]; then
                    echo "Old profile will be overwritten."
                    break
                elif [ "$response" = "No" ]; then
                    config=''
                    break
                else
                    echo "Incorrect choice"
                fi
            done
            echo ""
        fi
    fi
done

# Projects path
project_path=''
while [[ $project_path == '' ]]; do
    read -p "> Path of your project(s): " project_path
    if [ ! -d "${project_path}" ]; then
        printf "Project(s) path not found !\n"
        project_path=''
    fi
done

# Base language
printf "\n> Base language: \n"
select response in PHP Node; do
    if [ "$response" = "PHP" ]; then
        base="php"
        break
    elif [ "$response" = "Node" ]; then
        base="node"
        break
    else
        echo "Incorrect choice"
    fi
done

printf "\n> ${response} version ?\n"
# Configuration if PHP Base
if [ ${base} = "php" ]; then
    # PHP version
    select response in 7.4 7.3 7.2 7.1 7.0 5.6; do
        if [[ "$response" =~ ^(5.6|7.0|7.1|7.2|7.3|7.4)$ ]]; then
            version=${response}
            break
        else
            echo "Incorrect choice"
        fi
    done

    # PHP architecture
    printf "\n> FPM or Alpine [FPM] ?\n"
    select response in FPM Alpine; do
        if [[ "$response" =~ ^(FPM|Alpine)$ ]]; then
            archi=${response,,}
            break
        else
            echo "Incorrect choice"
        fi
    done

    # Web server
    printf "\n> Web server ?\n"
    select response in Nginx Apache; do
        if [[ "$response" =~ ^(Apache|Nginx)$ ]]; then
            webserver=${response,,}
            break
        else
            echo "Incorrect choice"
        fi
    done
fi

# Configuration if Node Base
if [ ${base} = "node" ]; then
    # Node version
    select response in 13.6 12.14 10.18; do
        if [[ "$response" =~ ^(13.6|12.14|10.18)$ ]]; then
            version=${response}
            break
        else
            echo "Incorrect choice"
        fi
    done
    # Node architecture
    printf "\n> Alpine version ?\n"
    select response in Yes No; do
        if [[ "$response" =~ ^(Yes|No)$ ]]; then
            if [ "$response" = "Yes" ]; then
                archi="alpine"
            else
                archi="classic"
            fi
            break
        else
            echo "Incorrect choice"
        fi
    done
fi

# Common configuration

# Database
printf "\n> Database ?\n"
select response in MySQL MariaDB MongoDB None; do
    if [[ "$response" =~ ^(MySQL|MariaDB|MongoDB|None)$ ]]; then
        dbserver=${response,,}
        break
    else
        echo "Incorrect choice"
    fi
done

# Cache server
printf "\n> Cache server ?\n"
select response in Redis MemCached None; do
    if [[ "$response" =~ ^(Redis|MemCached|None)$ ]]; then
        cacheserver=${response,,}
        break
    else
        echo "Incorrect choice"
    fi
done

# Queuer server
printf "\n> Queuer server ?\n"
select response in RabbitMQ None; do
    if [[ "$response" =~ ^(RabbitMQ|None)$ ]]; then
        queuerserver=${response,,}
        break
    else
        echo "Incorrect choice"
    fi
done

# Maildev
printf "\n> Mail catcher ?\n"
select response in Maildev None; do
    if [[ "$response" =~ ^(Maildev|None)$ ]]; then
        mailcatcher=${response,,}
        break
    else
        echo "Incorrect choice"
    fi
done

# Profile file generation
if ! test -d "./profiles"; then
    mkdir profiles
fi
> ./profiles/${config}.env
echo "PROFILE_NAME="${config} >> ./profiles/${config}.env
echo "PROJECTS_PATH=${project_path}" >> ./profiles/${config}.env
echo "PROJECTS_PATH_DEST=/var/www/html/projects" >> ./profiles/${config}.env
echo "LANGUAGE_SERVER=${base}" >> ./profiles/${config}.env
cat ./environments/${base}.env >> ./profiles/${config}.env
# Custom PHP Version in profile file
if [ ${base} = 'php' ]; then
    sed -i -e "s/PHP_VERSION=7.4-fpm/PHP_VERSION=${version}-${archi}/g" ./profiles/${config}.env
fi
if [ ! $webserver = 'none' ]; then
    cat ./environments/${webserver}.env >> ./profiles/${config}.env
fi
if [ ! $dbserver = 'none' ]; then
    cat ./environments/${dbserver}.env >> ./profiles/${config}.env
fi
if [ ! $cacheserver = 'none' ]; then
    cat ./environments/${cacheserver}.env >> ./profiles/${config}.env
fi
if [ ! $queuerserver = 'none' ]; then
    cat ./environments/${queuerserver}.env >> ./profiles/${config}.env
fi
if [ ! $mailcatcher = 'none' ]; then
    cat ./environments/${mailcatcher}.env >> ./profiles/${config}.env
fi

# Default profile
printf "\n> This profile must be the default profile ?\n"
select response in Yes No; do
    if [ "$response" = "Yes" ]; then
        default=''
        response='Yes'
        while [[ $default == '' ]]; do
            if test -f "./profiles/defult.env"; then
                printf "\n> Default profile already exist, would you overwrite it ? \n"
                select responseow in Yes No; do
                    if [ "$responseow" = "Yes" ]; then
                        echo "Default profile will be overwritten."
                        default='yes'
                        cp ./profiles/${config}.env ./profiles/default.env
                        break
                    elif [ "$responseow" = "No" ]; then
                        default='no'
                        echo "Default profile not changed"
                        break
                    else
                        echo "Incorrect choice"
                    fi
                done
                echo ""
            else
                default='yes'
                cp ./profiles/${config}.env ./profiles/default.env
            fi
        done
        break
    elif [ "$response" = "No" ]; then
        break
    else
        echo "Incorrect choice"
    fi
done

# Display generation result
echo ""
echo "Profile generated."
printf "You can customized it : "
realpath ./profiles/${config}.env
echo ""
echo "To run a saved profile: make run"
echo "To run default profile: make servers"