#!/bin/bash
set -e
DB=tutorlink
mysql -u root -p -e "DROP DATABASE IF EXISTS $DB; CREATE DATABASE $DB;"
for f in sql/0*.sql; do
  echo "Running $f"
  mysql -u root -p $DB < "$f"
done
mysqldump -u root -p --databases $DB --routines --triggers --events > TutorLink_Final.sql
cat sql/07_security.sql >> TutorLink_Final.sql
echo "Done: TutorLink_Final.sql"