     __  __      _   _   _       ____ ___
    |  \/  | ___| |_| |_| | ___ / ___|_ _|
    | |\/| |/ _ \ __| __| |/ _ \ |    | |
    | |  | |  __/ |_| |_| |  __/ |___ | |
    |_|  |_|\___|\__|\__|_|\___|\____|___|
    MettleCI DevOps for DataStage
    (C) 2021-2024 Data Migrators

Your Jenkins CI template can be found in the following files:
```
.
├── devops
│   ├── Jenkinsfile-DevOpsBuild         # A build pipeline implementing a typical continuous integration testing process
│   ├── Jenkinsfile-DevOpsDeploy        # A deployment pipeline promoting a nominated release to a target environment
│   ├── Jenkinsfile-DevOpsHFBuild       # A build pipeline designed for exclusive use with a Hot Fix branch
│   ├── Jenkinsfile-DevOpsHFCreate      # A pipeline which pre-emptively creates a Hot Fix branch after a successful Production deployment 
│   └── Jenkinsfile-DevOpsHFDeploy      # A deployment pipeline designed for exclusive use with a Hot Fix branch
└── README.md
```

# Usage Notes

## Jenkins Shared Libraries

All MettleCI pipeline examples make use of re-usable pipeline components, the terminology for which varies between technologies.  Jenkins is notable in that it is the only MettleCI-supported build system which requries its re-usable pipeline components to reside in a separate repository to the main repository (i.e. this one) which utilises those re-usable components.  For this reason you need to ensure that for Jenkins-based pipelines you do the following:

**Deploy the jenkins-mci-shared-libraries to a separate Git repository alongside the repository holding your DataStage assets (i.e. this repository.)
Ensure that the first line of your Jenkins pipeline definition refers to the name of the repository you created to hold your shared libraries. e.g. 
`@Library(jenkins-mci-shared-libraries') _`**

## Config Directory

When reviewing the supplied Jenkinsfile, you may notice that some steps refer to a "config" directory, 
which is not one of the directories present in the repository. This directory is created *on the fly* 
during the prior parameter substitution step:

```
bat label: 'Substitute parameters in DataStage config',
script: "${env.METTLE_SHELL} properties config 
 -baseDir datastage 
 -filePattern \"*.sh\"
 -filePattern \"DSParams\" 
 -filePattern \"Parameter Sets/*/*\" 
 -properties var.${params.environmentId} 
 -outDir config"
```

The `-outDir` parameter `config` generated the config directory which is then used in subsequent steps.

```
bat label: 'Transfer DataStage config and filesystem assets', 
script: "${env.METTLE_SHELL} remote upload 
 -host ${params.serverName} 
 -username ${datastageUsername} -password ${datastagePassword} 
 -transferPattern \"filesystem/**/*,config/*\" 
 -destination \"${env.BUILD_TAG}\""
```


