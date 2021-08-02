## Overview
Ballerina connector for Notion API provides access to Notion's pages, databases, and users. It builds interactive experiences for users within Notion.

This module supports 2021-05-13(v1) version.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [Notion](https://www.notion.so/) Account
* Obtaining tokens
1. Obtain your token by creating an integration. Go to settings->integration. Follow [this link](https://developers.notion.com/docs/authorization) for more information
 
## Quickstart

To use the notion connector in your Ballerina application, update the .bal file as follows:

### Step 1 - Import connector
First, import the ballerinax/notion module and others into the Ballerina project.
```ballerina
import ballerinax/notion;
```
### Step 2 - Create a new connector instance
You can initialize the client as follows using ballerina configurable variables.
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
notion:ClientConfig clientConfig = { 
    authConfig : authConfig
};
notion:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke  connector operation
1. Invoke connector operations using the client
Get user detail by providing user ID
```ballerina
public function main() returns error? {
    notion:User response = check baseClient->retrieveUser(<UserID>);
}
``` 
2. Use `bal run` command to compile and run the Ballerina program.

## Quick reference
Code snippets of some frequently used functions:
* Retrieve database by ID
```ballerina
notion:Database response = check baseClient->retrieveDatabase(<DatabaseID>);
```