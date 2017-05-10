# REST API
# Assuming "anonymous read access" has been enabled on Jenkins instance.
$JenkinsUrl='http://jenkins.me/'
$JenkinsCrumbsUrl="$JenkinsUrl/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,`":`",//crumb)"
$JenkinsPipelineValidatorUrl = "$JenkinsUrl/pipeline-model-converter/validate"
$JenkinsFilePath="./Jenkinsfile"

# JENKINS_CRUMB is needed if your Jenkins master has CRSF protection enabled
$JenkinsCrumbs = (Invoke-WebRequest -UseBasicParsing -Uri $JenkinsCrumbsUrl -Method GET) -split ":"
$JenkinsPipelineValidatorHeaders = @{
    $JenkinsCrumbs[0]=$JenkinsCrumbs[1]
}
$JenkinsPipelineValidatorBody = @{
    "jenkinsfile" = Get-Content($JenkinsFilePath) -Raw
}

Invoke-WebRequest -UseBasicParsing -Uri $JenkinsPipelineValidatorUrl -Headers $JenkinsPipelineValidatorHeaders -Method POST -Body $JenkinsPipelineValidatorBody