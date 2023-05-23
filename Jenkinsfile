node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build Docker image') {
  
       app = docker.build("34.228.37.180:9090/argocd-dev/localmain:${env.BUILD_NUMBER}")
    }

    stage('Test Docker image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image to Nexus') {
        sh 'docker login -u admin -p admin http://34.228.37.180:9090/repository/argocd-dev/'
             app.push("${env.BUILD_NUMBER}")
    }
    stage('Trigger Update Manifest') {
        echo "triggering Update manifest Job"
            build job: 'argocd-update-manifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
    }
    
}
