#!/bin/bash

# Sprawdzenie czy został podany argument z nazwą pliku
if [ -z "$1" ]; then
  read -p "Podaj nazwę pliku: " plik
else
  plik=$1
fi

# Sprawdzenie czy plik z Zad1 istnieje
if [ ! -f "skrypt.sh" ]; then
  echo "Plik skrypt.sh nie istnieje!"
  exit 1
fi

# Dodanie ścieżki do skryptu do zmiennej PATH
if [[ ! ":$PATH:" == *":$(pwd):"* ]]; then
  echo "Dodaję ścieżkę $(pwd) do zmiennej PATH"
  export PATH=$PATH:$(pwd)
fi

# Utworzenie katalogu daneUsera i przeniesienie pliku do tego katalogu
mkdir -p daneUsera
mv $plik daneUsera/

# Wyświetlenie zawartości obecnego folderu i dopisanie do pliku daneUsera/daneUsera.txt
ls -la >> daneUsera/daneUsera.txt