#!/bin/bash

# -------------------------------------------------------------------
# Полезные скрипты
# -------------------------------------------------------------------

exit

# -------------------------------------------------------------------
# Цветной вывод на консоль и подобное
echo -en "\e[1m[\e[34mTRACE MARKER\e[0;1m] [\e[0;36mFUNCTION\e[0;1m:\e[0;33mLINE\e[0;1m]\e[32m Message \e[0;1m;\e[0m \n"

\e[0m   # все атрибуты по умолчанию
\e[1m   # жирный шрифт (интенсивный цвет)
\e[2m   # полу яркий цвет (тёмно-серый, независимо от цвета)
\e[4m   # подчеркивание
\e[5m   # мигающий
\e[7m   # реверсия (знаки приобретают цвет фона, а фон -- цвет знаков)

\e[22m  # установить нормальную интенсивность
\e[24m  # отменить подчеркивание
\e[25m  # отменить мигание
\e[27m  # отменить реверсию

\e[30m  # чёрный цвет знаков
\e[31m  # красный цвет знаков
\e[32m  # зелёный цвет знаков
\e[33m  # желтый цвет знаков
\e[34m  # синий цвет знаков
\e[35m  # фиолетовый цвет знаков
\e[36m  # цвет морской волны знаков
\e[37m  # серый цвет знаков

\e[40m  # чёрный цвет фона
\e[41m  # красный цвет фона
\e[42m  # зелёный цвет фона
\e[43m  # желтый цвет фона
\e[44m  # синий цвет фона
\e[45m  # фиолетовый цвет фона
\e[46m  # цвет морской волны фона
\e[47m  # серый цвет фона

# -------------------------------------------------------------------
# Полезный кусочек для поиска файлов с похожими именами в папках 
# Выводит файлы с одинаковыми именами и их количество
# Что бы вывести только путь, без имени файла нужно вместо %f указать %h
find ./ -type f -name lib*.so -printf '%f\n' | sort | uniq -dc

# -------------------------------------------------------------------
# Взять текущее имя каталока без пути
${PWD##*/}

# -------------------------------------------------------------------
# Символические ссылки
ln -s /path/to/some/thing /link/name

# -------------------------------------------------------------------
# скачивание с интернета при помощи wget и задание нужного имени файла
wget <link> -O file.name

# -------------------------------------------------------------------
# узнать погоду
curl wttr.in

# -------------------------------------------------------------------
# Вывести из файла строки с 175 по 195
sed -n 175,195p filename

# -------------------------------------------------------------------
# Пример логирование вывода
make 2>&1 | tee `pwd`/build.log

# -------------------------------------------------------------------
# При помощи этого скрипта выводим все пути, которые были в логе сборки MAKE
cat ~/work/logs/chalcat_build.log | sed -e s/\'//g | sed 's/-I /-I/g' | sed 's/[()]//g' | tr ' ' '\n' | grep "\-I" | sort | uniq | sed 's/-I//g' | sed '/-f/d' | sed '/^$/d'

cat ~/work/logs/chalcat_build.log # Выкидываем в основной вывод лог
sed -e s/\'//g # удаляем все кавычки
sed 's/-I /-I/g' # Удаляем пробелы между ключом -I и путём
sed 's/[()]//g' # удаляем все скобки
tr ' ' '\n' # заменяем все пробелы на перенос строки
grep "\-I" # отсеиваем всё не нужное
sort # сортируем
uniq # отсеиваем повторения
sed 's/-I//g' # удаляем все ключи
sed '/-f/d' # удаляем все не нужные ключи
sed '/^$/d' # удаляем все пустые строки

# -------------------------------------------------------------------
# При помощи этого скрипта из выходного лога сборки make выковыривается 
# всё что касается дефайнов

cat ~/work/logs/chalcat_build.log | sed -e s/\'//g | tr ' ' '\n' | grep "\-D" | sort | uniq | sed 's/-D/DEFINES += /g'

cat ~/work/logs/chalcat_build.log # Выводит содержимое лога на экран
sed -e s/\'//g # удаляет все ковычки
tr ' ' '\n' # заменяет все пробелы на перенос строки
grep "\-D" # отсеивает все кроме строк содержащих строку -D
sort # сортирует
uniq # удаляет все повторения
sed 's/-D/DEFINES += /g' # заменяет -D на DEFINES += 

# -------------------------------------------------------------------
# Офигенно крутой и полезный шаблон
ls `find ./ -name lib*.so | sed 's/\/lib[[:graph:]]*.so//' | sort | uniq`


