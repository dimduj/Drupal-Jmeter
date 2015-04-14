#!/bin/bash
 
# The host under test.
HOST=site1.dpi247.dev
 
# A Drupal username.
USER=toto
 
# USER's password
PASS='toto'
 
# A node id to edit.
EDIT_ID=42
 
# Ramp up by factors of sqrt(2).
#for thread_count in 2 3 4 6 8 11 16 23 32 45 64 91 128 181 256 362 512
for thread_count in 1
do
  jmeter.sh -n -t DrupalStress.jmx -Jhost=$HOST -Juser=$USER\
  -Jpassword=$PASS -Jthreads=$thread_count -Jedit_id=$EDIT_ID
done