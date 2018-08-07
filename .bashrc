export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if which docker &> /dev/null; then
  alias docker-cleanup-images="docker images | grep '<none>' | awk '{ print \$3 }' | xargs docker rmi"
  alias docker-cleanup-volumes="docker volume prune -f"
  function docker-cleanup {
    docker-cleanup-images
    docker-cleanup-volumes
  }
fi
