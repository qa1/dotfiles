#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : stopwatch.sh
#
# [] Creation Date : 21-07-2020
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================
python3 -m termdown -a $@
if [ $? -eq 1  ]; then
        python3 -m pip install termdown
fi
