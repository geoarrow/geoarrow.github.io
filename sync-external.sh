
if [ -z "$GEOARROW_REF" ] && [ -d geoarrow ]; then
  GEOARROW_REF="refs/heads/main"
elif [ -z "$GEOARROW_REF" ]; then
  GEOARROW_REF="refs/heads/main"
  curl -L https://github.com/geoarrow/geoarrow/archive/$GEOARROW_REF.tar.gz |
    tar -xzf -
  mv geoarrow-main geoarrow
fi

pushd geoarrow

for f in README.md format.md extension-types.md; do
  sed -i.bak 's/^# [ :A-Za-z-]*$//g' $f
  sed -i.bak 's/\.md/.qmd/g' $f
  rm $f.bak
done

popd
