allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

subprojects {
    plugins.withId("com.android.library") {
        val androidExtension = project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
        androidExtension?.apply {
            if (namespace != null && namespace!!.contains("flutter_inappwebview")) {
                buildTypes {
                    getByName("release") {
                        isMinifyEnabled = false
                        isShrinkResources = false
                    }
                    getByName("debug") {
                        isMinifyEnabled = false
                    }
                }
            }
        }
    }
    plugins.withId("com.android.application") {
        val androidExtension = project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
        androidExtension?.apply {
            if (namespace != null && namespace!!.contains("flutter_inappwebview")) {
                buildTypes {
                    getByName("release") {
                        isMinifyEnabled = false
                        isShrinkResources = false
                    }
                    getByName("debug") {
                        isMinifyEnabled = false
                    }
                }
            }
        }
    }
}