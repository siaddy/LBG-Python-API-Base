#!/bin/bash
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then

# Exit script if any command fails
echo "🌟🌟🌟 Adding.... and Committing! 🌟🌟🌟"
set -e

git add .

git commit -m "Bash Update"

git push

echo "Git Update Pushed✨🎩"

else
  echo "booo";
fi
