#	**************************************** Docker ****************************************

# List Images:
docker images [OPTIONS]
	-a = all images

# List Containers:
docker ps [OPTIONS]
	-l = latest created container
	-a = all containers

# Run Container from an Image / Run a Command in a New Container:
docker run [OPTIONS] <image>[:<tag>] [<commandToExecInContainer>]
	-d = run in detached mode
	-it = keep STDIN open + allocate pseudo tty aka. interactive terminal/shell
	--rm = remove contianer when it exits
	--link <container> = add link to <container>
	--name <nameOfNewContainer> = set container name to <nameOfNewContainer>
	-p <hostPort>:<containerPort> = forward <hostPort> on host to <containerPort> on container
	-v <hostFolder>:<containerFolder> = bind <hostFolder> on host to <containerFolder> on container
	-v <containerFolder> = expose <containerFolder> on container to other containers
	--volumes-from <containerWithBoundFolder> = mount volumes from <containerWithBoundFolder>
	--privileged=true = give extended privileges to this container
	--restart=always = restart policy to apply when container exits
	--memory <maxAllowedMemoryInBytes> = memory limit
	--cpu-shares <maxCpuSharesInInt> = cpu shares limit
	--cpu-quota <maxCpuQuotaInInt> = cpu completely fair scheduler quota limit

# Create Image from a Container:
docker commit <containerIdOrName> <newImageName>[:<newImageTag>]

# Name an Existing Image:
docker tag <imageId> <newName>

# Jump Into a Running Container:
docker attach <containerIdOrName>

# Exit a Container Without Stopping It:
CTRL+P, CTRL+Q

# Run a Command in a Running Container:
docker exec [OPTIONS] <image>[:<tag>] <commandToExecInContainer>
	-it = keep STDIN open + allocate pseudo tty aka. interactive terminal/shell

# View Output of a Container:
docker logs <containerIdOrName>

# Stop a Running Container:
docker kill <containerIdOrName>

# Delete a Stopped Container:
docker rm <containerIdOrName>

# Create a Private Network in Docker:
docker network create <networkName>

# Pull Image from Docker Registry:
docker pull <image>[:<tag>]

# Push Image to Docker Registry:
docker push <image>[:<tag>]

# Delete an Image:
docker rmi <image>[:<tag>]
docker rmi <imageId>

# Build an Image from a Dockerfile:
docker build [OPTIONS] <pathToDockerfile>
	-t <image>[:<tag>] = name and optionally tag the new image

# Save Image(s) to a Local File:
docker save -o <fileName.tar.gz> <image> [<image2> <image3> ...]

# Load Images from a Local File:
docker load -i <fileName.tar.gz>

# View Object(s) Details:
docker inspect <imageOrContainer> [<imageOrContainer2> <imageOrContainer3> ...]

# **************************************** /Docker ****************************************
====================================================================================================
# **************************************** Git ****************************************

# Set Username:
git config --global user.name "<firstName> <lastName>"

# Set Email:
git config --global user.email "<emailAddress>"

# Set Default Text Editor:
git config --global core.editor "<editor>"

# Enabled Colored Output:
git config --global color.ui true

# Initialize a Local Repository:
git init

# View Repository Status:
git status

# Add Files to Staging Area:
git add <directoryOrFile> [<directoryOrFile2> <directoryOrFile3> ...]

# Commit Changes to Local Repo:
git commit [OPTIONS]
	-a = add unstaged files
	--amend = amend most recent commit
	-m "<commitMessage>" = add <commitMessage> instead of opening default text editor

# View Commit History:
git log [OPTIONS] [<branch>]
	--oneline = shows one line of info per commit
	--graph = shows graph representation of branching and merging on left side
	--decorate = ommit ref name prefixes (refs/heads/, refs/tags/, refs/remotes/)
	--after=<date> or --since=<date> = shows commits more recent than <date>
	--before=<date> or --until=<date> = shows commits older than <date>
	-n <numberOfCommits> = limit number of commits to return to <numberOfCommits>

