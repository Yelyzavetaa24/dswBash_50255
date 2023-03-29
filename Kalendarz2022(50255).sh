#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Błędna liczba argumentów. Podaj numer dnia i miesiąc." >&2
  exit 1
fi

day=$(date -d "$2/$1/2022" "+%A" 2> /dev/null)

if [ $? -ne 0 ]; then
  echo "Błąd: nieprawidłowe dane wejściowe." >&2
  echo "Nieprawidłowe dane wejściowe: $1 $2" >> bledy.txt
  exit 1
fi

echo "Dzień tygodnia: $day"
echo "Dzień tygodnia: $day" >> wynik.txt
