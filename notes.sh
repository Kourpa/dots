path=$HOME/notes
year=$(date +"%Y")
month=$(date +"%0m")
day=$(date +"%0d")
mkdir -p $path/$year/$month/

if [ -z "$1" ]
then
  name=$day.md
else
  name=$day-$1.md
fi

originalDir=$PWD
cd $path

file=$year/$month/$name

nvim $file 

cl="# Changelog"
if ! grep -Fxq "$cl" $file
then
    echo "" >> $file
    echo "" >> $file
    echo "" >> $file
    echo "$cl" >> $file
fi

git diff -U0 --no-prefix -- ":!$file" | grep '^+' | sed -r 's/\+\-/  \-/g' | sed -r 's/\+\+\+/\-/g' >> $file


git add .
git commit -m "updating notes"

cd $originalDir
