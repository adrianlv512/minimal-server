FROM crystallang/crystal:latest-alpine
COPY minimal-server.cr minimal-server.cr
RUN crystal build --no-debug --release --static minimal-server.cr

FROM scratch
COPY --from=0 minimal-server minimal-server
COPY static static
CMD ["./minimal-server"]
