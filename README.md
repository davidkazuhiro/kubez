# kubez
Checks the RBAC AuthZ you have on Kubernetes

## Usage

## Setup

This script needs the following utilities, and will yell at you if they are not installed.

```
bash
jq
kubectl
nc
```

You'll also need to start your kubectl proxy for this script to work.
Make sure the port number is the same as below:

```
$ kubectl proxy
Starting to serve on 127.0.0.1:8001
```


## Execution

Once you execute the script with `./kubez.sh`, it will display your context
which includes the cluster name, your username, and your namespace.

The script will wait for 5 seconds to give you a chance to make sure this is correct
before it starts verifying your permissions.

```
$ ./kubez.sh 
This script will check your permissions on the following context

{
  "name": "jpe2-zed2-dev-david.somers-harris-esd-sandbox",
  "context": {
    "cluster": "jpe2-zed2-dev",
    "user": "david.somers-harris-jpe2-zed2-dev",
    "namespace": "cpd-tam"
  }
}
```
