pipeline {
    agent any 
    parameters { 
         string(defaultValue: "1.0.0.0", description: 'Image version ', name: 'imageversion')
               string(defaultValue: "containername", description: 'Container Name ', name: 'containername')
          choice(
            choices: ['Yes' , 'No'],
            description: 'IF you want to Delete existing containers ? ',
            name: 'REQUESTED_ACTION')
       
    }

stages{
        stage ('DOcker build image using Dockerfile'){
         steps { 
             sh 'docker build -t one2onetool:${imageversion}-${BUILD_NUMBER} . ' 
} 
        }
    
       stage('Test ') { 
            steps {
                sh 'npm test'
                    echo 'testing application'
           
    }
}
     stage('Docker Remove containers') { 
          when {
                // Only say hello if a "greeting" is requested
                expression { params.REQUESTED_ACTION == 'Yes' }
          }
           steps {
                sh 'docker rm -f $(docker ps -aq)'
            }
        }
   stage('Delpoy nodejs application') { 
            steps {
              
              sh 'docker run -d -p 3001:3000 --name ${containername} one2onetool:${imageversion}-${BUILD_NUMBER} '
    }
}
    
}
    }
