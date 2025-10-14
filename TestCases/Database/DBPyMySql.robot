*** Settings ***
Library       DatabaseLibrary
Library       OperatingSystem

Suite Setup         Connect To Database     pymysql     ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}
Suite Teardown      Disconnect from Database

${DBName}       mydb
${DBUser}       root
${DBPass}       root
#${DBHost}   localhost
${DBHost}       127.0.0.1
${DBPort}       3306

*** Test Cases ***
Create person table     #create table in database
    ${output}= Execute Sql String  Create table person(id integer, first_name varchar(20), last_name varchar(20));
    log to console  ${output}
    #Should Be String   ${output}    none
    should be equal as string    ${output}    none

Inserting data in person table
    #single record
    ${output}= Execute Sql String  Insert into person values(101, "John", "canady");
    log to console  ${output}
    should be equal as string    ${output}    none

Inserting multiple data in person table
    #multiple record
    ${output}= Execute Sql Script  ./TestData/mydb_person_insertData.sql
    log to console  ${output}
    should be equal as string    ${output}    none

Check David record present in Person Table
    Check If Exists In Database     select id from mydb.person where firs_name="David";

Check Jio record not present in Person Table
    Check If Not Exists In Database     select id from mydb.person where firs_name="Jio";

Check person table exist in mydb database
    Table Must Exist    person

Verify row count is zero
    #DEPRECATED
    Row Count Is 0  Select * FROM mydb.person WHERE firs_name="xyz"; #Use new
    Check Row Count  SELECT id FROM person WHERE first_name = 'xyz' ==   0


Verify row count is equl to some value
    #DEPRECATED
    Row Count Is Equal To X  Select * FROM mydb.person WHERE firs_name="David"; 1
    #Use new
    Check Row Count  SELECT id FROM person WHERE first_name = 'David' ==   1

Update record in person table
    ${output}= Execute Sql String  update mydb.person set first_name= "Jio" where id=104;
    log to console  ${output}
    should be equal as string    ${output}    none

Retrieve Records from Person Table
    #list variable
    @{queryResults}=    Query  Select * FROM mydb.person;
    log to console  many    @{queryResults}

Delete Records from Person Table
    ${output}= Execute Sql String  Delete from mydb.person;
    log to console  ${output}
    should be equal as string    ${output}    none