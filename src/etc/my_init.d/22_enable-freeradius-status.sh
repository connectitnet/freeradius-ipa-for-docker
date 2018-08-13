#!/bin/bash
if [ "$ENABLE_FREERADIUS_STATUS" == "True" ] ; then
    ln -sv /etc/freeradius/sites-available/status /etc/freeradius/sites-enabled/
fi
