
if [ -z "$GEOARROW_REF" ] && [ -d geoarrow ]; then
  GEOARROW_REF="refs/heads/main"
elif [ -z "$GEOARROW_REF" ]; then
  GEOARROW_REF="refs/heads/main"
  curl -L https://github.com/geoarrow/geoarrow/archive/$GEOARROW_REF.tar.gz |
    tar -xzf -
  mv geoarrow-main geoarrow
fi
