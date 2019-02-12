#!/bin/sh

cd $(dirname $0)

time R --vanilla --slave < R_pf.R


