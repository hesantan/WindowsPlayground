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
		SOLUTION_NAME = "WindowsPlayground.sln"
		CONFIGURATION = "${params.CONFIGURATION}"
		VERSION       = "1.0.0.${env.BUILD_NUMBER}"
		PLATFORM	  = "Any CPU"
	}
	stages {
		stage('Build') { 
			environment {
				MSBUILD_SWITCHES = "/m /v:q /val /nologo /p:Configuration=${env.CONFIGURATION} /p:Platform=\"${env.PLATFORM}\" /p:ProductVersion=${env.VERSION}"
            }
			steps { 
				bat "nuget restore ${env.SOLUTION_NAME}"
				bat "\"${tool 'MSBuild-Default'}\\msbuild.exe\" ${env.SOLUTION_NAME} ${env.MSBUILD_SWITCHES}"
			}
		}
		stage('Test') {
			steps {
				echo 'Work'
			}
		}
		stage('Archive') {
			steps {
				archiveArtifacts "${env.PROJECT_NAME}/bin/${env.CONFIGURATION}/**.dll"
			}
		}
		stage('Deploy') {
			environment { 
                ROBOCOPY_SOURCE = "\"${env.WORKSPACE}\\WindowsPlayground\\bin\\Debug\\\""
				ROBOCOPY_DESTINATION = "\"${env.WORKSPACE}\\Deploy\\\""
            }
			steps {
				bat "ROBOCOPY ${env.ROBOCOPY_SOURCE} ${env.ROBOCOPY_DESTINATION} /MIR /MT /R:2 /W:5"
			}
		}
	}
}