# View Differences Between Things:
git diff [OPTIONS] [<commit>] [-- <file>]
git diff [OPTIONS] <commit1>..<commit2> [-- <file>]
gid diff [OPTIONS] <branch1>..<branch2> [-- <file>]
	-p = patch, shows actual changes
	--staged = show diff in staging area instead of working directory

# Delete File(s):
git rm <file> [<file2> <file3> ...]

# Move/Rename File:
git mv <sourceFile> <destinationFile>

# Switch to a Branch
git checkout <branch>

# Create New Branch and Switch To It:
git checkout -b <branch>

# Create <branch> from <remoteBranch> and switch to it
git checkout -b <branch> <remoteBranch>

# Revert <file> in working tree to match what's at <commit> of <branch>
git checkout [<branch>] [<commit>] -- <file>

# Unstage Change:
git reset HEAD [-- <file>]

# Reset to a Specific Commit:
git reset [OPTIONS] <commit> [-- <file>]
	--soft = only resets the local tracking branch
	--mixed = default, no need to specify, this resets staging area only
	--hard = resets staging and working directories

# Revert a Commit:
git revert <commit>

# Remove Untracked Files from Working Directory:
git clean [OPTIONS] [<path>]
	-f = force
	-n = don't actually remove, just show what would be done (dry run)

# List Files of a Commit:
git ls-tree HEAD
git ls-tree <commit>

# Show Commit Content:
git show HEAD
git show <commit>

# List Branches
git branch [OPTIONS]
	--merged [<commit>] = only list branches that have been merged into current branch's <shaOfCommit>
	-a = list all branches (local and remote)
	-r = list remote brances only

# Create Branch:
git branch <branchToCreate>

# Create <branch> from <remoteBranch>:
git branch <branch> <remoteBranch>

# Branch Operations:
git branch [OPTIONS]
	-m <source> <destination> = move/rename branch <source> to <destination>
	-d <branchToDelete> = delete branch <branchToDelete>
	-u <branch> <aliasOfRemoteRepo>/<remoteBranch> = make <branch> track changes of/follow HEAD of <remoteBranch>

# Merge Branch Into Current Branch:
git merge <branchToMergeIntoCurrentBranch>

# Stash Unstaged Changes to Stash:
git stash save "<message>"

# List Changes Currently Saved in Stash:
git stash list

# Show Contents of a Change Saved in Stash:
git stash show [OPTIONS] <stashId>
	-p = patch, show what actually changed

# Bring Change in Stash to Working Directory:
git stash apply <stashId>

# Bring Change in Stash to Working Directory and Delete from Stash:
git stash pop <stashId>

# Delete a Saved Change from Stash:
git stash drop <stashId>

# List Remote Repositories:
git remote [OPTIONS]
	-v = verbose, show remote urls
# Add a Remote Repository:
git remote add <aliasOfRemoteRepoAkaOrigin> <urlOfRemoteRepo>

# Remove a Remote Repository:
git remote rm <alias>

# Add Local Branch to Remote Repository:
git push -u <aliasOfRemoteRepo> <branch>
	-u = set upstream branch, makes <branch> track its counterpart in remote repo

# Push Changes in Local Branch to Remote Repository:
git push [<aliasOfRemoteRepo>] [<branch>]

# Delete Branch from Remote Repository:
git push <aliasOfRemoteRepo> :<branch>
git push <aliasOfRemoteRepo> --delete <branch>

# Clone a Remote Repository:
git clone <urlOfRepo> [<localDirectory>]

# Fetch Changes from Remote Repository:
git fetch [<aliasOfRemoteRepo>]

# Pull Changes from Remote Repository:
git pull [<aliasOfRemoteRepo>]

# See Why a File is Being Ignored:
git check-ignore -v <pathToFile>

# Rebase current branch onto tip of another branch:
git rebase <branchToRebaseOnto>

