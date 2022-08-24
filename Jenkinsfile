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
                script {
                    if(env.GIT_BRANCH == "release")
                        sh 'docker build -t one2onetool:${imageversion}-${BUILD_NUMBER} . --build-arg DATA_FILE="Questions.json"' 
                    else
                        sh 'docker build -t one2onetool:${imageversion}-${BUILD_NUMBER} . --build-arg DATA_FILE="Questions-test.json"' 
                } 
            }
       }
       stage('Test ') { 
            steps {
                sh 'npm install'
                sh 'npm test'
                    echo 'testing application'
           
    }
}
     
   stage('Deploy nodejs application') { 
            steps {
                script{
                    if($(docker ps -aq) !='')
                        sh 'docker rm -f $(docker ps -aq)'
                }
              sh 'docker run -d -p 3001:3000 --name ${containername} one2onetool:${imageversion}-${BUILD_NUMBER} '
    }
}
   
}
    post{
        failure{
            mail to: "raob6730@gmail.com",
            subject: "failure Email",
            body: "build failure ${JOB_NAME}-Build ${BUILD_NUMBER} - ${BUILD_URL}"
            
    }
   } 
  }
