function phpcbf () {
  docker run -ti --rm -v $(pwd):/app vfalies/ci phpcbf --standard=EnvDev $@;
}

function php () {
  docker run -ti --rm -v $(pwd):/app php-cli php $@;
}

alias pdepend='docker run -ti --rm -v $(pwd):/app vfalies/ci pdepend'
alias phpmd='docker run -ti --rm -v $(pwd):/app vfalies/ci phpmd'
alias phpcpd='docker run -ti --rm -v $(pwd):/app vfalies/ci phpcpd'
alias phpunit='docker run -ti --rm -v $(pwd):/app vfalies/ci phpunit'
alias phpcs='docker run -ti --rm -v $(pwd):/app vfalies/ci phpcs'
alias phpcbf='docker run -ti --rm -v $(pwd):/app vfalies/ci phpcbf'
alias ci='docker run -ti --rm -v $(pwd):/app vfalies/ci'
alias phpmetrics='docker run -ti --rm -v $(pwd):/app vfalies/ci phpmetrics'
alias npm='docker run -ti --rm -v ~/.ssh:/root/.ssh -v $(pwd):/var/www/html vfalies/nodejs npm'
alias composer='docker run -ti --rm -v ~/.ssh:/root/.ssh -v $(pwd):/var/www/html vfalies/composer composer'
alias nodejs='docker run -ti --rm -v ~/.ssh:/root/.ssh -v $(pwd):/var/www/html vfalies/nodejs nodejs'
alias installhook='docker run -ti --rm -v $(pwd):/app vfalies/ci installhook'
alias make='docker run -ti --rm -v $(pwd):/app --entrypoint make vfalies/ci'
alias dep='docker run --rm -ti -v $(pwd):/app -v ~/.ssh:/root/.ssh vfalies/deployer'
