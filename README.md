[![Build Status](https://travis-ci.org/iamjohnnym/salesforce-session.svg?branch=master)](https://travis-ci.org/iamjohnnym/salesforce-session)
[![Coverage Status](https://coveralls.io/repos/github/iamjohnnym/salesforce-session/badge.svg)](https://coveralls.io/github/iamjohnnym/salesforce-session)

# SalesForce Session Library

## Overview

A python wrapper for [simple-salesforce](https://github.com/simple-salesforce/simple-salesforce).  The general purpose is to help build queries without having to write raw SQL. 

## Installation

From PYPI

```
pip install salesforce-session
```

From Github

```
git clone git@github.com:iamjohnnym/salesforce-session.git
```

## Usage

### Security Token

In order for the session to be created, you need to create a security token if
you haven't already done so.  You can follow the guide below on how to do so.

[Get Your Session Token](https://help.salesforce.com/articleView?id=user_security_token.htm)

### Invocation


```python

"""You must pass in a SFDC Object for a series of cases to build the proper
analytics."""
from salesforce_session import SalesForceSession

salesforce = SalesForceSession(
                username='your.sf.email@domain.com',
                password='201vp283pjpaf]as',
                security_token='sf.generated-security#token',
                client_id='name_service_uses_when_hitting_api'
                )

records = salesforce.query(
                query_type='SELECT',
                fields=['Status','Priority'],
                sql_objects='Case',
                conditions="Status='New'",
                limit=1
                )
```

The above method constructs the following statement:

`SELECT Status, Priority FROM Case WHERE Status='New' LIMIT 1`

This then excutes the `simple_salesforce.query_all()` method, converts the results to json and returns that object.

### Testing

```base
pip install -r requirements.txt
pip install -r requirements-test.txt
cd ${PATH}/salesforce-session
nosetests --with-cov --cov salesforce_session/
```

## Features

* SalesForce Session
  * Persistent Sessions
* SQL Builder
  * Statement Validator
  * Statement Generator

## Purpose

Streamlining the process for connecting to SalesForce SFDC while generating
SQL statements based methods passed.  This should help fluid usage over
multiple integrations.

## Contribute

Do your thing, make some MR's.  

## Report Bugs

Please toss up any bugs here:

[Issues](http://github.com/iamjohnnym/salesforce-session/issues)
