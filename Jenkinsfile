pipeline {
	agent any 

	environment {
		PROJECT_NAME  = 'WindowsPlayground'
		SOLUTION_NAME = 'WindowsPlayground.sln'
		CONFIGURATION = 'Debug'
		VERSION       = '1.0.0.${env.BUILD_NUMBER}'
	}

	stages {

		stage('Build') { 
			steps { 

				try {
					bat 'nuget restore WindowsPlayground.sln'
				} catch {
					// no packages in use
				}
				
				bat "\"${tool 'MSBuild'}\" WindowsPlayground.sln /p:Configuration=Debug /p:Platform=\"Any CPU\" /p:ProductVersion=1.0.0.0"
			}
		}

		stage('Test') {
			steps {
				echo 'Work'
			}
		}

		stage('Archive') {
			steps {
				archiveArtifacts 'WindowsPlayground/bin/Debug/**'
			}
		}

		stage('Deploy') {
			steps {
				echo 'Work'
			}
		}
	}
}