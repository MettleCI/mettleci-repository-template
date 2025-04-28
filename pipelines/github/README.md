     __  __      _   _   _       ____ ___
    |  \/  | ___| |_| |_| | ___ / ___|_ _|
    | |\/| |/ _ \ __| __| |/ _ \ |    | |
    | |  | |  __/ |_| |_| |  __/ |___ | |
    |_|  |_|\___|\__|\__|_|\___|\____|___|
    MettleCI DevOps for DataStage
    (C) 2021-2022 Data Migrators

Your GitHub CI pipeline templates can be found in the following files:

- `.github/workflows/mettleci_devops.yaml` which is a DevOps template pipeline. 

These templates make use of the following reusable pipeline workflows:

CCMT: `ccmt-template.yaml`
Compliance: `compliance-template.yaml`
Deploy: `deploy-template.yaml`
Unit Test: `unittest-template.yaml`

For GitHub to be able to make use of these example pipelines, first copy the .github directory
into the root directory of the repository

See the documentation [here](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/741376173).
