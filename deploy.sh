bundle exec middleman build
cd build && git add . && git commit -m "update" 
git push -f origin master
git push -f gitcafe master:gitcafe-pages
cd ../
