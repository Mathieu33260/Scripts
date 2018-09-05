#!bin/bash
FOLDER=${PWD##*/};
README="README.md";
GITIGNORE=".gitignore";
curl -u 'Mathieu33260' https://api.github.com/user/repos -d "{\"name\":\"${FOLDER}\"}";
git init;
git remote add origin git@github.com:Mathieu33260/${FOLDER}.git;

if [ ! -e "${README}" ]; then
 echo "# Readme.md" >> README.md;
fi

if [ ! -e "${GITIGNORE}" ]; then
 echo "# Compiled source #\
###################\
*.com\
*.class\
*.dll\
*.exe\
*.o\
*.so\
\
# Packages #\
############\
# it's better to unpack these files and commit the raw source\
# git has its own built in compression methods\
*.7z\
*.dmg\
*.gz\
*.iso\
*.jar\
*.rar\
*.tar\
*.zip\
\
# Logs and databases #\
######################\
*.log\
*.sql\
*.sqlite\
\
# OS generated files #\
######################
.DS_Store\
.DS_Store?\
._*\
.Spotlight-V100\
.Trashes\
ehthumbs.db\
Thumbs.db\
\
*.idea" >> .gitignore;
fi

git add .;
git commit -m "Initial commit";
git push -u origin master;
