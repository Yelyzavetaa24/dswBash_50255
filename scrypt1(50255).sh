#!/bin/bash

# sprawdzenie, czy podano odpowiednią liczbę argumentów
if [ "$#" -lt 4 ]; then
  echo "Użycie: $0 imię nazwisko rok_urodzenia daneUsera.txt"
  exit 1
fi

# pobranie argumentów lub zapytanie użytkownika o brakujące informacje
imie=$1
if [ -z "$imie" ]; then
  read -p "Podaj imię: " imie
fi

nazwisko=$2
if [ -z "$nazwisko" ]; then
  read -p "Podaj nazwisko: " nazwisko
fi

rok=$3
if [ -z "$rok" ]; then
  read -p "Podaj rok urodzenia: " rok
fi

dane=$4

# wyliczenie wieku
aktualny_rok=$(date +%Y)
wiek=$((aktualny_rok - rok))

# powitanie użytkownika i wypisanie wieku
echo "Witaj $imie $nazwisko! Masz $wiek lat."

# funkcja silnia
function silnia_rekurencyjnie {
  if [ "$1" -eq 0 ]; then
    echo 1
  else
    local prev=$(silnia_rekurencyjnie $(($1 - 1)))
    echo $(($1 * $prev))
  fi
}

function silnia_petla {
  local wynik=1
  for (( i=1; i<=$1; i++ )); do
    wynik=$((wynik * i))
  done
  echo $wynik
}

# obliczenie silni wieku
silnia_rek=$(silnia_rekurencyjnie $wiek)
silnia_pet=$(silnia_petla $wiek)

# zapisanie informacji do pliku
echo "$imie,$nazwisko,$rok,$wiek,$silnia_rek,$silnia_pet" >> $dane
