FROM debian

RUN apt-get update &&\
   apt-get install --no-install-recommends -y \
     curl \
     git \
     wget \
     unzip

RUN apt-get install -y ruby-full
RUN gem update --system
RUN gem install bundler

RUN apt-get clean -y  && \
   apt-get autoclean -y  && \
   apt-get autoremove -y  && \
   rm -rf /usr/share/locale/*  && \
   rm -rf /var/cache/debconf/*-old  && \
   rm -rf /var/lib/apt/lists/*  && \
   rm -rf /usr/share/doc/*


COPY app/ /app
WORKDIR /app
RUN bundle install

ENV PORT 4567
EXPOSE 4567

ENTRYPOINT ["ruby"]
CMD ["app.rb"]
