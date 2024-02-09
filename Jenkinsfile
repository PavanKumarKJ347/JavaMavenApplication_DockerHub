pipeline
{
    agent any

    tools
    {
        maven 'Maven_3.9.6'
    }

    environment
    {
        buildNumber = "${BUILD_NUMBER}"
    }

    stages
    {
        stage('Git Checkout')
        {
            steps()
            {
                git branch: 'main', url: 'https://github.com/DevOpsCloudAutomation/JavaDockerApplication.git'
            }
        }

        stage('Build Project')
        {
            steps()
            {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Test')
        {
            steps()
            {
                sh 'mvn sonar:sonar'
            }
        }

        stage('Build Docker Image')
        {
            steps()
            {
                sh 'docker build -t devopscloudautomatio/webapplication:${buildNumber} .'
            }
        }

        stage('Push Docker Image')
        {
            steps()
            {
                withCredentials([string(credentialsId: 'Docker_Hub_Password', variable: 'Docker_Hub_Password')])
                {
                    sh 'docker login -u devopscloudautomation -p ${Docker_Hub_Password}'
                }
                sh 'docker push devopscloudautomation/webapplication:${buildNumber}'
            }
        }

        stage('Remove Docker Image Locally in Jenkins Server')
        {
            steps()
            {
                sh 'docker rmi -f devopscloudautomation/webapplication:${buildNumber}'
            }
        }

        stage('Update Docker Image Tag in Kubernetes Manifest')
        {
            steps()
            {
                sh "sed -i 's/Build_Tag/${Build_Number}/g' Deployment.yaml"
            }
        }

        stage('Deploy Application to EKS Kubernetes Cluster')
        {
            steps()
            {
                sh 'kubectl delete deployment webpage-deployment -n test || true'
                sh 'kubectl apply -f Deployment.yaml'
            }
        }
    }

    post
    {
        always
        {
            cleanWs()
        }
        
        success
        {
            slackSend channel: 'devopscloudautomation',
			color: 'good',
			message: "Application is Successfully Deployed to Production Environments\n ${currentBuild.currentResult} ✅ Job Name: ${env.JOB_NAME} || Build Number: ${env.BUILD_NUMBER}\n More Information Available at: ${env.BUILD_URL}"
        }

        failure
        {
            slackSend channel: 'devopscloudautomation',
			color: 'good',
			message: "${currentBuild.currentResult} ⛔️\n Job Name: ${env.JOB_NAME} || Build Number: ${env.BUILD_NUMBER}\n Application Deployment is Failed to Production Environment\n More Information Available at: ${env.BUILD_URL}"
        }
    }
}