#!/bin/sh

pdfs=`fd . '/home/aboud/personal/documents/pdfs' | grep "\.pdf" | fuzzel -d -l 10` || exit 1
zathura "$pdfs"

