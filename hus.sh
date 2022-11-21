echo 'pre-commit'
echo 'babo'
name=$(git rev-parse --abbrev-ref HEAD)
if [[ $name -eq "traefik" ]]
then
    echo $name
else
    echo "aaa"
fi
exit 0