# Squash commits:
git rebase -i [HEAD~#|commitSHA]

# **************************************** /Git ****************************************
====================================================================================================
# **************************************** Kubernetes ****************************************

# Download and Start Minikube VM in a hypervisor (like Virtualbox):
minikube start

# Get Kubernetes URL for <service> in minikube and open in default browser:
minikube service <service>

# Open Kubernetes Dashboard for Minikube:
minikube dashboard

# Get Cluster Information:
kubectl cluster-info
kubectl cluster-info | grep dashboard

# Show One or Many Resources:
kubectl get <resourceType> [<resource>] [OPTIONS]
	--show-labels = show column of all existing labels
	-L <label1>[,<label2>,...] = show a column for each <label>
	-l <label1>=<value1>[,<label2>=<value2>,...] = show resource if all true, supports = and !=
	-l <label> or -l '!<label>' = show resource if <label> exists/does not exist
	-l <label> [not]in (val1,val2[,...]) = show resource if <label> value is in/not in list
	-n <namespace> = show resource if resource is in <namespace> namespace
	--all-namespaces = show resources in all namespaces
	--all = all resources based on search scope
	-o yaml|json|wide = show resource yaml or json manifest or additional columns

# Show All Resources:
kubectl get --all

# Show Details of One or Many Resources:
kubectl describe <resourceType> [<resource>]

# Run AdHoc Unmanaged Pod, Optionally RC:
kubectl run [<replicationController>] --image=<repo/name> [OPTIONS]
	--port=<containerPort> = port that the container listens on
	--generator=run/v1 = this is required when not creating a deployment

# Expose a Resource as a Service:
kubectl expose <resourceType> <resource> --type=<serviceType> --name=<serviceName>

# Set a new size for a Deployment, ReplicaSet, Replication Controller, or StatefulSet:
kubectl scale <resourceType> <resource> --replicas=<desiredNumber>

# Create a Resource:
kubectl create -f <manifestYaml> [-n <namespace>]

# Print Logs for a Container in a Pod:
kubectl logs <pod> [-c <container>]

# Forward Local Port to Pod Port:
kubectl port-forward <pod> <localMachinePort>:<podPort>

# Label a Resource:
kubectl label <resourceType> <resource> <label>=<value>
kubectl label <resourceType> <resource> <label>-

# Annotate a Resource:
kubectl annotate <resourceType> <resource> <annotationName>="<annotation>"

# Create a Namespace:
kubectl create namespace <namespace>
kubectl create -f <namespaceManifest.yaml>

# Delete a Resource:
kubectl delete <resourceType> <resource> [OPTIONS]
	-l <label1>=<value1>[,<label2>=<value2>,...] = delete resource if all true, supports = and !=
	-l <label> or -l '!<label>' = delete resource if <label> exists/does not exist
	-l <label> [not]in (val1,val2[,...]) = delete resource if <label> value is in/not in list
	-n <namespace> = delete resource if resource is in <namespace> namespace
	--all = all resources based on search scope

# Execute Command in a Container:
kubectl exec <pod> [-c <container>] -- <command>

# **************************************** /Kubernetes ****************************************
====================================================================================================
# **************************************** Python ****************************************
# /usr/local/bin/python3 -> /usr/local/Cellar/python/3.7.3/bin/python3
# sys.path = [
#   '',
#   '/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python37.zip'.
#   '/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python3.7',
#   '/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python3.7/lib-dynload',
#   '/usr/local/lib/python3.7/site-packages'
# ]

# Create a Virtual Environment:
python3 -m venv ~/.virtualenvs/<virtualEnvironment>

# Activate a Virtual Environment:
source ~/.virtualenvs/<virtualEnvironment>/bin/activate

# Install Project Dependencies/Packages Inside Virtual Environment:
pip install [-e .[all]]

# Update package:
pip install --update <package>

# List Packages:
pip list

# **************************************** /Python ****************************************
