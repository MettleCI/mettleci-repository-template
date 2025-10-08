```
    ███╗   ███╗███████╗████████╗████████╗██╗     ███████╗ ██████╗██╗
    ████╗ ████║██╔════╝╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔════╝██║
    ██╔████╔██║█████╗     ██║      ██║   ██║     █████╗  ██║     ██║
    ██║╚██╔╝██║██╔══╝     ██║      ██║   ██║     ██╔══╝  ██║     ██║
    ██║ ╚═╝ ██║███████╗   ██║      ██║   ███████╗███████╗╚██████╗██║
    ╚═╝     ╚═╝╚══════╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝ ╚═════╝╚═╝
    MettleCI DevOps for DataStage       (C) 2021-2025 Data Migrators
```
# Welcome to MettleCI

Documentation: http://docs.mettleci.io/

Data Migrators' MettleCI dramatically increases the quality of DataStage jobs, and the speed with which those jobs can be promoted through your quality assurance processes into production.  It enables an order-of-magnitude increase in your delivery cadence and elevates you and your stakeholders' trust in the reliability of the DataStage code delivered by your team.  MettleCI enables a significant reduction in your time to delivery through the complete automation of common software delivery processes, including unit testing, code review, and deployment.

MettleCI is the embodiment of the [shift-left testing philosophy](https://en.wikipedia.org/wiki/Shift-left_testing) brought to the Information Server landscape.  By testing early and often, risk is identified and addressed earlier in the delivery lifecycle, reducing both the time and cost involved in delivering a quality DataStage solution.

With MettleCI your DataStage team no longer needs to lag behind their digital counterparts in the adoption of modern software delivery practices and can adopt true DevOps/DataOps practices with the minimum effort.

## Repository Structure

```
├── datastage/                          # This structure is automatically managed by MettleCI
│   ├── Config_One.apt                  # The apt config files for your project
│   ├── Config_Two.apt                  # 
│   ├── ...                   
│   ├── DSParams                        # The DSParams for your project
│   ├── Jobs/                           # | The structure under the root 'datastage' folder directly reflects
│   │   ├── Category/                   # | the structure in root of your DataStage repository.  Every time 
│   │   │   ├── SomeJob_One.isx         # | you check in datastage assets the required folders are created for
│   │   │   ├── SomeJob_Two.isx         # | you in your git repository.
│   │   │   └── ...
│   │   ├── Some Other Category/
│   │   │   ├── Other_Job.isx
│   │   │   └── ...
│   │   └── ...
│   └── Parameter Sets/                 # The 'Parameter Sets' folder contains Parameter Set Value files
│       ├── SourceDB1/                  # | following the structure used by the DataStage Engine: 
│       │   └── source1                 # | '/datastage/Parameter Sets/<Parameter Set>/<Value File>'
│       ├── SourceDB2/
│       │   └── source2
│       ├── TargetDB/
│       │   └── target 
│       ├── SourceDB1.isx               # | The Parameter Set export structure under the root 'datastage' folder 
│       ├── SourceDB2.isx               # | directly relects the structure of your DataStage repository.
│       └── TargetDB.isx
├── filesystem/                         # The content of the file system directory is transferred to the
│   ├── deploy.sh                       # | DataStage engine by MettleCI and deploy.sh is invoked on the DataStage
│   ├── datasets/                       # | engine to move other directories and files (such as scripts) to the
│   └── scripts/                        # | appropriate locations for use by the ETL solution
│       ├── 10-restore-backups.sql   
│       ├── 20-create-test-data.sql
│       └── ...
├── pipelines/                          # A set of unsupported example pipeline definitions covering a range of use cases
│   ├── azure                           # Pipeline examples for Azure Devops
│   │   └── ...
│   ├── github/                         # Pipeline examples for GitHub
│   │   └── ...
│   ├── gitlab/                         # Pipeline examples for GitLab
│   │   └── ...
│   └── jenkins/                        # Pipeline examples for Jenkins
│       └── ...
├── unittest/                           # This flat structure is automatically managed by MettleCI
│   ├── SomeJob_One/                    # Each job gets its own folder in the unittest folder
│   │   ├── dsDataSource1.csv           # Test data input files
│   │   ├── dsDataSource2.csv           # |
│   │   ├── dsDataSource3.csv           # |
│   │   ├── dsDataTarget1.csv           # |
│   │   ├── SomeJob_One_Test1.yaml      # Test specification which associates data files to your jobs' links
│   │   ├── SomeJob_One_Test2.yaml      # |
│   │   ├── SomeJob_One_Test3.yaml      # |
│   ├── SomeJob_Two/
│   │   ├── {similar to above}
│   └── Other_Job/
│       └── {similar to above}
├── varfiles/                           # Variable override files provide environment-specific values for each target environment.
|   ├── var.ci                          # | Search the MettleCI documentation for 'variable override files'
|   ├── var.hf                          # | These files cover the CI, DEV, QA, and PROD environments
|   ├── var.hf_ci                       # | as an example (as well as a special case for Hot Fixes)
|   ├── var.lci                         # |
|   ├── var.perf                        # |
|   ├── var.prod                        # |
|   ├── var.qa                          # |
|   └── var.rc                          # |
└── README.md
```

_(Data Migrators source reference: Pipeline Common Master)_