node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build Docker image') {
  
      docker build -t "34.228.37.180:9090/argocd-dev/localmain" 
        
    }

    
    stage('Push image to Nexus') {
        sh 'docker login -u admin -p admin123 http://34.228.37.180:9090/repository/argocd-dev/'
        sh ' docker push 34.228.37.180:9090/argocd-dev/localmain'
    }
    stage('Trigger Update Manifest') {
        echo "triggering Update manifest Job"
            build job: 'argocd-update-manifest' , parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
    }
    
}
