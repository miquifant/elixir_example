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
## Notes:

Notes on the first session with @ramonpin.

----
Edit **`.formatter.ex`** to add `line_length`.
```
formatter.ex
[
    inputs: ["{mix,.formatter}.exs","{config,lib,test}/**/*.{ex,exs}"],
    line_length: 120
]
```
----
Test language from REPL.

REPL, con el contexto del proyecto (dentro del proyecto)
```
iex -S mix
```
----
Expresiones
```
iex(2)> a = if 1 > 0 do
...(2)>   2
...(2)> else
...(2)>   1
...(2)> end
2
iex(3)> a
2
```
----
Dentro del REPL, con `h` accedes a la docu de lo que sea.
`h Enum`

----
Binary (es un String) cadena entre comillas dobles.
Si es con comilla simple es una lista de caracteres.

----
En elixir no hay asignaciones.
`a = 1` no le da a `a` el valor `1`.
Se puede poner `1 = a`.
El operador `=` es una unificación, no una asignación.
Intenta hacer que se cumpla la condición.
```
# tupla
> {a, b} = {1, 2}
> a
1
> b
2
> {a, a} = {1, 2}
ERR
> a = 3
3
# ahora este `a` no es el mismo a de antes.
```
```
# lambda
> f = fn -> a end

> a = 3
4
> f.()
3
> a = 4
4
> f.()
3
# por transparencia referencial
# es como si al crear la función se hubiera sustituido la variable por su valor
> clear
```
----
Crear un script:
Creo un fichero prueba.exs sin proyecto ni na.
```
defmodule Pepe do
  @doc """
  Esto es un ejemplo de documentación.
  """
  def run() do
    :ok
  end
end

# Fuera del modulo se pueden ejecutar cosas. Solo NO se pueden crear funciones.
IO.puts(Pepe.run())
```
----
Sobre los strings:
"Miprima"
concatenar: `"Mi prima" <> " Margarita"`
```
# el `+ ` es solo para expresiones numericas.
En todo caso concatenar cadenas no suele hacer falta. Existe la interpolación
> a = "world"
world
> "Hello #{a}"
"Hello world"
# pero ademas si lo que queria era mostrarlo o volcarlo a una salida, lo hace solo
> IO.puts(["sss", "ssss", "aaa", "ddd"])
sssssssaaaddd
# él te lo concatena
```
Se pueden crear cadenas multilinea con triple comilla.
```
"""
el primer salto no lo mete
linea 2
linea 3"""
```
----
IO.puts -> imprimir, representación para usuario
IO.inspect -> representación de programa
```
> a = "miqui"
> IO.puts(a)
miqui
> IO.inspect(a)
"miqui"
# Las tuplas se pueden inspeccionar pero no imprimir
```
----
Símbolos o átomos: Empiezan por `:` y luego vienen caracteres.
Se usan para representar cosas que en otros lenguajes serían enumeraciones.
Una vez creado un átomo es el mismo en todo el sistema.
:ok o :error
ocupan menos memoria

----
Crear un fichero dentro del proyecto.
Meterlo en carpetas como paquetes Java.
creo: `session/one/prueba.ex`
```
defmodule Session.One.Prueba do
  ...
end
```
Crear una función rfactorial y cargar en REPL para probarla.
Sales y vuelves a entrar al REPL o recompile(force: true)
```
defmodule Session.One.Prueba do
  # Implementación tradicional
  #def factorial(n) do
  #  if n == 0 do
  #    1
  #  else
  #    n * factorial(n - 1)
  #  end
  #end

  # Mejor implementación
  def factorial(0) do
    1
  end
  def factorial(n) do
    n * factorial(n - 1)
  end
end
```
en REPL
```
> recompile(force: true) 
Compiling 2 files (.ex)
Generated elixir_workshop app
:ok
> Session.One.Prueba.factorial(10)
3628800
```
Syntax alternativa:
```
defmodule Session.One.Prueba do
  def factorial(0), do: 1
  def factorial(n), do: n * factorial(n - 1)

  def fibo(0), do: 1
  def fibo(1), do: 1
  def fibo(n), do: fibo(n - 1) + fibo(n - 2)
end
```
Uso alias para no escribir cada vez Session.One.Prueba.fibo
```
> alias Session.One.Prueba
Session.One.Prueba
> Prueba.fibo(1)
1
> Prueba.fibo(2)
2
> Prueba.fibo(3)
3
> Prueba.fibo(4)
5
> Prueba.fibo(5)
8
> Prueba.fibo(6)
13
```
Sin números:
```
  def concat({a, b}), do: "#{a}#{b}"
  # resto de casos
  def concat(_), do: :error
  # AUNQUE EN ELIXIR SE SUELE DEJAR QUE FALLE, NO SE CAPTURA ASI
  # Si no está definida la llamada se deja fallar
```
Guardas:
```
def fibo(n) when n > 1, do: fibo(n - 1) + fibo(n - 2)

# existen funciones del módulo kernel (ver Kernel.)
# se usan sin importar Kernel
```
is_number, is_atom, ...
Hacer una guarda no es solo hacer una funcion que devuelva bool.
En la docu aparecen con `guard: true`

----
Además de los alias tenemos los `import`

----
