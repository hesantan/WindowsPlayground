pipeline {
	agent any 

	environment {
		PROJECT_NAME  = 'WindowsPlayground'
		SOLUTION_NAME = 'WindowsPlayground.sln'
		CONFIGURATION = 'Debug'
		VERSION       = '1.0.0.${env.BUILD_NUMBER}'
	}

	tools {
		MSBuild 'Default'
	}

	stages {

		stage('Build') { 
			steps { 

				try {
					bat 'nuget restore WindowsPlayground.sln'
				} 
				catch (ex)
				{
					echo "no packages in use for ${env.PROJECT_NAME}"
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