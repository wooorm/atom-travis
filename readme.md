# atom-travis [![Build Status](https://img.shields.io/travis/wooorm/atom-travis.svg)](https://travis-ci.org/wooorm/atom-travis)

Install [Atom](https://atom.io) on Travis.

## Usage

Add the following line to your `.travis.yml`:

```diff
 os:
 - linux
 - osx
 script:
+- bash <(curl -s https://raw.githubusercontent.com/wooorm/atom-travis/master/install.sh)
+- export DISPLAY=":99"
 - npm test
```

That’s it, now `atom` and `apm` are in your $PATH when running your
`script`s (note: the `DISPLAY` line is not needed for macOS).

## License

[MIT](LICENSE) © [Titus Wormer](http://wooorm.com)
