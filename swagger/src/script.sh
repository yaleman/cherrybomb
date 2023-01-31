for branch in $(git branch -l | awk '{print $1}'); do
  if [ "$branch" == "master" ]; then
    continue
  fi

  # Check if the local branch exists in origin
  git checkout $branch
  if ! git rev-parse origin/$branch > /dev/null 2>&1; then
    git branch -D $branch
  fi
done
