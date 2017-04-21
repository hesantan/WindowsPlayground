pipeline {
	agent any 

	environment {
		SOLUTION_NAME = 'WindowsPlayground.sln'
		CONFIGURATION = 'Debug'
		VERSION       = '1.0.0.${env.BUILD_NUMBER}'
	}

	stages {

		stage('Build') { 
			steps { 
				bat 'nuget restore ${env.SOLUTION_NAME}'
				bat "\"${tool 'MSBuild'}\" ${env.SOLUTION_NAME} /p:Configuration=${env.CONFIGURATION} /p:Platform=\"Any CPU\" /p:ProductVersion=${env.VERSION}"
			}
		}

		stage('Test') {
			steps {
				echo 'Work'
			}
		}

		stage('Archive') {
			steps {
				archiveArtifacts 'ProjectName/bin/Debug/**'
			}
		}

		stage('Deploy') {
			steps {
				echo 'Work'
			}
		}
	}
}