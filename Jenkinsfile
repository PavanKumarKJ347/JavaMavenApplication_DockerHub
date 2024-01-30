pipeline
{
    agent any

    tools
    {
        maven 'Maven_3.9.6'
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
    }
}