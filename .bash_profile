
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Git branch in prompt.
#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

push_to_origin_current_branch() {
    git push origin $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')
}

pull_from_origin_current_branch() {
    git pull origin $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')
}

git_dry_run() {
    git merge --no-commit --no-ff $1
}

alias gpulc="pull_from_origin_current_branch"
alias gpusc="push_to_origin_current_branch"
alias art="php /Users/sachit/equiem-fsm/src/artisan"
alias art-q="cd /Users/sachit/equiem-fsm/src && php artisan queue:listen --queue='default,mail,cortex' --sleep=5 --tries=5"
alias art-log="tail -f /Users/sachit/equiem-fsm/src/storage/logs/laravel.log"
alias art-serve="cd /Users/sachit/Homestead && vagrant up && browser-sync start --proxy 'fsm.dev.app' --open='external' --host='fsm.local' --files '/Users/sachit/equiem-fsm/src/resources'"
alias start_review="/Users/sachit/Desktop/scripts/start_review"
alias stop_review="/Users/sachit/Desktop/scripts/stop_review"
alias git-merge-dry="git_dry_run"
alias run-test="/Users/sachit/equiem-fsm/src/vendor/phpunit/phpunit/phpunit --testsuite Unit Tests"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias migrate="art migrate"
alias c="clear"
alias dcc="docker ps -a | awk '{print $1}' | grep -v CONTAINER | xargs docker rm"
alias dci="docker images | awk '{print $3}' | grep -v IMAGE | xargs docker rmi"
alias dd="/Users/sachit/equiem-fsm/docker-dev"
alias irisc="cd /Users/sachit/Desktop/workspace/iris && bin/docker-compose exec client"
alias irisa="cd /Users/sachit/Desktop/workspace/iris && bin/docker-compose exec api"
alias iris="cd /Users/sachit/Desktop/workspace/iris && bin/docker-compose"
alias lintrb="irisa bundle exec rubocop"
alias iristb="irisa rails spec"
alias irisconsole="irisa rails console"
alias iris-seed="irisa rails db:create db:migrate db:seed"
alias ilint="irisc yarn lint"
alias itest="irisc yarn test"
alias g="git"
alias co="git checkout"
alias cm="git commit -m {$1}"
alias portal-sync="irisa rake portal:sync"
alias rc="irisa rails console"
