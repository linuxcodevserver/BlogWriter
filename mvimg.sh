#!/bin/bash
if ls img > /dev/null 2>&1
  then
  mv $1 img/
  else
  mkdir img
  mv $1 img/
fi
echo "Done."
