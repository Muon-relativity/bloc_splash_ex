pipeline {
  agent any

  environment {
    PATH = "/Users/haejunlee/development/flutter/bin:$PATH"
  }

  stages {
    stage('Checkout') {
      steps {
        script {
          def cleanBranch = params.BRANCH_NAME.replaceFirst(/^origin\//, '')
          echo "📦 Checking out branch: ${cleanBranch}"
          git url: 'https://github.com/Muon-relativity/bloc_splash_ex.git',
              branch: cleanBranch,
              refspec: "+refs/heads/${cleanBranch}:refs/remotes/origin/${cleanBranch}"
        }
      }
    }

    stage('Install dependencies') {
      steps {
        sh 'flutter pub get'
      }
    }

    stage('Analyze') {
      steps {
        sh 'flutter analyze || true'
      }
    }

    stage('Test') {
      steps {
        sh 'flutter test || true'
      }
    }

    stage('Build APK') {
      steps {
        sh 'flutter build apk'
      }
    }

    stage('Archive APK') {
      steps {
        archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/*.apk', fingerprint: true
      }
    }
  }

  post {
    success {
      echo "✅ Build completed successfully"
    }
    failure {
      echo "❌ Build failed"
    }
  }
}
