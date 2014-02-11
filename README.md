# MarkdownServer

This is a live-updating markdown server for a directory containing markdown
files.

## Usage

To use, `mix deps.get`, then:

```sh
MARKDOWN_SERVER_DIR=/tmp/markdown/ iex -S mix
```

You have to have a slash at the end of the `MARKDOWN_SERVER_DIR`

## Development

```sh
mix deps.get
mix test
```

Hack on things, keep tests green.
