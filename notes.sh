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
nvim $path/$year/$month/$name 
cd $originalDir
