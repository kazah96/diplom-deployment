
FROM "mcr.microsoft.com/mssql/server"
ENV SA_PASSWORD=poquePASS1234

COPY ./ ./app
WORKDIR /app

# RUN chmod +x ./entrypoint.sh
# CMD /bin/bash ./entrypoint.sh


RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \ 
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'poquePASS1234' -i dump/MainScript.sql \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'poquePASS1234' -i dump/fillTableWithData.sql \
    && pkill sqlservr 