# Copyright (c) 2019 Mao Tsunekawa (MIT License)
# Copyright (c) 2018 y4m3 (MIT License)

FROM paperist/alpine-texlive-ja:latest

# install Noto Fonts
# original source: https://github.com/y4m3/docker-alpine-texlive-ja/blob/master/Dockerfile
RUN wget -q https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip && \
    wget -q https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip && \
    mkdir -p /usr/local/texlive/texmf-local/fonts/opentype/google/notosanscjk/ && \
    mkdir -p /usr/local/texlive/texmf-local/fonts/opentype/google/notoserifcjk/ && \
    unzip NotoSansCJKjp-hinted.zip -d /usr/local/texlive/texmf-local/fonts/opentype/google/notosanscjk/ && \
    unzip NotoSerifCJKjp-hinted.zip -d /usr/local/texlive/texmf-local/fonts/opentype/google/notoserifcjk/ && \
    rm NotoSansCJKjp-hinted.zip && \
    rm NotoSerifCJKjp-hinted.zip && \
    mktexlsr

RUN apk --no-cache del xz tar fontconfig-dev
# /install Noto Fonts


# install some commands for Visual Studio Code LaTeX Workshop Extensions
RUN  tlmgr update --self && tlmgr install  \
  chktex \ 
  latexindent \
  latexmk \
  texcount

CMD ["sh"]