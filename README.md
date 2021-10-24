# ElixirExample

This project is just my first Elixir playground, so nothing interesting will be found here. Sorry.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_example` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_example, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_example](https://hexdocs.pm/elixir_example).

## Work log

### Prerequisites

You need to have elixir, iex and mix to work on this project.

I chose to use Docker for using Elixir.

For doing so, I am putting some scripts on my PATH.

I have in my PATH the directory `${HOME}/bin`, so I went there and created following scripts:

```
touch _elixir
chmod +x _elixir
ln -s _elixir elixir
ln -s _elixir iex
ln -s _elixir mix
```
Then I edited `_elixir` to have following content:
```
#!/usr/bin/env bash

CMD=$(basename $0)

docker run \
  --rm \
  -it \
  --name elixir \
  --volume "${PWD}":/proj \
  --workdir /proj \
  --user "${UID}" \
  elixir:1.12.3 \
  ${CMD} $@
```
So when I execute `elixir`, `iex` or `mix`, this script will be executing, using Elixir inside a docker container.

Any other way to have Elixir on your computer should work too.

### Creation of mix project
First of all I run
```
$ mix new elixir_example
```
and the project was created with this structure:
```
.
├── .formatter.exs
├── .gitignore
├── lib
│   └── elixir_example.ex
├── mix.exs
├── README.md
└── test
    ├── elixir_example_test.exs
    └── test_helper.exs
```
Then I editted this README and made the Initial commit.

### Usage
At this point, the code can be executed from `iex`.

From the project folder I run:
```
$ iex -S mix
```
and the REPL opens. And then I run:
```
iex> ElixirExample.hello()
```
and the app says
```
:world
```
