# Proyecto de compiladores
## Lexer - Analizador léxico (generado con Flex)
- Como parte del proyecto se ha comenzado con un analizador léxico, primero con uno generado mediante Flex
- Las reglas que sigue están en el archivo 'lexer.l'

### Generando el analizador léxico...
- **Requisitos:**
  - Tener GCC o Clang instalado en el sistema operativo ya que Flex genera código C que se debe compilar para generar el ejecutable
  - Tener Flex instalado, _por lo general en las distribuciones de Linux ya se encuentra instalado_
- Procedimiento
  - Para generar el "lexer" usaremos el siguiente comando de Flex
  ```bash
  flex -o lexer.c lexer.l
  ```

	- Se debe haber generado el archivo 'lexer.c' tal como se ha especificado en el comando anterior, por lo que ahora procederemos a compilar con GCC o Clang. Con GCC el comando sería tal que así:
  ``` bash
  	#Si lo compila en Windows necesitará poner 'lexer.exe' después de la opción -o en lugar de solo 'lexer'
  	gcc lexer.c -o lexer -lfl #La opción '-lfl' es para enlazar el ejecutable a las bibliotecas de Flex
  ```

	- Con Clang sería así:
  ``` bash
  	clang lexer.c -o lexer -lfl
  ```

	- El ejecutable generado se llama 'lexer', para poder ejecutarlo correctamente es necesario que al ejecutarlo se acompañe del nombre del archivo de entrada. Usando de ejemplo el archivo 'entrada.txt' que se encuentra en este mismo repo sería tal que así:
  ``` bash
  	./lexer entrada.txt	#Si lo ejecuta en PowerShell el comando sería con '\' en lugar de '/'
  ```

	- Si ha funcionado este debió generar en la terminal una salida parecida a la siguiente:
  ```bash
  	Identificador: abc
      Asignación: =
    Entero: 12
    Entero: 13
    Entero: 4
    Entero: 5
    Entero: 6
    Real: 3.40
    Real: 3.14
    Entero: 3
    Operador: +
    Entero: 4
    Entero: 3
    Operador: -
    Entero: 4
    Entero: 4
    Operador: --
    Entero: 4
    Operador: ++
    Entero: 4
    Relación: >
    Entero: 6
    Entero: 4
  Relación: <=
  Entero: 5
  Entero: 6
  Relación: <>
  Entero: 5
  Entero: 4
  Relación: <
  Entero: 6
  Entero: 8
  Relación: >=
  Entero: 10
  Palabra reservada: while
  Palabra reservada: when
  Identificador: what
  Identificador: whey
  Identificador: whi2
  Identificador: whil2
  Identificador: while3
  Identificador: when3
  ```
  - ***Comando opcional:*** Si desea guardar la salida generada en un archivo de texto, por ejemplo en el archivo 'salida.txt', puede ejecutar el ejecutable con el siguiente comando '>' en un sistema tipo Unix
  ```bash
  	./lexer entrada.txt > salida.txt
  ```
## Pendiente
- Añadir una opción para guardar la salida del programa en un archivo de texto en el mismo lexer generado para no usar utilidades del sistema y hacer el programa más portable y que no solo sea para sistemas tipo Unix
