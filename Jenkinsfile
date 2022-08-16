def label = "slave-${UUID.randomUUID().toString()}"

podTemplate(
    label: label,
    serviceAccount: 'jenkins-admin',
    volumes: [
        hostPathVolume(mountPath: '/docsify/docs', hostPath: '/docsify/docs')
    ]
) {
  node(label) {
    def myRepo = checkout([
      $class: 'GitSCM',
      branches: [[name: "*/dev"]],
      doGenerateSubmoduleConfigurations: false,
      extensions:  [[$class: 'CloneOption', noTags: false, reference: '', shallow: true, timeout: 1000]]+[[$class: 'CheckoutOption', timeout: 1000]],
      submoduleCfg: [],
      userRemoteConfigs: [[
        credentialsId: '2448e943-479f-4796-b5a0-fd3bf22a5d30',
        url: 'https://gitee.com/guan-xiangwei/violin-docs.git'
        ]]
      ])

    def gitCommit = myRepo.GIT_COMMIT
    def gitBranch = myRepo.GIT_BRANCH

    def imageTag = "v1.00"
    def registryUrl = "ccr.ccs.tencentyun.com"
    def imageEndpoint = "violin/violin-docs"
    def image = "${registryUrl}/${imageEndpoint}:${imageTag}"

    stage('单元测试') {
      ls
      echo "测试阶段"
    }
  }
}