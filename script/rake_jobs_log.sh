#!/bin/bash
  cd ../log/
  tar cvf `date  +%d_%m_%y_rake_jobs`.tar rake_jobs.log
  cat /dev/null > rake_jobs.log


