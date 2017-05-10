pipeline {
	agent any 
	triggers {
        pollSCM('* * * * *')
    }
	parameters { string(name: 'TESTING_ENVIROMENT', defaultValue: 'development', description: 'The enviroment of the test execution') }
	environment {
		PROJECT_NAME  = 'WindowsPlayground'
		SOLUTION_NAME = 'WindowsPlayground.sln'
		CONFIGURATION = 'Debug'
		VERSION       = '1.0.0.${env.BUILD_NUMBER}'
	}
	stages {
		stage('Build') { 
			steps { 
				bat 'nuget restore WindowsPlayground.sln'
				bat "\"${tool 'MSBuild-Default'}\\msbuild.exe\" WindowsPlayground.sln /p:Configuration=Debug /p:Platform=\"Any CPU\" /p:ProductVersion=1.0.0.0"
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
				bat "ROBOCOPY \"${env.WORKSPACE}\\WindowsPlayground\\bin\\Debug\\\" \"${env.WORKSPACE}\\Deploy\\\""
			}
		}
	}
}
