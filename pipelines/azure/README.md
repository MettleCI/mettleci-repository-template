      ___                      ______ _            _ _
     / _ \                     | ___ (_)          | (_)
    / /_\ \_____   _ _ __ ___  | |_/ /_ _ __   ___| |_ _ __   ___  ___
    |  _  |_  / | | | '__/ _ \ |  __/| | '_ \ / _ \ | | '_ \ / _ \/ __|
    | | | |/ /| |_| | | |  __/ | |   | | |_) |  __/ | | | | |  __/\__ \
    \_| |_/___|\__,_|_|  \___| \_|   |_| .__/ \___|_|_|_| |_|\___||___/
                                       | |
    MettleCI DevOps for DataStage      |_| (C) 2020-2024 Data Migrators

# Introduction

This repository ships with a number of different YAML pipelines (described below) each fulfilling a different use case.  
Some of these pipeline definitions also make use of reusable pipelines components called *pipeline templates* as required.

### Pipelines

| File | Description |
|------|-------------|
| `devops-ci.yml`      | A DevOps continuous integration pipeline intended to be triggered by the commit of a DataStage asset to your repository.  This pipeline demonstrates the invocation of Compliance and Unit Testing functions and the deployment of code to downstream environments |
| `hotfix-ci.yml`      | A pipeline which performs CI testing (Compliance and Unit Test operations) on a hotfix-specific branch of your code. |
| `hotfix-create.yml`  | A pipeline which deploys your current DataStage software configuration from a hotfix-specific code branch directly into your production environment. |

### Templates

| File | Description |
|------|-------------|
| `ccmt-template.yml`        |  A template which wraps the `mettleci datastage ccmt` command documented [here](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/410681364/DataStage+Connector+Migration+Command). |
| `compliance-template.yml`  |  A template which wraps the `mettleci compliance test` commands documented [here](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/408322069/Compliance+Test+Command). |
| `deploy-template.yml`      |  A template which deploys your current DataStage software configuration stored in Git to a specified target environment. |
| `unittest-template.yml`    |  A template which establishes the conditions necessary for executing a MettleCI unit test in your CI environment, then invokes that test using the `mettleci unittest test` command (documented [here](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/718831617/UnitTest+Test+Command)) then publishes the resulting JUnit output. |

### ADO-Setup.txt

This file provides practical examples of how you can us the Microsoft Azure Command Line Interface to automate the creation 
of all the assets necessary to establish a working Azure DevOps pipeline using the capabilities of MettleCI.

# Documentation

Start [here](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/741310465/Azure+DevOps).
