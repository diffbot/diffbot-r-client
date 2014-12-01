# Diffbot R API
Diffbot is a simple function that can be used to get the JSON response of any URL provided with parameters to this function. [Diffbot API](http://www.diffbot.com/products/automatic/). Currently it supports Article, FrontPage, Product, Image and Classifier (Analyze) APIs.


## Requirements

The following files and R-packages will be needed to use this API:

Files:
* Diffbot.R

R-packages:
* RCurl
* RJSONIO


## Installation

### Step 1: Install packages
```
install.packages(c('RCurl', 'RJSONIO'))
```
### Step 2: Source the diffbot.R file:
```
source('path_to_diffbot_api_file\diffbot.R')
```


## Usage

This library is written stright forward. Some examples are presented. The file *Demo.R* show a live example. Please obtain a developer token from the website. The function *diffbot* will return a R list.

### Example 1:

```
source('diffbot.R');     % Source the diffbot function 

url     <- 'http://www.xconomy.com/san-francisco/2012/07/25/diffbot-is-using-computer-vision-to-reinvent-the-semantic-web'
token   <- 'DIFFBOT_TOKEN'
api     <- 'analyze'
fields  <- NULL
version <- 2
r_return <- diffbot(url, token, api, fields, version)   # returns a easily accessible R list
```

**Note:** no backslash at the end of the url!


For detailed available parameters consult [Product API docs] (http://www.diffbot.com/products/automatic/product/).


### Example 2: (Specifying fields)
The user can specify a single or a set of multiple fields

To specify a single field the argument field can be kept as Syntax:
```
fields  <- c('Field_Name')
```

**Usage:**
```
fields  <- c('title')
```

To specify multiple field the values can be separated by a comma.

**Syntax:**
```
fields <- c('Field_1', 'Field_2', 'Field_3')
```

**Usage:**
```
fields  <- c('title','text')
```

### Example 3: ( Using values returned)
	
To View contents of the Structure Type
```
r_return
```

To View names of the Structure Type
```
names(r_return)
```

The Sub Fields can be vied or used by adding a $ after the structure name


**Example:** To view the name of the author type

```
r_return$author
```

-Initial commit by Simon Müller-

