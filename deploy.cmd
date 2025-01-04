copy google6b5666910c947583.html build/web
cd build/web 

git init
git add .
git commit -m "Deploying changes"
git branch -M main
git remote add origin https://vinaykhare@github.com/vinaykhare/profile.git
git push -u -f origin main

@echo "✅ Finished deploy:"