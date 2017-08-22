function phpcbf () {
  docker run -ti --rm -v $(pwd):/app vfalies/ci phpcbf --standard=EnvDev $@;
}

function php () {
  docker run -ti --rm -v $(pwd):/app php-cli php $@;
}

alias phpunit='docker run -ti --rm -v $(pwd):/app --link mongodb:mongo --link db:db --net envdev_default php-cli vendor/bin/phpunit'
alias phpmetrics='docker run -ti --rm -v $(pwd):/app vfalies/ci phpmetrics'
alias npm='docker run -ti --rm -v ~/.ssh:/root/.ssh -v $(pwd):/var/www vfalies/nodejs npm'
alias node='docker run -ti --rm -v ~/.ssh:/root/.ssh -v $(pwd):/var/www vfalies/nodejs node'
alias composer='docker run -ti --rm -v ~/.ssh:/root/.ssh -v $(pwd):/var/www/html vfalies/composer composer'
alias nodejs='docker run -ti --rm -v ~/.ssh:/root/.ssh -v $(pwd):/var/www/html vfalies/nodejs nodejs'
alias dep='docker run --rm -ti -v $(pwd):/app -v ~/.ssh:/root/.ssh vfalies/deployer'
alias yarn='docker run --rm -ti -v $(pwd):/app -v ~/.ssh:/root/.shh vfalies/yarn yarn'
