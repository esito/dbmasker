# dbmasker

This project contains resources for [DBmasker](http://www.esito.no/dbmasker) example project. It demostrates anonymization/masking of a hotel booking systems database.

## Prerequisites to run the program ##

The example uses Java, Maven and Derby database. It is tested with the versions:

- java 1.8
- maven 3.3.3
- derby 10.13.1.1

Adjust the create-db.cmd or create-db.sh database creation script to use Derby jars from your Derby installation. 

## Using the samples ##

Clone the repository: git clone https://github.com/esito/dbmasker.git

Files which are part of the project:

- hotelsample\src\main\java: source files which represents custom implementations
- hotelsample\src\main\resources: text files used in the masking process
- hotelsample\database: database files
	- schema to create a derby database
	- insert statements to populate the database

### Create and populate the database ###

Open a command shell and cd to hotelsample\database. Edit DERBY_HOME of create-db.cmd/create-db.sh to satisfy your Derby installation and run the script. It will create the database/hotelsample folder, containing the Derby database with data.

### Generate the anonymization program ###

Use the hotelsample.ano file as the **Anonymizer model** parameter to the service on http://dbservices.esito.no/generate.html. Press the **download source ZIP file** button and unpack the zip to the cloned project **dbmasker/hotelsample**.

**Connect class**

### Using Maven, edit pom.xml ###
 
The generated source may be built using Maven. Add the Derby depedencies to the pom.xml file (you may change the version number):

    <dependency>
        <groupId>org.apache.derby</groupId>
        <artifactId>derbyclient</artifactId>
        <version>10.13.1.1</version>
    </dependency>
    <dependency>
        <groupId>org.apache.derby</groupId>
        <artifactId>derbynet</artifactId>
        <version>10.13.1.1</version>
    </dependency>
    <dependency>
        <groupId>org.apache.derby</groupId>
        <artifactId>derby</artifactId>
        <version>10.13.1.1</version>
    </dependency>

To build the hotelsample program run **mvn install**, which creates the target/hotelsample-0.0.1.jar file.

### Run the generated program ###

From the hotelsample folder, run **java -jar target/hotelsample-0.0.1.jar cmd**

	Commands:
	trace                 - shows more messages
	help                  - shows this page
	config                - creates a local config.properties used for changing connection parameters
	ping                  - test database connection
	tasks                 - outputs list of tasks
	run                   - runs all tasks except erase and sar tasks
	run <tasks>           - runs a list of space delimited tasks, erase and sar actions are excluded
	erase <task> <params> - runs erase actions for a specified task with a series of space delimited
	                        parameters. If parameter contains a space, surround it with quotation marks
	sar <task> <params>   - creates a SAR export for a specified task with a series of space delimited
	                        parameters. XML and JSON files will be created in the working directory
	cmd                   - takes continued input from standard input (stdin)
	quit                  - quits program
	>

Check that the database connection is ok: run the **ping** command.

A set of tasks is defined, to see a list, run the **tasks** command:

	Available tasks:
	Anonymize
		Anonymize_CUSTOMER (CUSTOMER - CREDITCARD EMAIL NAME PHONE)
		Anonymize_ROOMCATEGORY (ROOMCATEGORY - INITIALPRICE)
		Delete_HOTELCHAIN (HOTELCHAIN)
		Fix_ADDRESS (ADDRESS - POSTALCODE)
	Create
		Create_HOTELCHAIN (HOTELCHAIN)
		Create_HOTEL (HOTEL)
		Create_ROOM (ROOM)
	Advanced
		Anonymize_HOTEL (HOTEL - NAME)
		Anonymize_ADDRESS (ADDRESS - HOMEADDRESS)
		Anonymize_ROOMCATEGORY (ROOMCATEGORY - ID)
		Anonymize_BOOKING (BOOKING - FROMDATE ID TODATE)
		Anonymize_ROOM (ROOM - ID)
	ForgetMe
		Erase_CUSTOMER (CUSTOMER)
	SubjectAccess
		SAR_CUSTOMER (CUSTOMER)

Turn on verbose mode, run the **trace** command.

Run a task: **run anonymize**.

To stop the program, run **quit**.