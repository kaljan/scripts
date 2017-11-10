#!/bin/bash

# -------------------------------------------------------------------
# Полезные команды архивации
# -------------------------------------------------------------------

exit


# не тестировалось
tar -cvf folder.tar /path/to/folder — без сжатия
tar -cvzf folder.tar.gz /path/to/folder — сжатие gzip
tar -cvjf folder.tar.bz2 /path/to/folder — сжатие bzip2
tar cvJf folder.tar.xz ./folder
