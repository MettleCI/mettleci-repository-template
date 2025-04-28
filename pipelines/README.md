    
    ███╗   ███╗███████╗████████╗████████╗██╗     ███████╗ ██████╗██╗
    ████╗ ████║██╔════╝╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔════╝██║
    ██╔████╔██║█████╗     ██║      ██║   ██║     █████╗  ██║     ██║
    ██║╚██╔╝██║██╔══╝     ██║      ██║   ██║     ██╔══╝  ██║     ██║
    ██║ ╚═╝ ██║███████╗   ██║      ██║   ███████╗███████╗╚██████╗██║
    ╚═╝     ╚═╝╚══════╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝ ╚═════╝╚═╝
    MettleCI DevOps for DataStage       (C) 2021-2024 Data Migrators

# MettleCI Pipeline Examples

This directory holds sample Devops and Upgrade pipeline definitions foir a range of popular build tools.

Currently supported tools are:

- Atlassian Bamboo (see note below)
- Azure Devops
- GitHub
- GitLab
- Jenkins (see note below)

## Atlassian Bamboo

Note that Atlassian Bamboo plans are supplied differently due to the way in which Atlassian Bamboo manages its pipeline definitions as code. (i.e. pipelines need to be generated via API calls rather than imported from text assets like other build systems)

You can generate a sample Atlassian Bamboo plan which uses MettleCI using the `mettleci deploy devops-pipeline` command which is documentated [here](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/549225052/Deploy+DevOps-Pipeline+Command).

Read more about generating a sample MettleCI build plan for Atlassian Bamboo [here](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/556302364/Generating+MettleCI+Bamboo+Plans).

## Azure Devops

See the [MettleCI Azure DevOps integration documentation](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/741310465/Azure+DevOps)

## GitHub

See the [MettleCI GitHub integration documentation](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/741376173/GitHub)

## GitLab

See the [MettleCI GitLab integration documentation](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/741244932/GitLab)

## Jenkins

All our pipeline examples make use of re-usable pipeline components, the terminology for which varies between technologies.

Jenkins is notable in that it is the only MettleCI-supported build system which requries its re-usable pipeline components to reside in a separate repository to the main repository (i.e. this one) which utilises those re-usable components.

For this reason you need to ensure that for Jenkins-based pipelines you do the following:

- Deploy the `jenkins-mci-shared-libraries` to a separate Git repository, alongside the repository holding your DataStage assets (i.e. this repository)
- Ensure that the first line of your Jenkins pipeline definition refers to the name of the repository you created to hold your shared libraries. e.g. `@Library('jenkins-mci-shared-libraries') _`

See the [MettleCI Jenkins integration documentation](https://datamigrators.atlassian.net/wiki/spaces/MCIDOC/pages/731709604/Jenkins)

