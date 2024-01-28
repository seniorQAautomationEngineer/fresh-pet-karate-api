----------------------
INSTRUCTION
----------------------
Karate API test framework for Typicode API


----------------------
 Run tests by maven 
----------------------
```
mvn clean test
```
----------------------
 Run test project by Runner
----------------------

- Find Runner.java in src\test\java\com\freshpet\runner, set up number of threads and click run all tests

----------------------
Run by feature file.
----------------------

-Open any feature file and run separate test scenario or feature file

----------------------


----------------------
Settings:
----------------------
- karate-config.js  (envs, Urls, data source, ssl)
- Runner.java (multithread, Cucumber reports, tags, env)
- logback-test.xml (level and settings of logs)


----------------------
Reports and logs:
----------------------
- open target and find dozens Cucumber or Karate html reports and logs.
- the best test report has name karate-summary.html
- all logs in Karate.log


