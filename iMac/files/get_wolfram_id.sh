#!/bin/bash

CMD1=$(ps alx | grep 'WolframKernel -script' | sed 's/[\t ]\+/\t/g' | cut -f3)
CMD2=$(ps alx | grep 'WolframKernel -script' | sed 's/[\t ]\+/\t/g' | cut -f3)

echo $CMD1 $CMD2 | sed 's/[ ]\+/\n/g' | sort -n | uniq -d
