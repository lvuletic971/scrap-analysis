## Data Model Documentation

This folder contains the logical data model of the Manufacturing Waste Analysis data warehouse.

The warehouse is designed using a **star schema**, with a central fact table that stores manufacturing transactions and several surrounding dimensions describing:

* articles (products)
* production processes
* error types and causes
* time

The diagram illustrates table structure, primary and foreign key relationships, and overall dimensional organization.
