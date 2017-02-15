function phpcbf () {
  docker run -ti --rm -v $(pwd):/app vfalies/ci phpcbf --standard=EnvDev $@;
}

alias pdepend='docker run -ti --rm -v $(pwd):/app vfalies/ci pdepend'
alias phpmd='docker run -ti --rm -v $(pwd):/app vfalies/ci phpmd'
alias phpcpd='docker run -ti --rm -v $(pwd):/app vfalies/ci phpcpd'
alias phpunit='docker run -ti --rm -v $(pwd):/app vfalies/ci phpunit'
alias phpcs='docker run -ti --rm -v $(pwd):/app vfalies/ci phpcs'
alias ci='docker run -ti --rm -v $(pwd):/app vfalies/ci'
alias phpmetrics='docker run -ti --rm -v $(pwd):/app vfalies/ci phpmetrics'
alias npm='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools npm'
alias composer='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools composer'
alias bower='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools bower --allow-root '
alias nodejs='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools nodejs'
alias grunt='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools grunt'
alias installhook='docker run -ti --rm -v $(pwd):/app vfalies/ci installhook'
