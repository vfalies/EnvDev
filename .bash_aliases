function phpcbf () {
  docker run -ti --rm -v $(pwd):/app vfalies/ci phpcbf --standard=EnvDev $@;
}

alias pdepend='docker run -ti --rm -v $(pwd):/app vfalies/ci /ci/ci.sh pdepend'
alias phpmd='docker run -ti --rm -v $(pwd):/app vfalies/ci /ci/ci.sh phpmd'
alias phpcpd='docker run -ti --rm -v $(pwd):/app vfalies/ci /ci/ci.sh phpcpd'
alias phpunit='docker run -ti --rm -v $(pwd):/app vfalies/ci /ci/ci.sh phpunit'
alias phpcs='docker run -ti --rm -v $(pwd):/app vfalies/ci /ci/ci.sh phpcs'
alias phing='docker run -ti --rm -v $(pwd):/app vfalies/ci phing'
alias ci='docker run -ti --rm -v $(pwd):/app vfalies/ci phing -f /ci/build.xml'
alias phpmetrics='docker run -ti --rm -v $(pwd):/app vfalies/ci phing -f /ci/build.xml phpmetrics'
alias npm='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools npm'
alias composer='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools composer'
alias bower='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools bower --allow-root '
alias nodejs='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools nodejs'
alias grunt='docker run -ti --rm -v $(pwd):/var/www/html vfalies/tools grunt'
alias installhook='docker run -ti --rm -v $(pwd):/app vfalies/ci /ci/ci.sh installhook'
