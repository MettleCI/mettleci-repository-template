# exit on failure
set -e


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Source DataStage environment
#
case `uname` in
    "Windows"*) 
        # Windows
        DSHOME=`registry -p -u -k "HKLM\SOFTWARE\Ascential Software\DataStage\DSEngine\CurrentVersion" -n DSEHome -3`
        break
        ;;
    *)
        # Linux/Unix
        if [ -f "/.dshome" ]
        then
            DSHOME=`cat /.dshome`
            . $DSHOME/dsenv
        else
            echo "ERROR: .dshome is missing on server - is ${IISENGINENAME} a valid datastage engine?"
            exit -1
        fi
        ;;
esac

BUILDHOME=`pwd`/${DATASTAGE_PROJECT}
PROJECTHOME=`$DSHOME/bin/dsjob -projectinfo ${DATASTAGE_PROJECT} | tail -1 | awk -F ": " '{print $2}' | tr -d '\r'`
#------------------------------------------------------------------------------

echo BUILDHOME: $BUILDHOME 
echo PROJECTHOME: $PROJECTHOME

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Deploy DataStage configurations
#

# DSParams
if [ -f "$BUILDHOME/config/DSParams" ]
then
    cp $BUILDHOME/config/DSParams $PROJECTHOME/
fi

# Projects APT Config files
set -- $BUILDHOME/config/*.apt
if [ -f "$1" ]
then
    echo "Deploying APT Config files"

    ###############
    #
    # .apt files have been included in this MettleCI source repository.
    # Due the variety of ways .apt files may be managed within DataStage, 
    # please refer to https://datamigrators.atlassian.net/wiki/x/A4Cjiw
    # for assistance on how to plan their migration.
    #
    ###############

    grep -e "resource disk" -e "resource scratchdisk" $BUILDHOME/config/*.apt | awk -F "[\"']" '{print $2}' | sort -u | xargs -n1 mkdir -p
fi
#------------------------------------------------------------------------------



#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Defer to filesystem deployment script
#

if [ -f "$BUILDHOME/filesystem/deploy.sh" ]
then
    #cd $BUILDHOME/filesystem
     
    chmod u+x $BUILDHOME/filesystem/deploy.sh
    $BUILDHOME/filesystem/deploy.sh -p ${DATASTAGE_PROJECT} -e ${ENVID}
else
    echo "$BUILDHOME/filesystem/deploy.sh"
    echo "ERROR: filesystem/deploy.sh script not found, skipping"
    exit -1
fi
#------------------------------------------------------------------------------
