pipeline {
  agent any

  parameters {
    string(name: 'BRANCH_NAME', defaultValue: 'main', description: '빌드할 브랜치를 입력하세요 (예: main, dev, feature/xxx)')
  }

  environment {
    GIT_REPO = 'https://github.com/Muon-relativity/bloc_splash_ex.git'
  }

  stages {
    stage('Checkout') {
      steps {
        echo "📦 Checking out branch: ${params.BRANCH_NAME}"
        git branch: "${params.BRANCH_NAME}", url: "${env.GIT_REPO}"
      }
    }

    stage('Install dependencies') {
      steps {
        echo "📥 Running flutter pub get"
        sh 'flutter pub get'
      }
    }

    stage('Analyze') {
      steps {
        echo "🔍 Running flutter analyze"
        sh 'flutter analyze || true'  // 실패해도 다음 단계로 진행
      }
    }

    stage('Test') {
      steps {
        echo "🧪 Running tests"
        sh 'flutter test || true'     // 실패해도 계속
      }
    }

    stage('Build APK') {
      steps {
        echo "🏗️ Building release APK"
        sh 'flutter build apk'
      }
    }

    stage('Archive APK') {
      steps {
        echo "📦 Archiving APK file"
        archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/*.apk', fingerprint: true
      }
    }
  }

  post {
    success {
      echo "✅ Build completed successfully for ${params.BRANCH_NAME}"
    }
    failure {
      echo "❌ Build failed on branch ${params.BRANCH_NAME}"
    }
  }
}
