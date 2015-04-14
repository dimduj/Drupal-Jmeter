#!/bin/bash
 
# The host under test.
HOST=site1.dpi247.dev


# The Drupal username prefix.
USER=toto
 
# The Drupal usern password prefix.
PASS='toto'

# The Min & Max uid generated with useername= prefix$uid and passowrd = prefix$uid 
USER_MIN_UID=200
USER_MAX_UID=200
 
# A node id to edit.
EDIT_ID=42


 
# Ramp up by factors of sqrt(2).
#for thread_count in 2 3 4 6 8 11 16 23 32 45 64 91 128 181 256 362 512
for thread_count in  2
do
  /Users/Dimitri/Code/Jmeter/apache-jmeter-2.12/bin/jmeter.sh -n -t Drupal7-Stress-Auth.jmx -Jhost=$HOST -Juser=$USER\
  -Jpassword=$PASS -Jthreads=$thread_count -Jedit_id=$EDIT_ID
done
