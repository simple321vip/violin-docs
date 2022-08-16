FROM node:16.16-alpine3.15

LABEL author="XiangWeiGuan"

WORKDIR /docsify

RUN npm install -g docsify-cli@latest --registry https://registry.npm.taobao.org docsify-cli@latest

ENTRYPOINT docsify init ./docs && docsify serve ./docs