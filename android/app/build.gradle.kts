plugins {
    id("com.android.application")
    id("kotlin-android")

    // Flutter plugin
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.exam"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {

        // ✅ Java support
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11

        // ✅ REQUIRED for flutter_local_notifications
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {

        applicationId = "com.example.exam"

        // ✅ مهم لل notifications
        minSdk = flutter.minSdkVersion

        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {

            signingConfig =
                signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {

    // ✅ REQUIRED for notifications package
    coreLibraryDesugaring(
        "com.android.tools:desugar_jdk_libs:2.1.4"
    )
}
