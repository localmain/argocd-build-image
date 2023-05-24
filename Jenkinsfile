 pipeline {
	agent any		

 stages {
	 
      stage('checkout') {
           steps {
             
                git branch: 'main', url: 'https://github.com/localmain/argocd-build-image.git'
             
          }
        }
       

      stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t dev:latest .' 
                sh 'docker tag dev munna998/dev:latest'
               
          }
        }
      stage('Publish image to Docker Hub') {
            steps {
		  withDockerRegistry(credentialsId: 'docker', url: 'https://hub.docker.com/') {
                    sh  'docker push munna998/dev:latest' 
		}
                  
          }
        }
      stage('Trigger Update Manifest') {
	      steps {     
                  echo "triggering Update manifest Job"
                  build job: 'argocd-update-manifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
	      }
    }
  }
 }
