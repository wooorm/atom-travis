#!/bin/sh

echo
echo "Downloading atom"
echo

bin="$HOME/bin"
mkdir -p "$bin"

if [ "$TRAVIS_OS_NAME" = "osx" ]; then
  curl -s -L "https://atom.io/download/mac?channel=stable" \
    -H 'Accept: application/octet-stream' \
    -o "atom.zip"

  root="/Applications"

  mkdir -p "$root"
  unzip -oq atom.zip -d "$root"
  rm atom.zip

  ln -s "$root/Atom.app/Contents/Resources/app/atom.sh" "$bin/atom"
  ln -s "$root/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm" "$bin/apm"
else
  curl -s -L "https://atom.io/download/deb?channel=stable" \
    -H 'Accept: application/octet-stream' \
    -o "atom.deb"

  /sbin/start-stop-daemon --start --quiet --pidfile /tmp/custom_xvfb_99.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -ac -screen 0 1280x1024x16

  root="$HOME/atom"

  dpkg-deb -x atom.deb "$root"

  ln -s "$root/usr/bin/atom" "$bin/atom"
  ln -s "$root/usr/bin/apm" "$bin/apm"
fi

echo
echo "Using atom ($(which atom)) version:"
echo

atom -v

echo
echo "Using apm ($(which apm)) version:"
echo

apm -v
