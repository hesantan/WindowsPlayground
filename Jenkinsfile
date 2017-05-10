pipeline {
	agent any 
	triggers {
        pollSCM('* * * * *')
    }
	parameters {
		string(name: 'CONFIGURATION', defaultValue: 'Debug', description: 'The configuration to be use when build the project.') 
	}
	environment {
		PROJECT_NAME  = 'WindowsPlayground'
		SOLUTION_NAME = "${env.PROJECT_NAME}.sln"
		CONFIGURATION = "${params.CONFIGURATION}"
		VERSION       = "1.0.0.${env.BUILD_NUMBER}"
		MSBUILD_EXE   = "${tool 'MSBuild-Default'}\\msbuild.exe"
		MSBUILD_SWITCHES = "/m /val /nologo /v:q /p:Configuration=${env.CONFIGURATION} /p:Platform=\"Any CPU\" /p:ProductVersion=${env.VERSION}"
		ROBOCOPY_SOURCE = "${env.WORKSPACE}\\WindowsPlayground\\bin\\Debug\\"
		ROBOCOPY_DESTINATION = "${env.WORKSPACE}\\Deploy\\"
	}
	stages {
		stage('Build') { 
			steps { 
				bat 'nuget restore ${env.SOLUTION_NAME}'
				bat "${env.MSBUILD_EXE} ${env.SOLUTION_NAME} ${env.MSBUILD_SWITCHES}"
			}
		}
		stage('Test') {
			steps {
				echo 'Work'
			}
		}
		stage('Archive') {
			steps {
				archiveArtifacts "${env.PROJECT_NAME}/bin/${env.CONFIGURATION}/**"
			}
		}
		stage('Deploy') {
			steps {
				bat "ROBOCOPY ${env.ROBOCOPY_SOURCE} ${env.ROBOCOPY_DESTINATION} /MIR /MT /R:2 /W:5"
			}
		}
	}
}
