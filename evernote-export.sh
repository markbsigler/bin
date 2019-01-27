# python tool to convert Evernote export file (enex) to text
# reminder to do some arg validation
INPUT=$1 
OUTPUT=$2
CMD="ever2simple"
if [ -x "$(command -v $CMD)" ]
then
  $CMD $INPUT --output $OUTPUT --format dir
else
  echo "$CMD not found" >&2
fi
