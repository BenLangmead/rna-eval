#!/bin/sh

echo make | qsub -d `pwd` -l pvmem=6G -
