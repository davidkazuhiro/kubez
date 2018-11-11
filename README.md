# kubez
Checks the RBAC AuthZ you have on Kubernetes

## Usage

1. Make sure your kubectl is authenticated
1. Make sure your context is what you want

   ```
   kubectl config current-context
   ```
   
1. Make sure your namespace is what you want

   ```
   kubectl config view | grep namespace: -A 2 -B 2
   ```

1. Run the script

   ```
   ./kubez.sh
   ```
