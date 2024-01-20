
# End to End CICD Pipeline Project

This project can be used to build an end to end CICD Pipeline.




## This project can be used to build multiple CICD Pipeline stages as mentioned below 

- Build Project.
- Execute SonarQube Test.
- Build Docker Image.
- Push Docker Image to Registry.
- Deploy Application into Kubernetes Cluster.


# Project Execution
## Build Project

Build Automation Tool Maven can be used to build this project as this project is developed using Java Programming Language.

```bash
  mvn clean package
```
Note:  
Java and Maven should be installed as a prerequisite to Build Project Code.

## Execute SonarQube Test
```bash
  mvn sonar:sonar
```

## Build Docker Image
```bash
  docker build -t RegistryName/ApplicationName:Version
```

## Push Docker Image to Registry
```bash
  docker push RegistryName/ApplicationName:Version
```

## Deploy Application to Kubernetes Cluster
```bash
  kubectl apply -f Deployment.yaml
```
