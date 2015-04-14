#!/bin/bash
 
# The host under test.
HOST=localhost

 
# The Drupal username prefix.
USER=user
 
# The Drupal usern password prefix.
PASS='12345'

# The Min & Max uid generated with useername= prefix$uid and passowrd = prefix$uid 
USER_MIN_UID=200
USER_MAX_UID=200
 
# A node id to edit.
EDIT_ID=42
 
# Ramp up by factors of sqrt(2).
for thread_count in 2 3 4 6 8 11 16 23 32 45 64 91 128 181 256 362 512
do
  jmeter.sh -n -t DrupalStress2.jmx -Jhost=$HOST -Juser=$USER\
  -Jpassword=$PASS -Jthreads=$thread_count -Jedit_id=$EDIT_ID
done