# MarkdownServer

[![Build Status](https://travis-ci.org/knewter/markdown_server.png)](https://travis-ci.org/knewter/markdown_server)

This will serve markdown files from a given directory, parsing them to HTML.

## Usage

First, need to make sure your CSS files are built.  This is done via compass in
ruby, so do the following:

```sh
gem install bundler
bundle
compass watch
```

Then, in another terminal, run the router:

```sh
iex -S mix
iex> MarkdownServer.Router.start
```

Then visit http://localhost:4000/pages in a browser.

## CSS

The CSS we use is built using sass.  Edit the files in `sass/` and run `compass
watch`, and the public/stylesheets files will be generated.

## License

This software is licensed under the MIT License.  See LICENSE for more
details.
