FROM openjdk:17-alpine3.13

ARG ALLURE_VERSION="2.13.8"

WORKDIR /

RUN wget -q https://github.com/allure-framework/allure2/releases/download/${ALLURE_VERSION}/allure-${ALLURE_VERSION}.tgz \
    && tar -xf allure-${ALLURE_VERSION}.tgz \
    && rm /allure-${ALLURE_VERSION}.tgz \
    && mv /allure-${ALLURE_VERSION} /allure \
    && chmod -R +x /allure/bin

VOLUME [ "/allure/result" ]
VOLUME [ "/allure/report" ]

ENTRYPOINT [ "/allure/bin/allure", "generate", "/allure/result", "-o", "/allure/report", "--clean"]