
if [ -z "$GEOARROW_REF" ] && [ -d geoarrow ]; then
  GEOARROW_REF="refs/heads/main"
elif [ -z "$GEOARROW_REF" ]; then
  GEOARROW_REF="refs/heads/main"
  curl -L https://github.com/geoarrow/geoarrow/archive/$GEOARROW_REF.tar.gz |
    tar -xzf -
  mv geoarrow-main geoarrow
else
  curl -L https://github.com/geoarrow/geoarrow/archive/$GEOARROW_REF.tar.gz |
    tar -xzf -
  rm -rf geoarrow
  mv "geoarrow-$GEOARROW_REF" geoarrow
fi

if [ -z "$GEOARROW_DATA_REF" ] && [ -d geoarrow-data ]; then
  GEOARROW_DATA_REF="refs/heads/main"
elif [ -z "$GEOARROW_DATA_REF" ]; then
  GEOARROW_DATA_REF="refs/heads/main"
  curl -L https://github.com/geoarrow/geoarrow-data/archive/$GEOARROW_DATA_REF.tar.gz |
    tar -xzf -
  mv geoarrow-data-main geoarrow-data
else
  curl -L https://github.com/geoarrow/geoarrow-data/archive/$GEOARROW_DATA_REF.tar.gz |
    tar -xzf -
  rm -rf geoarrow-data
  mv "geoarrow-data-$GEOARROW_DATA_REF" geoarrow-data
fi

pushd geoarrow

for f in README.md format.md extension-types.md; do
  sed -i.bak 's/^# [ :A-Za-z-]*$//g' $f
  sed -i.bak 's/\.md/.qmd/g' $f
  rm $f.bak
done

popd

pushd geoarrow-data

for f in ./*/README.md; do
  sed -i.bak 's/^#/##/' $f
  rm $f.bak
done

popd
