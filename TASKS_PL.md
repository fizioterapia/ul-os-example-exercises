# Zadania

1. Wypisz na ekranie listę wszystkich różnych aktualnie zalogowanych użytkowników w formacie:
LOGIN --- IMIĘ i NAZWISKO --- UID --- (LICZBA RÓWNOCZESNYCH SESJI)

2. Wypisz na ekranie w porządku rosnącym wszystkie liczby całkowite K z zakresu L < K < P, niebędące wartością UID jakiegokolwiek użytkownika systemu. Liczby L,P mają być wprowadzane jako parametry skryptu.

3. Wypisz na ekranie ile jest zwykłych plików o nazwach zaczynających się na literę, będącą pierwszym parametrem skryptu, w katalogach podanych jako kolejne parametry wywołania wraz z sumarycznym rozmiarem tych plików. Skrypt musi reagować na brak przynajmniej 2 parametrów. Wyjście powinno wyglądać jak poniżej:
Nazwa katalogu 1 --- liczba szukanych plików w katalogu 1 --- sumaryczny rozmiar
Nazwa katalogu 2 --- liczba szukanych plików w katalogu 2 --- sumaryczny rozmiar
itd.

4. Wypisz na ekranie informację, czy napis podany jako parametr skryptu jest palindromem (wielkość liter i znaki interpunkcyjne nie gają roli). Skrypt musi reagować na brak parametru. Przykładowe wyjście dla parametru: K. a. j! a, kaJak.
Napis "K. a. j! a, kaJak." jest palindromem

5. Wypisz listę K najczęściej zalogowanych użytkowników w bieżącym miesiącu. Liczba K ma być parametrem skryptu a lista ma mieć wygląd jak poniżej:
LOGIN --- IMIĘ i NAZWISKO --- UID --- (LICZBA LOGOWAŃ)

6. Utwórz skrypt, który co K sekund (K ma być podane jako parametr skryptu) dopisuje do pliku /tmp/zmiany identyfikatory użytkowników, którzy zakończyli sesję w tym czasie oraz tych, którzy ją rozpoczęli Przed każdym nowym zapisem do pliku należy dopisać aktualny czas.

7. Zapisz do pliku niezalogowani.lista w katalogu domowym listę tych użytkowników systemu o numerach UID z podanego zakresu L < P, którzy którzy NIE logowali się w systemie w czasie ostatnich N logowań do systemu. Liczby L, P oraz N mają być parametrami skryptu a lista ma mieć wygląd jak poniżej:
LOGIN --- IMIĘ i NAZWISKO --- UID

8. Stwórz plik etc.all, będący połączeniem początkowych 20 linii ze wszystkich plików z katalogu /etc, które możesz czytać. Przed treścią każdego pliku umieść linię z nazwą dopisywanego pliku jak: /* --- NAZWA AKTUALNEGO PLIKU --- */  
Na końcu pliku etc.all dopisz liczbę plików, z których zostało coś odczytane.

9. Spowoduj, aby na ekranie, w jednej i tej samej linii co 5 sekund była wypisywana taka liczba gwiazdek ile jest aktualnie nawiązanych połączeń TCP. Należy wykorzystać wynik polecenia "netstat -apt 2>/dev/null" (wartość ESTABLISHED w szóstej kolumnie). Wypisywany tekst ma mieć wygląd jak poniżej:  
    Liczba aktywnych połączeń:
\************************************

10.  Wypisz na standardowe wyjście listę wszystkich plików z katalogu /etc, które możesz czytać. Przy nazwie każdego pliku umieść dwie liczby całkowite: liczbę wszystkich linii pliku oraz liczbę linii NIE zaczynających się znakiem #.

11.  Zapisz do pliku o nazwie będącej pierwszym parametrem skryptu listę wszystkich procesów działających dłużej niż podana jako drugi parametr liczba minut. Zignoruj procesy, dla których czas uruchomienia jest oznaczeniem daty (np. Jun10). Lista powinna zawierać następujące informacje:  
NUMER_PROCESU NAZWA_PROCESU CZAS_URUCHOMIENIA WŁAŚCICIEL

12. Utwórz skrypt (używający własnych deskryptorów plików) umożliwiający odczytywanie danych z podanego pliku lub z klawiatury i zapisanie odczytanego tekstu do napotkanej pierwszej pustej linii w jednym pliku a pozostałej częsci tekstu w drugim pliku wynikowym. Nazwy plików wynikowych mają byc parametrami skryptu zaś wybór źródła danych powinien byc dokonany poprzez interaktywne menu umożliwiające również zakończenie skryptu. Skrypt powinien być odporny na błędne nazwy, brak parametrów itp. 