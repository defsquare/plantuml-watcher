#!/bin/bash

clj -Mplantuml -e "(compile 'defsquare.plantuml)"

native-image \
    -cp "$(clojure -Spath):classes" \
    -H:Name=plantuml-watcher \
    -H:+ReportExceptionStackTraces \
    -H:+AllowDeprecatedBuilderClassesOnImageClasspath \
    -H:IncludeResources=".*/plantuml.skin$" \
    -O3 \
    --features=clj_easy.graal_build_time.InitClojureClasses \
    --verbose \
    --no-fallback \
    defsquare.plantuml
