cd build/web 

git init
git add .
git commit -m "Deploying changes"
git branch -M main
git remote add origin https://vinaykhare@github.com/vinaykhare/vinaykhare.github.io.git
git push -u -f origin main

@echo "✅ Finished deploy:"