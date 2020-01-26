# atom-travis [![Build Status](https://img.shields.io/travis/wooorm/atom-travis.svg)](https://travis-ci.org/wooorm/atom-travis)

Install [Atom][] on Travis.

## Use

Add the following lines to your `.travis.yml`:

```diff
 os:
 - linux
 - osx
 script:
+- bash <(curl -s https://raw.githubusercontent.com/wooorm/atom-travis/master/install.sh)
+- export DISPLAY=":99"
 - npm test
```

That’s it, now `atom` and `apm` are in $PATH when running `script`s (note: the
`DISPLAY` line is needed for linux).

## License

[MIT][] © [Titus Wormer][author]

[atom]: https://atom.io

[mit]: license

[author]: https://wooorm.com
