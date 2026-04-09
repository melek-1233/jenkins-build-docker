node {
    def registryProjet='registry.gitlab.com/melek-1233/jenkins-build-docker'
    def IMAGE="${registryProjet}:version-${env.BUILD_ID}"

    stage('Clone') {
        git 'https://github.com/melek-1233/jenkins-build-docker.git'
    }

    stage('Build') {
        img = docker.build("${IMAGE}", ".")
    }

    stage('Run') {
        img.withRun("--name run-${env.BUILD_ID} -p 8080:80") { c ->
            sh 'curl localhost:8080'
        }
    }

    stage('Push') {
        docker.withRegistry('https://registry.gitlab.com', 'reg1') {
            img.push('latest')
            img.push("${env.BUILD_ID}")
        }
    }
}
