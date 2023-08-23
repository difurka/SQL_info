all: build

build:
	-psql -U postgres -c 'CREATE DATABASE info21;'
	psql -U postgres -d info21 < ./part1.sql
	psql -U postgres -d info21 < ./part2.sql
	bash form_insert.sh
	bash form_csv_real.sh
	psql -U postgres -d info21 < ./insert.sql
	psql -U postgres -d info21 < ./insert_checks.sql
	psql -U postgres -d info21 < ./insert_xp.sql
	rm insert.sql insert_xp.sql TestData/timetracking_real.csv
	psql -U postgres -d info21 < ./part3.sql
	-psql -U postgres -c 'CREATE DATABASE stand;'
	psql -U postgres -d stand < ./part4.sql

clean:
	psql -U postgres -d info21 < ./drop_info.sql
	psql -U postgres -d stand < ./drop_stand.sql
