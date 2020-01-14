#!/bin/bash
source .env

printf "EnvDev profile creator 1.0\n\n"

# Profile name
config=''
response='Yes'
while [[ $config == '' ]]; do
    read -p "> Profile name: " config
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
    select response in 5.6 7.0 7.1 7.2 7.3 7.4; do
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
    select response in Apache Nginx; do
        if [[ "$response" =~ ^(Apache|Nginx)$ ]]; then
            webserver=${response,,}
            break
        else
            echo "Incorrect choice"
        fi
    done

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
fi

# Profile file generation
> ./profiles/${config}.env
echo "PROJECTS_PATH=${project_path}" >> ./profiles/${config}.env
echo "PROJECTS_PATH_DEST=/var/www/html/projects" >> ./profiles/${config}.env
echo "LANGUAGE_SERVER=${base}" >> ./profiles/${config}.env
cat ./environments/${base}.env >> ./profiles/${config}.env
# Custom PHP Version in profile file
if [ ${base} = 'php' ]; then
    sed -i -e "s/PHP_VERSION=7.4-fpm/PHP_VERSION=${version}-${archi}/g" ./profiles/${config}.env
fi
cat ./environments/${webserver}.env >> ./profiles/${config}.env
if [ ! $dbserver = 'none' ]; then
    cat ./environments/${dbserver}.env >> ./profiles/${config}.env
fi
if [ ! $cacheserver = 'none' ]; then
    cat ./environments/${cacheserver}.env >> ./profiles/${config}.env
fi
if [ ! $queuerserver = 'none' ]; then
    cat ./environments/${queuerserver}.env >> ./profiles/${config}.env
fi

# Display generation result
echo ""
echo "Profile generated."
printf "You can customized it : "
realpath ./profiles/${config}.env
echo ""
echo "To run a saved profile type: make run"