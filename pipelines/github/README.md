```
     __  __      _   _   _       ____ ___
    |  \/  | ___| |_| |_| | ___ / ___|_ _|
    | |\/| |/ _ \ __| __| |/ _ \ |    | |
    | |  | |  __/ |_| |_| |  __/ |___ | |
    |_|  |_|\___|\__|\__|_|\___|\____|___|
    MettleCI DevOps for DataStage
    (C) 2021-2025 Data Migrators
```
Your GitHub CI workflow files can be found in `.github/workflows/`. 

The files supplied are:

| File                     | Description |
|--------------------------|-------------|
| mettleci_devops.yaml     | Principle orchestrating workflow invoked by a commit of a DataStage asset to 'main' |
| ccmt-template.yaml       | Reusable template to invoke IBM's CCMT tool |
| compliance-template.yaml | Reusable template to invoke MettleCI compliance testing |
| deploy-template.yaml     | Reusable template to invoke a MettleCI deployment process |
| unittest-template.yaml   | Reusable template to invoke MettleCI unit testing |

See the documentation [here](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/741376173/GitHub).
