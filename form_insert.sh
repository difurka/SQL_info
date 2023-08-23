#!/bin/bash

PATH=$(pwd)
{
  echo "CALL csv_import('peers', '$PATH/TestData/peers.csv', ',');";
  echo "CALL csv_import('timetracking', '$PATH/TestData/timetracking.csv', ',');";
  echo "CALL csv_import('timetracking', '$PATH/TestData/timetracking_real.csv', ',');";
  echo "CALL csv_import('recommendations', '$PATH/TestData/recommendations.csv', ',');";
  echo "CALL csv_import('friends', '$PATH/TestData/friends.csv', ',');";
  echo "CALL csv_import('tasks', '$PATH/TestData/tasks.csv', ',');";

} > insert.sql

echo "CALL csv_import('xp', '$PATH/TestData/xp.csv', ',')" > insert_xp.sql;