def remote = [:]
remote.name = "BWH"
remote.host = "104.128.83.2"
remote.port = 22
remote.allowAnyHosts = true
node {
    withCredentials([sshUserPrivateKey(credentialsId: 'SSHKEY', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'user')]) {
        remote.user = user
        sshCommand remote: remote, command: 'ls'
    }
}