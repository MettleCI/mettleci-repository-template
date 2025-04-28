```
     __  __      _   _   _       ____ ___
    |  \/  | ___| |_| |_| | ___ / ___|_ _|
    | |\/| |/ _ \ __| __| |/ _ \ |    | |
    | |  | |  __/ |_| |_| |  __/ |___ | |
    |_|  |_|\___|\__|\__|_|\___|\____|___|
    MettleCI DevOps for DataStage
    (C) 2021-2024 Data Migrators
```

# Bamboo CI Templates

Your Atlassian Bamboo CI pipeline template can be found in the following files:

- `bamboo.yaml` 
- `devops-ci.yaml` which is the MettleCI-enabled DataStage DevOps template pipeline

```
.
├── README.md
├── bamboo.yml                      # The top-level Bamboo specs file which includes the YAML components necessary to implement your pipeline
├── devops
│   ├── devops-ci.yml               # The DevOps build pipeline (for Continuous Integration)
│   └── devops-deploy.yml           # The DevOps deployment pipeline
├── permissions
│   └── permissions-plan.yml        # Specify which permissions users/groups have to this plan
│   ├── permissions-deploy.yml      # Specify which permissions users/groups have to each deployment environment 
└── templates
    └── deploy-template.yml         # A reusable pipeline template included in other pipeline definitions
```

Note that unlike the MettleCI pipeline examples for other technologies, Atlassian Bamboo specs are required to be located in a directory named `bamboo-specs` situated at the root of your repository. See [this page](https://docs.atlassian.com/bamboo-specs-docs/latest/specs.html?yaml#yaml) for more details.

# Usage Notes

As with all the build system-specific template examples, you may safely delete this directory from your repository if you do not plan on using Atlassian Bamboo as for build and deployment of your DataStage solution.
