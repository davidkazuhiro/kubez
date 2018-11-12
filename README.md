# kubez
Checks the RBAC AuthZ you have on Kubernetes

## Usage

Once you execute the script with `./kubez.sh`, it will display your context
which includes the cluster name, your username, and your namespace.

The script will wait for 5 seconds to give you a chance to make sure this is correct
before it starts verifying your permissions.

```
$ ./kubez.sh 
This script will check your permissions on the following context
(Script repo: https://ghe.rakuten-it.com/david-somers-harris/kubez)

{
  "name": "jpe2-zed2-dev-david.somers-harris-esd-sandbox",
  "context": {
    "cluster": "jpe2-zed2-dev",
    "user": "david.somers-harris-jpe2-zed2-dev",
    "namespace": "cpd-tam"
  }
}
```
