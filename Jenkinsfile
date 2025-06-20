pipeline {
  agent any

  parameters {
    string(name: 'BRANCH_NAME', defaultValue: 'main', description: '빌드할 브랜치를 입력하세요 (예: main, dev, origin/dev)')
  }

  stages {
    stage('Checkout') {
      steps {
        script {
          def cleanBranch = params.BRANCH_NAME.replaceFirst(/^origin\//, '')
          echo "📦 Checking out branch: ${cleanBranch}"
          git branch: cleanBranch, url: 'https://github.com/Muon-relativity/bloc_splash_ex.git'
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
