load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")

def selenium_java_deps():
    netty_version = "4.1.100.Final"
    opentelemetry_version = "1.28.0"
    junit_jupiter_version = "5.10.0"
    junit_platform_version = "1.10.0"

    maven_install(
        artifacts = [
            "com.beust:jcommander:1.82",
            "com.github.javaparser:javaparser-core:3.25.4",
            maven.artifact(
                group = "com.github.spotbugs",
                artifact = "spotbugs",
                version = "4.7.3",
                exclusions = [
                    "org.slf4j:slf4j-api",
                ],
            ),
            "com.github.stephenc.jcip:jcip-annotations:1.0-1",
            "com.google.code.gson:gson:2.10.1",
            "com.google.guava:guava:32.1.2-jre",
            "com.google.auto:auto-common:1.2.2",
            "com.google.auto.service:auto-service:1.1.1",
            "com.google.auto.service:auto-service-annotations:1.1.1",
            "com.google.googlejavaformat:google-java-format:jar:1.17.0",
            "com.graphql-java:graphql-java:20.2",
            "com.graphql-java:java-dataloader:3.2.0",
            "dev.failsafe:failsafe:3.3.2",
            "io.grpc:grpc-context:1.57.1",
            "io.lettuce:lettuce-core:6.2.5.RELEASE",
            "io.netty:netty-buffer:%s" % netty_version,
            "io.netty:netty-codec-http:%s" % netty_version,
            "io.netty:netty-codec-http2:%s" % netty_version,
            "io.netty:netty-common:%s" % netty_version,
            "io.netty:netty-handler:%s" % netty_version,
            "io.netty:netty-handler-proxy:%s" % netty_version,
            "io.netty:netty-transport:%s" % netty_version,
            "io.opentelemetry:opentelemetry-api:%s" % opentelemetry_version,
            "io.opentelemetry:opentelemetry-context:%s" % opentelemetry_version,
            "io.opentelemetry:opentelemetry-exporter-logging:%s" % opentelemetry_version,
            "io.opentelemetry:opentelemetry-semconv:%s" % opentelemetry_version + "-alpha",
            "io.opentelemetry:opentelemetry-sdk:%s" % opentelemetry_version,
            "io.opentelemetry:opentelemetry-sdk-common:%s" % opentelemetry_version,
            "io.opentelemetry:opentelemetry-sdk-extension-autoconfigure:%s" % opentelemetry_version,
            "io.opentelemetry:opentelemetry-sdk-extension-autoconfigure-spi:%s" % opentelemetry_version,
            "io.opentelemetry:opentelemetry-sdk-testing:%s" % opentelemetry_version,
            "io.opentelemetry:opentelemetry-sdk-trace:%s" % opentelemetry_version,
            "io.ous:jtoml:2.0.0",
            "it.ozimov:embedded-redis:0.7.3",
            "net.bytebuddy:byte-buddy:1.14.5",
            "net.sourceforge.htmlunit:htmlunit-core-js:2.70.0",
            "org.apache.commons:commons-exec:1.3",
            "org.apache.logging.log4j:log4j-core:2.20.0",
            "org.assertj:assertj-core:3.24.2",
            "org.bouncycastle:bcpkix-jdk15on:1.70",
            "org.eclipse.mylyn.github:org.eclipse.egit.github.core:2.1.5",
            "org.hsqldb:hsqldb:2.7.2",
            "org.junit.jupiter:junit-jupiter-api:%s" % junit_jupiter_version,
            "org.junit.jupiter:junit-jupiter-engine:%s" % junit_jupiter_version,
            "org.junit.jupiter:junit-jupiter-params:%s" % junit_jupiter_version,
            "org.junit.platform:junit-platform-launcher:%s" % junit_platform_version,
            "org.junit.platform:junit-platform-reporting:%s" % junit_platform_version,
            "org.junit.platform:junit-platform-commons:%s" % junit_platform_version,
            "org.junit.platform:junit-platform-engine:%s" % junit_platform_version,
            "org.mockito:mockito-core:4.11.0",
            "org.mockito:mockito-inline:4.11.0",
            "org.redisson:redisson:3.23.2",
            "org.slf4j:slf4j-api:2.0.7",
            "org.slf4j:slf4j-jdk14:2.0.7",
            "org.zeromq:jeromq:0.5.3",
        ],
        excluded_artifacts = [
            "org.hamcrest:hamcrest-all",  # Replaced by hamcrest 2
            "org.hamcrest:hamcrest-core",
            "io.netty:netty-all",  # Depend on the actual things you need
        ],
        fail_on_missing_checksum = True,
        fail_if_repin_required = True,
        fetch_sources = True,
        strict_visibility = True,
        repositories = [
            "https://repo1.maven.org/maven2",
            "https://maven.google.com",
        ],
        maven_install_json = "@selenium//java:maven_install.json",
        version_conflict_policy = "pinned",
    )
