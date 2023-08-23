#!/bin/bash

TODAY=$(date +%Y-%m-%d)
YESTERDAY=$(date -v -1d +%Y-%m-%d)
DAY2=$(date -v -2d +%Y-%m-%d)
DAY3=$(date -v -3d +%Y-%m-%d)
DAY4=$(date -v -4d +%Y-%m-%d)
DAY5=$(date -v -5d +%Y-%m-%d)
DAY6=$(date -v -6d +%Y-%m-%d)
{
  echo "id, peer, date, time, state";
  echo "294,matinish,$TODAY,12:00,1
295,matinish,$TODAY,21:00,2
296,ereva,$TODAY,10:00,1
297,ereva,$TODAY,14:00,2
298,cmerlyn,$TODAY,04:00,1
299,cmerlyn,$TODAY,23:00,2
300,ereva,$YESTERDAY,10:00,1
301,ereva,$YESTERDAY,12:00,2
302,ereva,$YESTERDAY,13:00,1
303,ereva,$YESTERDAY,15:00,2
304,ereva,$YESTERDAY,22:00,1
305,ereva,$YESTERDAY,23:30,2
306,cmerlyn,$YESTERDAY,07:00,1
307,cmerlyn,$YESTERDAY,11:30,2
308,cmerlyn,$YESTERDAY,14:00,1
309,cmerlyn,$YESTERDAY,15:30,2
310,cmerlyn,$YESTERDAY,21:00,1
311,cmerlyn,$YESTERDAY,23:30,2
312,romildab,$YESTERDAY,08:00,1
313,romildab,$YESTERDAY,09:00,2
314,romildab,$YESTERDAY,13:30,1
315,romildab,$YESTERDAY,14:00,2
316,romildab,$YESTERDAY,14:30,1
317,romildab,$YESTERDAY,15:30,2";
echo "318,matinish,$DAY2,10:00,1
319,matinish,$DAY2,13:00,2
320,ereva,$DAY3,10:00,1
321,ereva,$DAY3,13:00,2
322,ereva,$DAY3,13:30,1
323,ereva,$DAY3,15:00,2
324,ereva,$DAY3,15:30,1
325,ereva,$DAY3,20:00,2
326,cmerlyn,$DAY4,08:00,1
327,cmerlyn,$DAY4,09:00,2
328,cmerlyn,$DAY4,12:30,1
329,cmerlyn,$DAY4,15:00,2
330,cmerlyn,$DAY4,15:30,1
331,cmerlyn,$DAY4,16:00,2
332,cmerlyn,$DAY4,16:30,1
333,cmerlyn,$DAY4,17:00,2
334,romildab,$DAY5,05:00,1
335,romildab,$DAY5,06:15,2
336,romildab,$DAY5,12:30,1
337,romildab,$DAY5,13:30,2
338,romildab,$DAY5,18:30,1
339,romildab,$DAY5,19:00,2
340,romildab,$DAY5,19:30,1
341,romildab,$DAY5,20:00,2
342,romildab,$DAY5,21:30,1
343,romildab,$DAY5,23:00,2
344,peachgha,$DAY5,10:00,1
345,peachgha,$DAY5,10:15,2
346,peachgha,$DAY5,12:15,1
347,peachgha,$DAY5,12:30,2
348,peachgha,$DAY5,13:30,1
349,peachgha,$DAY5,14:00,2
350,peachgha,$DAY5,15:30,1
351,peachgha,$DAY5,16:00,2
352,peachgha,$DAY5,17:30,1
353,peachgha,$DAY5,18:00,2
354,peachgha,$DAY5,20:30,1
355,peachgha,$DAY5,22:00,2";
} > TestData/timetracking_real.csv